import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/xboard_models.freezed.dart';
part 'generated/xboard_models.g.dart';

/// Xboard 默认配置常量
class XboardConstants {
  XboardConstants._();

  /// 默认面板地址
  static const String defaultBaseUrl = 'https://sub.skugo.com/web';

  /// 高可用配置文件 URL 列表（YAML 格式）
  /// 按优先级排序，优先使用第一个成功的配置
  static const List<String> haConfigUrls = [
    'https://sub.flygo.top/fly/config.yaml',
    'https://sub.airgo.top/fly/config.yaml',
  ];

  /// 高可用请求超时时间
  static const Duration haTimeout = Duration(seconds: 10);

  /// 配置文件路径（相对于域名根目录）
  static const String configPath = '/fly/config.yaml';
}

/// 软件版本信息模型
class AppVersionInfo {
  /// 最新版本号（如 "1.2.3"）
  final String version;

  /// 更新日志/描述
  final String? changelog;

  /// 是否强制更新
  final bool forceUpdate;

  /// Windows 下载地址
  final String? windowsUrl;

  /// macOS Intel 下载地址
  final String? macosIntelUrl;

  /// macOS Apple Silicon (M系列芯片) 下载地址
  final String? macosArmUrl;

  /// Android 下载地址
  final String? androidUrl;

  /// iOS 使用说明
  final String? iosGuide;

  /// iOS 推荐应用名称（如 Shadowrocket）
  final String? iosAppName;

  /// iOS App Store 链接
  final String? iosAppStoreUrl;

  /// iOS 海外账号（可选，用于提示用户）
  final String? iosAccount;

  /// iOS 海外账号密码（可选）
  final String? iosPassword;

  /// Linux 下载地址
  final String? linuxUrl;

  const AppVersionInfo({
    required this.version,
    this.changelog,
    this.forceUpdate = false,
    this.windowsUrl,
    this.macosIntelUrl,
    this.macosArmUrl,
    this.androidUrl,
    this.iosGuide,
    this.iosAppName,
    this.iosAppStoreUrl,
    this.iosAccount,
    this.iosPassword,
    this.linuxUrl,
  });

  /// 从 YAML Map 解析
  factory AppVersionInfo.fromYaml(Map<String, dynamic> yaml) {
    return AppVersionInfo(
      version: yaml['version']?.toString() ?? '0.0.0',
      changelog: yaml['changelog']?.toString(),
      forceUpdate: yaml['force_update'] == true,
      windowsUrl: yaml['windows_url']?.toString(),
      macosIntelUrl: yaml['macos_intel_url']?.toString(),
      macosArmUrl: yaml['macos_arm_url']?.toString(),
      androidUrl: yaml['android_url']?.toString(),
      iosGuide: yaml['ios_guide']?.toString(),
      iosAppName: yaml['ios_app_name']?.toString(),
      iosAppStoreUrl: yaml['ios_app_store_url']?.toString(),
      iosAccount: yaml['ios_account']?.toString(),
      iosPassword: yaml['ios_password']?.toString(),
      linuxUrl: yaml['linux_url']?.toString(),
    );
  }

  /// 根据当前平台获取下载地址
  String? getDownloadUrlForPlatform(String platform) {
    switch (platform.toLowerCase()) {
      case 'windows':
        return windowsUrl;
      case 'macos_intel':
        return macosIntelUrl;
      case 'macos_arm':
        return macosArmUrl;
      case 'android':
        return androidUrl;
      case 'linux':
        return linuxUrl;
      default:
        return null;
    }
  }

  /// 是否有 iOS 海外账号信息
  bool get hasIOSAccount => iosAccount != null && iosAccount!.isNotEmpty;
}

/// 高可用配置文件模型
///
/// config.yaml 文件格式示例:
/// ```yaml
/// # Xboard 高可用配置文件
/// # 版本号（必填）- 配置文件版本
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
///   # 是否显示配置页面的新增按钮（默认 true）
///   show_profile_add: false
///   # 是否显示配置页面的编辑按钮（默认 true）
///   show_profile_edit: false
///
/// # 软件版本信息（可选）- 用于检查更新和软件下载
/// app:
///   # 最新版本号
///   version: "1.2.3"
///   # 更新日志
///   changelog: |
///     - 新增功能 A
///     - 修复 Bug B
///     - 优化性能 C
///   # 是否强制更新
///   force_update: false
///   # 各平台下载地址
///   windows_url: https://down.feego.top/file/windows.exe
///   android_url: https://down.feego.top/file/android.apk
///   linux_url: https://down.feego.top/file/linux.deb
///   macos_intel_url: https://down.feego.top/file/mac-intel.dmg
///   macos_arm_url: https://down.feego.top/file/mac-m.dmg
///   # iOS 配置
///   ios_guide: "需要登录海外 App Store 下载 Shadowrocket 使用"
///   ios_app_name: Shadowrocket
///   ios_app_store_url: https://apps.apple.com/app/shadowrocket/id932747118
///   ios_account: example@icloud.com
///   ios_password: your_password
///
/// # 公告信息是否显示
/// announcement_show: true
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

  /// 软件版本信息
  final AppVersionInfo? appVersion;

  /// 公告是否显示
  final bool announcementShow;

  /// 公告信息
  final String? announcement;

  /// 更新时间
  final String? updatedAt;

  XboardHAConfig({
    this.version = 1,
    required this.panelUrl,
    this.backupUrls = const [],
    XboardUIConfig? ui,
    this.appVersion,
    this.announcementShow = true,
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

    // 解析 app 版本配置
    AppVersionInfo? appVersionInfo;
    final appValue = yaml['app'];
    if (appValue is Map) {
      appVersionInfo = AppVersionInfo.fromYaml(
        Map<String, dynamic>.from(appValue),
      );
    }

    // 解析 announcement_show，默认为 true
    bool announcementShow = true;
    final showValue = yaml['announcement_show'];
    if (showValue is bool) {
      announcementShow = showValue;
    } else if (showValue != null) {
      announcementShow = showValue.toString().toLowerCase() == 'true';
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
      appVersion: appVersionInfo,
      announcementShow: announcementShow,
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

  /// 是否显示配置页面的新增按钮（FAB 和菜单中的新增选项）
  /// 默认为 true，设为 false 时隐藏新增按钮
  final bool showProfileAdd;

  /// 是否显示配置页面的编辑按钮（更多菜单中的编辑选项）
  /// 默认为 true，设为 false 时隐藏编辑按钮
  final bool showProfileEdit;

  const XboardUIConfig({
    this.title = 'Xboard',
    this.panelName = 'Xboard 面板',
    this.welcomeText = '连接您的订阅服务',
    this.footerText = '登录后可自动同步订阅到 FlClash',
    this.iconUrl,
    this.showProfileAdd = true,
    this.showProfileEdit = true,
  });

  /// 从 YAML Map 解析
  factory XboardUIConfig.fromYaml(Map<String, dynamic> yaml) {
    return XboardUIConfig(
      title: yaml['title']?.toString() ?? 'Xboard',
      panelName: yaml['panel_name']?.toString() ?? 'Xboard 面板',
      welcomeText: yaml['welcome_text']?.toString() ?? '连接您的订阅服务',
      footerText: yaml['footer_text']?.toString() ?? '登录后可自动同步订阅到 FlClash',
      iconUrl: yaml['icon_url']?.toString(),
      showProfileAdd: yaml['show_profile_add'] != false,
      showProfileEdit: yaml['show_profile_edit'] != false,
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
      showProfileAdd: json['showProfileAdd'] != false,
      showProfileEdit: json['showProfileEdit'] != false,
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
      'showProfileAdd': showProfileAdd,
      'showProfileEdit': showProfileEdit,
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

    /// 上次显示公告的配置版本号（用于避免重复弹窗）
    int? lastShownAnnouncementVersion,
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
