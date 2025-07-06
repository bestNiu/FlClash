import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/services/xboard_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fl_clash/state.dart';

part 'generated/xboard.g.dart';

@riverpod
class XboardAuth extends _$XboardAuth {
  XboardSubscribeInfo? _subscribeInfo;

  XboardSubscribeInfo? get subscribeInfo => _subscribeInfo;

  @override
  XboardAuthState build() {
    return const XboardAuthState();
  }

  /// 登录
  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await xboardService.login(
      email: email,
      password: password,
    );
    if (result.isSuccess) {
      // 登录成功后获取用户信息
      final userResult = await xboardService.getUserInfo();
      if (userResult.isSuccess) {
        state = state.copyWith(
          isLoggedIn: true,
          user: userResult.data,
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoggedIn: true,
          user: null,
          isLoading: false,
          error: null,
        );
      }
      // 登录成功后获取订阅信息
      final subscribeResult = await xboardService.getSubscribeInfo();
      if (subscribeResult.isSuccess) {
        _subscribeInfo = subscribeResult.data;
        // 自动导入订阅地址为 profile
        final url = _subscribeInfo?.subscribeUrl;
        if (url != null && url.isNotEmpty) {
          globalState.appController.addProfileFormURL(url);
        }
      }
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.message,
      );
    }
  }

  XboardSubscribeInfo? getSubscribeInfo() => _subscribeInfo;

  /// 登出
  Future<void> logout() async {
    await xboardService.logout();
    _subscribeInfo = null;
    state = const XboardAuthState();
  }

  /// 清除错误
  void clearError() {
    state = state.copyWith(error: null);
  }
}

// 订阅相关 provider 可后续补充，当前先移除未实现方法的 provider
