import 'dart:convert';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:fl_clash/xboard/models/xboard_models.dart' show XboardConstants;

part 'generated/xboard_provider.g.dart';

/// Xboard 配置 Provider（持久化）
@riverpod
class XboardConfigNotifier extends _$XboardConfigNotifier
    with AutoDisposeNotifierMixin {
  @override
  XboardConfig build() {
    return globalState.config.xboardConfig ?? const XboardConfig();
  }

  @override
  onUpdate(value) {
    globalState.config = globalState.config.copyWith(xboardConfig: value);
  }

  void updateConfig(XboardConfig Function(XboardConfig config) updater) {
    value = updater(state);
  }

  void setBaseUrl(String url) {
    value = state.copyWith(baseUrl: url);
  }

  void setAuth(String? token, String? authData) {
    value = state.copyWith(
      authToken: token,
      authData: authData,
      loginTime: token != null ? DateTime.now().millisecondsSinceEpoch : null,
    );
  }

  /// 清除认证信息（保留面板地址和 UI 配置）
  void clearAuth() {
    value = state.copyWith(
      authToken: null,
      authData: null,
      loginTime: null,
    );
  }

  /// 完全清除所有配置
  void clear() {
    value = const XboardConfig();
  }
}

/// Xboard 状态 Provider（运行时）
@riverpod
class XboardStateNotifier extends _$XboardStateNotifier {
  @override
  XboardState build() {
    // 初始化时检查登录状态并返回初始状态
    return _initAuth();
  }

  /// 初始化认证状态
  /// 返回初始的 XboardState，如果有有效认证信息则 isLoggedIn = true
  XboardState _initAuth() {
    final config = ref.read(xboardConfigProvider);

    // 恢复高可用缓存
    if (config.haResolvedUrl != null && config.haResolvedTime != null) {
      xboardApi.setHACache(config.haResolvedUrl, config.haResolvedTime);
    }

    // 恢复缓存的 UI 配置
    if (config.cachedUiConfig != null) {
      try {
        final uiConfigJson =
            Map<String, dynamic>.from(json.decode(config.cachedUiConfig!));
        final uiConfig = XboardUIConfig.fromJson(uiConfigJson);
        xboardApi.setCachedUiConfig(uiConfig, config.haConfigVersion);
      } catch (_) {
        // 解析失败，忽略
      }
    }

    // 检查是否有有效的认证信息
    final hasValidAuth = config.baseUrl != null && config.authData != null;
    
    if (hasValidAuth) {
      xboardApi.setBaseUrl(config.baseUrl!);
      xboardApi.setAuth(config.authData);
      // 有有效认证信息，初始状态设为已登录（后台会校验）
      return const XboardState(isLoggedIn: true);
    } else if (config.baseUrl == null) {
      // 没有配置过面板地址，使用默认地址
      xboardApi.setBaseUrl(XboardConstants.defaultBaseUrl);
    }
    
    return const XboardState();
  }

  /// 登录
  /// 登录成功后会自动执行以下流程：
  /// 1. 保存登录态
  /// 2. 自动拉取订阅地址
  /// 3. 解析 & 校验订阅
  /// 4. 无感更新配置
  /// 5. 提示成功状态
  Future<Result<bool>> login(
    String baseUrl,
    String email,
    String password,
  ) async {
    if (!ref.mounted) return Result.error('操作已取消');
    state = state.copyWith(isLoading: true, error: null);

    // 设置面板地址
    xboardApi.setBaseUrl(baseUrl);
    if (!ref.mounted) return Result.error('操作已取消');
    ref.read(xboardConfigProvider.notifier).setBaseUrl(baseUrl);

    // 调用登录接口
    final result = await xboardApi.login(email, password);

    if (!ref.mounted) return Result.error('操作已取消');
    if (result.isError) {
      state = state.copyWith(isLoading: false, error: result.message);
      return Result.error(result.message.isNotEmpty ? result.message : '登录失败');
    }

    final auth = result.data!;
    // 1. 保存登录态（认证信息）
    if (!ref.mounted) return Result.error('操作已取消');
    ref
        .read(xboardConfigProvider.notifier)
        .setAuth(auth.token, auth.authData);

    // 2. 获取用户信息和订阅信息（自动拉取订阅地址）
    await refresh();

    if (!ref.mounted) return Result.error('操作已取消');
    state = state.copyWith(isLoggedIn: true, isLoading: false, error: null);
    
    // 3-5. 自动同步订阅到 FlClash（解析 & 校验 & 无感更新配置）
    final config = ref.read(xboardConfigProvider);
    if (config.autoSyncSubscribe && state.subscribe?.hasValidSubscribe == true) {
      // 延迟执行，确保状态已更新
      Future.microtask(() async {
        if (!ref.mounted) return;
        final syncResult = await syncSubscribeToFlClash();
        if (syncResult.isSuccess) {
          // 自动应用配置
          globalState.appController.applyProfileDebounce(silence: true);
        }
      });
    }
    
    return Result.success(true);
  }

  /// 注册
  /// 注册成功后会自动执行与登录相同的流程
  Future<Result<bool>> register({
    required String baseUrl,
    required String email,
    required String password,
    String? inviteCode,
    String? emailCode,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    xboardApi.setBaseUrl(baseUrl);
    ref.read(xboardConfigProvider.notifier).setBaseUrl(baseUrl);

    final result = await xboardApi.register(
      email: email,
      password: password,
      inviteCode: inviteCode,
      emailCode: emailCode,
    );

    if (result.isError) {
      state = state.copyWith(isLoading: false, error: result.message);
      return Result.error(result.message.isNotEmpty ? result.message : '注册失败');
    }

    final auth = result.data!;
    // 1. 保存登录态
    ref
        .read(xboardConfigProvider.notifier)
        .setAuth(auth.token, auth.authData);

    // 2. 获取用户信息和订阅信息
    await refresh();

    state = state.copyWith(isLoggedIn: true, isLoading: false, error: null);
    
    // 3-5. 自动同步订阅（如果有有效订阅）
    final config = ref.read(xboardConfigProvider);
    if (config.autoSyncSubscribe && state.subscribe?.hasValidSubscribe == true) {
      Future.microtask(() async {
        final syncResult = await syncSubscribeToFlClash();
        if (syncResult.isSuccess) {
          globalState.appController.applyProfileDebounce(silence: true);
        }
      });
    }
    
    return Result.success(true);
  }

  /// 登出
  /// [clearSubscribe] 是否清除订阅配置，默认为 true
  Future<void> logout({bool clearSubscribe = true}) async {
    // 如果需要清除订阅，先清除关联的订阅配置
    if (clearSubscribe) {
      await _clearXboardSubscribe();
    }
    
    xboardApi.logout();
    ref.read(xboardConfigProvider.notifier).clearAuth();
    state = const XboardState();
  }
  
  /// 清除所有订阅配置
  Future<void> _clearXboardSubscribe() async {
    final profiles = ref.read(profilesProvider);
    
    // 删除所有订阅配置
    for (final profile in profiles) {
      await globalState.appController.deleteProfile(profile.id);
    }
  }

  /// 刷新用户数据
  Future<void> refresh() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, error: null);

    // 确保已认证
    final config = ref.read(xboardConfigProvider);
    if (config.authData == null) {
      if (!ref.mounted) return;
      state = state.copyWith(isLoading: false, isLoggedIn: false);
      return;
    }

    if (!xboardApi.isAuthenticated) {
      xboardApi.setBaseUrl(config.baseUrl ?? '');
      xboardApi.setAuth(config.authData);
    }

    try {
      // 并行获取用户信息、订阅信息和公告
      final results = await Future.wait([
        xboardApi.getUserInfo(),
        xboardApi.getSubscribe(),
        xboardApi.getNotices(),
      ]);

      // 异步操作完成后检查 ref 是否还有效
      if (!ref.mounted) return;

      final userResult = results[0] as Result<XboardUser>;
      final subscribeResult = results[1] as Result<XboardSubscribe>;
      final noticesResult = results[2] as Result<List<XboardNotice>>;

      if (userResult.isError) {
        // 认证可能已失效
        if (userResult.message.contains('401') ||
            userResult.message.contains('认证')) {
          await logout();
          if (!ref.mounted) return;
          state = state.copyWith(
            isLoading: false,
            error: '登录已过期，请重新登录',
          );
          return;
        }
      }

      if (!ref.mounted) return;
      state = state.copyWith(
        isLoggedIn: userResult.isSuccess,
        isLoading: false,
        user: userResult.data,
        subscribe: subscribeResult.data,
        notices: noticesResult.data ?? [],
        error: userResult.isError ? userResult.message : null,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// 检查登录状态
  Future<void> checkAuthStatus() async {
    if (!ref.mounted) return;
    final config = ref.read(xboardConfigProvider);
    if (config.authData == null || config.baseUrl == null) {
      if (!ref.mounted) return;
      state = state.copyWith(isLoggedIn: false);
      return;
    }

    xboardApi.setBaseUrl(config.baseUrl!);
    xboardApi.setAuth(config.authData);

    await refresh();
  }

  /// 同步订阅到 FlClash
  Future<Result<bool>> syncSubscribeToFlClash() async {
    final subscribe = state.subscribe;
    if (subscribe == null) {
      return Result.error('未获取到订阅信息');
    }

    if (!subscribe.hasValidSubscribe) {
      return Result.error('没有有效的订阅');
    }

    final subscribeUrl = subscribe.subscribeUrl!;
    final planName = subscribe.plan?.name ?? 'Xboard 订阅';

    try {
      // 检查是否已存在相同订阅
      final profiles = ref.read(profilesProvider);
      final existingProfile = profiles.where((p) => p.url == subscribeUrl);

      if (existingProfile.isNotEmpty) {
        // 已存在，触发更新并设为当前配置
        final profile = existingProfile.first;
        await globalState.appController.updateProfile(profile);
        ref.read(currentProfileIdProvider.notifier).value = profile.id;
        return Result.success(true);
      }

      // 创建新 Profile（不跳转到配置页面，登录成功后应跳转到仪表盘）
      await globalState.appController.addProfileFormURL(subscribeUrl, navigateToProfiles: false);

      // 更新标签为套餐名
      final newProfiles = ref.read(profilesProvider);
      final newProfile = newProfiles.where((p) => p.url == subscribeUrl);
      if (newProfile.isNotEmpty) {
        ref.read(profilesProvider.notifier).setProfile(
              newProfile.first.copyWith(label: planName),
            );
      }

      return Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 打开购买页面
  Future<void> openPurchasePage() async {
    final config = ref.read(xboardConfigProvider);
    if (config.baseUrl == null) return;

    final url = '${config.baseUrl}/#/plan';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  /// 打开用户中心
  Future<void> openUserCenter() async {
    final config = ref.read(xboardConfigProvider);
    if (config.baseUrl == null) return;

    final url = '${config.baseUrl}/#/dashboard';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  /// 设置错误信息
  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  /// 清除错误
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// 是否已登录 Xboard
@riverpod
bool isXboardLoggedIn(ref) {
  final state = ref.watch(xboardStateProvider);
  return state.isLoggedIn;
}

/// Xboard 用户信息
@riverpod
XboardUser? xboardUser(ref) {
  final state = ref.watch(xboardStateProvider);
  return state.user;
}

/// Xboard 订阅信息
@riverpod
XboardSubscribe? xboardSubscribe(ref) {
  final state = ref.watch(xboardStateProvider);
  return state.subscribe;
}

/// 是否有有效订阅
@riverpod
bool hasValidXboardSubscribe(ref) {
  final subscribe = ref.watch(xboardSubscribeProvider);
  return subscribe?.hasValidSubscribe ?? false;
}
