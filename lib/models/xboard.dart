import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/xboard.freezed.dart';
part 'generated/xboard.g.dart';

@freezed
class XboardUser with _$XboardUser {
  const factory XboardUser({
    required String email,
    required String uuid,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'transfer_enable') required int transferEnable,
    @JsonKey(name: 'last_login_at') required int lastLoginAt,
    @JsonKey(name: 'created_at') required int createdAt,
    required bool banned,
    @JsonKey(name: 'remind_expire') required bool remindExpire,
    @JsonKey(name: 'remind_traffic') required bool remindTraffic,
    @JsonKey(name: 'expired_at') required int expiredAt,
    required int balance,
    @JsonKey(name: 'commission_balance') required int commissionBalance,
    @JsonKey(name: 'plan_id') required int planId,
    int? discount,
    @JsonKey(name: 'commission_rate') int? commissionRate,
    @JsonKey(name: 'telegram_id') int? telegramId,
    required XboardPlan plan,
  }) = _XboardUser;

  factory XboardUser.fromJson(Map<String, Object?> json) =>
      _$XboardUserFromJson(json);
}

@freezed
class XboardSubscription with _$XboardSubscription {
  const factory XboardSubscription({
    required String id,
    required String name,
    required String url,
    @Default(false) bool isActive,
    DateTime? expireAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _XboardSubscription;

  factory XboardSubscription.fromJson(Map<String, Object?> json) =>
      _$XboardSubscriptionFromJson(json);
}

@freezed
class XboardAuthState with _$XboardAuthState {
  const factory XboardAuthState({
    @Default(false) bool isLoggedIn,
    XboardUser? user,
    @Default(false) bool isLoading,
    String? error,
  }) = _XboardAuthState;
}

@freezed
class XboardSession with _$XboardSession {
  const factory XboardSession({
    required String token,
    required String authData,
    @Default(false) bool isAdmin,
  }) = _XboardSession;

  factory XboardSession.fromJson(Map<String, Object?> json) =>
      _$XboardSessionFromJson(json);
}

@freezed
class XboardPlan with _$XboardPlan {
  const factory XboardPlan({
    required int id,
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'transfer_enable') required int transferEnable,
    required String name,
    @JsonKey(name: 'speed_limit') int? speedLimit,
    required bool show,
    int? sort,
    required bool renew,
    required String content,
    @JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,
    @JsonKey(name: 'capacity_limit') int? capacityLimit,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'updated_at') required int updatedAt,
    required Map<String, String> prices,
    required int sell,
    @JsonKey(name: 'device_limit') required int deviceLimit,
  }) = _XboardPlan;

  factory XboardPlan.fromJson(Map<String, Object?> json) =>
      _$XboardPlanFromJson(json);
}

@freezed
class XboardSubscribeInfo with _$XboardSubscribeInfo {
  const factory XboardSubscribeInfo({
    @JsonKey(name: 'subscribe_url') required String subscribeUrl,
    @JsonKey(name: 'plan_id') required int planId,
    required String token,
    @JsonKey(name: 'expired_at') required int expiredAt,
    required int u,
    required int d,
    @JsonKey(name: 'transfer_enable') required int transferEnable,
    required String email,
    required String uuid,
    required XboardPlan plan,
    @JsonKey(name: 'reset_day') required int resetDay,
  }) = _XboardSubscribeInfo;

  factory XboardSubscribeInfo.fromJson(Map<String, Object?> json) =>
      _$XboardSubscribeInfoFromJson(json);
}
