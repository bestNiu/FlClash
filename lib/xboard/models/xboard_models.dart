import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/xboard_models.freezed.dart';
part 'generated/xboard_models.g.dart';

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
    String? baseUrl,
    String? authToken,
    String? authData,
    int? loginTime,
    @Default(true) bool autoSyncSubscribe,
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

