import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/xboard_models.freezed.dart';
part 'generated/xboard_models.g.dart';

/// Xboard 默认配置常量
class XboardConstants {
  XboardConstants._();

  /// 默认面板地址
  static const String defaultBaseUrl = 'https://www.fly2025.com';

  /// 高可用配置文件 URL 列表（YAML 格式）
  /// 按优先级排序，优先使用第一个成功的配置
  static const List<String> haConfigUrls = [
    'https://www.fly2026.com/fly/config.yaml',
    'https://www.fly2025.com/fly/config.yaml',
  ];

  /// 高可用请求超时时间
  static const Duration haTimeout = Duration(seconds: 10);

  /// 配置文件路径（相对于域名根目录）
  static const String configPath = '/fly/config.yaml';
}

/// 高可用配置文件模型
///
/// config.yaml 文件格式示例:
/// ```yaml
/// # Xboard 高可用配置文件
/// # 版本号（必填）
/// version: 1
///
/// # 面板真实地址（必填）
/// panel_url: https://www.fly2026.com
///
/// # 备用面板地址列表（可选）
/// backup_urls:
///   - https://backup1.fly2025.com
///   - https://backup2.fly2025.com
///
/// # 面板显示配置（可选）
/// ui:
///   # 面板标题（显示在页面顶部）
///   title: Xboard
///   # 面板名称（显示在登录页）
///   panel_name: Xboard 面板
///   # 欢迎语（显示在面板名称下方）
///   welcome_text: 连接您的订阅服务
///   # 面板图标 URL（可选）
///   icon_url: https://example.com/icon.png
///
/// # 公告信息（可选）
/// announcement: "欢迎使用 Fly 服务"
///
/// # 配置更新时间（可选）
/// updated_at: 2025-12-31
/// ```
class XboardHAConfig {
  /// 配置版本
  final int version;

  /// 面板真实地址
  final String panelUrl;

  /// 备用面板地址列表
  final List<String> backupUrls;

  /// UI 配置
  final XboardUIConfig ui;

  /// 公告信息
  final String? announcement;

  /// 更新时间
  final String? updatedAt;

  XboardHAConfig({
    this.version = 1,
    required this.panelUrl,
    this.backupUrls = const [],
    XboardUIConfig? ui,
    this.announcement,
    this.updatedAt,
  }) : ui = ui ?? const XboardUIConfig();

  /// 从 YAML Map 解析
  factory XboardHAConfig.fromYaml(Map<String, dynamic> yaml) {
    // 解析 version，兼容字符串和整数
    int version = 1;
    final versionValue = yaml['version'];
    if (versionValue is int) {
      version = versionValue;
    } else if (versionValue != null) {
      version = int.tryParse(versionValue.toString()) ?? 1;
    }

    // 解析 ui 配置
    XboardUIConfig uiConfig = const XboardUIConfig();
    final uiValue = yaml['ui'];
    if (uiValue is Map) {
      uiConfig = XboardUIConfig.fromYaml(Map<String, dynamic>.from(uiValue));
    }

    return XboardHAConfig(
      version: version,
      panelUrl: yaml['panel_url']?.toString() ?? XboardConstants.defaultBaseUrl,
      backupUrls:
          (yaml['backup_urls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      ui: uiConfig,
      announcement: yaml['announcement']?.toString(),
      updatedAt: yaml['updated_at']?.toString(),
    );
  }

  /// 获取所有可用的面板地址（主地址 + 备用地址）
  List<String> get allUrls => [panelUrl, ...backupUrls];
}

/// Xboard UI 配置
class XboardUIConfig {
  /// 面板标题（显示在页面顶部导航栏）
  final String title;

  /// 面板名称（显示在登录页）
  final String panelName;

  /// 欢迎语（显示在面板名称下方）
  final String welcomeText;

  /// 底部提示文字（显示在登录表单下方）
  final String footerText;

  /// 面板图标 URL（可选）
  final String? iconUrl;

  const XboardUIConfig({
    this.title = 'Xboard',
    this.panelName = 'Xboard 面板',
    this.welcomeText = '连接您的订阅服务',
    this.footerText = '登录后可自动同步订阅到 FlClash',
    this.iconUrl,
  });

  /// 从 YAML Map 解析
  factory XboardUIConfig.fromYaml(Map<String, dynamic> yaml) {
    return XboardUIConfig(
      title: yaml['title']?.toString() ?? 'Xboard',
      panelName: yaml['panel_name']?.toString() ?? 'Xboard 面板',
      welcomeText: yaml['welcome_text']?.toString() ?? '连接您的订阅服务',
      footerText: yaml['footer_text']?.toString() ?? '登录后可自动同步订阅到 FlClash',
      iconUrl: yaml['icon_url']?.toString(),
    );
  }

  /// 从 JSON Map 解析（用于从持久化存储恢复）
  factory XboardUIConfig.fromJson(Map<String, dynamic> json) {
    return XboardUIConfig(
      title: json['title']?.toString() ?? 'Xboard',
      panelName: json['panelName']?.toString() ?? 'Xboard 面板',
      welcomeText: json['welcomeText']?.toString() ?? '连接您的订阅服务',
      footerText: json['footerText']?.toString() ?? '登录后可自动同步订阅到 FlClash',
      iconUrl: json['iconUrl']?.toString(),
    );
  }

  /// 转换为 JSON Map（用于持久化存储）
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'panelName': panelName,
      'welcomeText': welcomeText,
      'footerText': footerText,
      'iconUrl': iconUrl,
    };
  }
}

/// Xboard 认证信息
@freezed
abstract class XboardAuth with _$XboardAuth {
  const factory XboardAuth({
    required String token,
    @JsonKey(name: 'auth_data') required String authData,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
  }) = _XboardAuth;

  factory XboardAuth.fromJson(Map<String, Object?> json) =>
      _$XboardAuthFromJson(json);
}

/// Xboard 用户信息
@freezed
abstract class XboardUser with _$XboardUser {
  const factory XboardUser({
    required String email,
    @JsonKey(name: 'transfer_enable') @Default(0) int transferEnable,
    @JsonKey(name: 'last_login_at') int? lastLoginAt,
    @JsonKey(name: 'created_at') int? createdAt,
    @Default(false) bool banned,
    @JsonKey(name: 'remind_expire') @Default(true) bool remindExpire,
    @JsonKey(name: 'remind_traffic') @Default(true) bool remindTraffic,
    @JsonKey(name: 'expired_at') int? expiredAt,
    @Default(0) int balance,
    @JsonKey(name: 'commission_balance') @Default(0) int commissionBalance,
    @JsonKey(name: 'plan_id') int? planId,
    double? discount,
    @JsonKey(name: 'commission_rate') double? commissionRate,
    @JsonKey(name: 'telegram_id') int? telegramId,
    String? uuid,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _XboardUser;

  factory XboardUser.fromJson(Map<String, Object?> json) =>
      _$XboardUserFromJson(json);
}

/// Xboard 套餐信息
@freezed
abstract class XboardPlan with _$XboardPlan {
  const factory XboardPlan({
    required int id,
    @JsonKey(name: 'group_id') int? groupId,
    @JsonKey(name: 'transfer_enable') @Default(0) int transferEnable,
    required String name,
    Map<String, String>? prices,
    @Default(1) int sell,
    @JsonKey(name: 'speed_limit') int? speedLimit,
    @JsonKey(name: 'device_limit') int? deviceLimit,
    @Default(true) bool show,
    int? sort,
    @Default(true) bool renew,
    String? content,
    List<String>? tags,
    @JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,
    @JsonKey(name: 'capacity_limit') int? capacityLimit,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
  }) = _XboardPlan;

  factory XboardPlan.fromJson(Map<String, Object?> json) =>
      _$XboardPlanFromJson(json);
}

/// Xboard 订阅信息
@freezed
abstract class XboardSubscribe with _$XboardSubscribe {
  const factory XboardSubscribe({
    @JsonKey(name: 'plan_id') int? planId,
    required String token,
    @JsonKey(name: 'expired_at') int? expiredAt,
    @Default(0) int u,
    @Default(0) int d,
    @JsonKey(name: 'transfer_enable') @Default(0) int transferEnable,
    String? email,
    String? uuid,
    @JsonKey(name: 'device_limit') int? deviceLimit,
    @JsonKey(name: 'speed_limit') int? speedLimit,
    @JsonKey(name: 'next_reset_at') int? nextResetAt,
    XboardPlan? plan,
    @JsonKey(name: 'subscribe_url') String? subscribeUrl,
    @JsonKey(name: 'reset_day') int? resetDay,
  }) = _XboardSubscribe;

  factory XboardSubscribe.fromJson(Map<String, Object?> json) =>
      _$XboardSubscribeFromJson(json);
}

/// Xboard 公告
@freezed
abstract class XboardNotice with _$XboardNotice {
  const factory XboardNotice({
    required int id,
    int? sort,
    required String title,
    required String content,
    @Default(true) bool show,
    @JsonKey(name: 'img_url') String? imgUrl,
    @Default([]) List<String> tags,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
  }) = _XboardNotice;

  factory XboardNotice.fromJson(Map<String, Object?> json) =>
      _$XboardNoticeFromJson(json);
}

/// Xboard 配置（持久化存储）
@freezed
abstract class XboardConfig with _$XboardConfig {
  const factory XboardConfig({
    /// 面板地址（实际使用的地址）
    String? baseUrl,

    /// 认证 Token
    String? authToken,

    /// 认证数据
    String? authData,

    /// 登录时间戳
    int? loginTime,

    /// 是否自动同步订阅
    @Default(true) bool autoSyncSubscribe,

    /// 是否启用高可用模式
    @Default(true) bool enableHA,

    /// 高可用解析到的真实地址（缓存）
    String? haResolvedUrl,

    /// 高可用解析时间戳
    int? haResolvedTime,

    /// 高可用配置版本号（用于检测更新）
    int? haConfigVersion,

    /// 缓存的 UI 配置（JSON 格式）
    String? cachedUiConfig,
  }) = _XboardConfig;

  factory XboardConfig.fromJson(Map<String, Object?> json) =>
      _$XboardConfigFromJson(json);
}

/// Xboard 运行时状态
@freezed
abstract class XboardState with _$XboardState {
  const factory XboardState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    XboardUser? user,
    XboardSubscribe? subscribe,
    @Default([]) List<XboardNotice> notices,
    String? error,
  }) = _XboardState;

  factory XboardState.fromJson(Map<String, Object?> json) =>
      _$XboardStateFromJson(json);
}

/// 扩展方法
extension XboardSubscribeExt on XboardSubscribe {
  /// 已使用流量（字节）
  int get usedTraffic => u + d;

  /// 流量使用进度 (0.0 - 1.0)
  double get trafficProgress {
    if (transferEnable <= 0) return 0;
    return usedTraffic / transferEnable;
  }

  /// 是否有有效订阅
  bool get hasValidSubscribe {
    if (planId == null || planId == 0) return false;
    if (subscribeUrl == null || subscribeUrl!.isEmpty) return false;
    // 检查是否过期
    if (expiredAt != null && expiredAt! > 0) {
      final expireDate = DateTime.fromMillisecondsSinceEpoch(expiredAt! * 1000);
      if (expireDate.isBefore(DateTime.now())) return false;
    }
    return true;
  }

  /// 是否已过期
  bool get isExpired {
    if (expiredAt == null || expiredAt == 0) return false;
    final expireDate = DateTime.fromMillisecondsSinceEpoch(expiredAt! * 1000);
    return expireDate.isBefore(DateTime.now());
  }
}

extension XboardUserExt on XboardUser {
  /// 余额（元）
  double get balanceYuan => balance / 100;

  /// 是否有有效套餐
  bool get hasPlan => planId != null && planId! > 0;
}
