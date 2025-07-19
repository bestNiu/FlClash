// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/xboard.freezed.dart';
part 'generated/xboard.g.dart';

// Xboard用户信息
@freezed
class XboardUser with _$XboardUser {
  const factory XboardUser({
    required String email,
    @JsonKey(name: 'transfer_enable') @Default(0) int transferEnable,
    @JsonKey(name: 'last_login_at') @Default(0) int lastLoginAt,
    @JsonKey(name: 'created_at') @Default(0) int createdAt,
    @Default(false) bool banned,
    @JsonKey(name: 'remind_expire') @Default(true) bool remindExpire,
    @JsonKey(name: 'remind_traffic') @Default(true) bool remindTraffic,
    @JsonKey(name: 'expired_at') @Default(0) int expiredAt,
    @Default(0) int balance,
    @JsonKey(name: 'commission_balance') @Default(0) int commissionBalance,
    @JsonKey(name: 'plan_id') @Default(0) int planId,
    int? discount,
    @JsonKey(name: 'commission_rate') int? commissionRate,
    @JsonKey(name: 'telegram_id') String? telegramId,
    @Default("") String uuid,
    @JsonKey(name: 'avatar_url') @Default("") String avatarUrl,
  }) = _XboardUser;

  factory XboardUser.fromJson(Map<String, Object?> json) =>
      _$XboardUserFromJson(json);
}

// Xboard订阅信息
@freezed
class XboardSubscription with _$XboardSubscription {
  const factory XboardSubscription({
    required int id,
    required String name,
    required int price,
    required int transferEnable,
    required int monthPrice,
    required int quarterPrice,
    required int halfYearPrice,
    required int yearPrice,
    required int twoYearPrice,
    required int threeYearPrice,
    required int onetimePrice,
    required int resetPrice,
    @Default("") String content,
    @Default(true) bool show,
    @Default(0) int sort,
    @Default(false) bool renew,
    @Default(false) bool resetTrafficMethod,
    @Default(0) int capacity,
    @Default(0) int speeds,
  }) = _XboardSubscription;

  factory XboardSubscription.fromJson(Map<String, Object?> json) =>
      _$XboardSubscriptionFromJson(json);
}

// Xboard节点信息
@freezed
class XboardNode with _$XboardNode {
  const factory XboardNode({
    required int id,
    required String name,
    required String server,
    required int serverPort,
    required String cipher,
    required String obfs,
    required String obfsSettings,
    required String protocol,
    required String protocolSettings,
    @Default("") String tags,
    @Default(1) int rate,
    @Default(true) bool show,
    @Default(0) int sort,
    @Default("") String remark,
    @Default("shadowsocks") String type,
    @Default("") String networkSettings,
    @Default("") String tlsSettings,
    @Default("") String ruleSettings,
    @Default("") String dnsSettings,
  }) = _XboardNode;

  factory XboardNode.fromJson(Map<String, Object?> json) =>
      _$XboardNodeFromJson(json);
}

// Xboard登录响应
@freezed
class XboardLoginResponse with _$XboardLoginResponse {
  const factory XboardLoginResponse({
    required String status,
    required String message,
    XboardLoginData? data,
    String? error,
  }) = _XboardLoginResponse;

  factory XboardLoginResponse.fromJson(Map<String, Object?> json) =>
      _$XboardLoginResponseFromJson(json);
}

// 登录数据
@freezed
class XboardLoginData with _$XboardLoginData {
  const factory XboardLoginData({
    required String token,
    @JsonKey(name: 'auth_data') required String authData,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
  }) = _XboardLoginData;

  factory XboardLoginData.fromJson(Map<String, Object?> json) =>
      _$XboardLoginDataFromJson(json);
}

// Xboard通用API响应 - 移除泛型，使用dynamic
@freezed
class XboardApiResponse with _$XboardApiResponse {
  const factory XboardApiResponse({
    required bool success,
    required String message,
    dynamic data,
  }) = _XboardApiResponse;

  factory XboardApiResponse.fromJson(Map<String, Object?> json) =>
      _$XboardApiResponseFromJson(json);
}

// 针对特定类型的API响应
@freezed
class XboardUserResponse with _$XboardUserResponse {
  const factory XboardUserResponse({
    required String status,
    required String message,
    XboardUser? data,
    String? error,
  }) = _XboardUserResponse;

  factory XboardUserResponse.fromJson(Map<String, Object?> json) =>
      _$XboardUserResponseFromJson(json);
}

@freezed
class XboardSubscriptionsResponse with _$XboardSubscriptionsResponse {
  const factory XboardSubscriptionsResponse({
    required bool success,
    required String message,
    @Default([]) List<XboardSubscription> data,
  }) = _XboardSubscriptionsResponse;

  factory XboardSubscriptionsResponse.fromJson(Map<String, Object?> json) =>
      _$XboardSubscriptionsResponseFromJson(json);
}

@freezed
class XboardNodesResponse with _$XboardNodesResponse {
  const factory XboardNodesResponse({
    required bool success,
    required String message,
    @Default([]) List<XboardNode> data,
  }) = _XboardNodesResponse;

  factory XboardNodesResponse.fromJson(Map<String, Object?> json) =>
      _$XboardNodesResponseFromJson(json);
}

// Xboard订阅信息
@freezed
class XboardSubscriptionInfo with _$XboardSubscriptionInfo {
  const factory XboardSubscriptionInfo({
    @JsonKey(name: 'plan_id') required int planId,
    required String token,
    @JsonKey(name: 'expired_at') required int expiredAt,
    required int u,
    required int d,
    @JsonKey(name: 'transfer_enable') required int transferEnable,
    required String email,
    required String uuid,
    XboardPlan? plan,
    @JsonKey(name: 'subscribe_url') required String subscribeUrl,
    @JsonKey(name: 'reset_day') int? resetDay,
  }) = _XboardSubscriptionInfo;

  factory XboardSubscriptionInfo.fromJson(Map<String, Object?> json) =>
      _$XboardSubscriptionInfoFromJson(json);
}

// 订阅计划详情
@freezed
class XboardPlan with _$XboardPlan {
  const factory XboardPlan({
    required int id,
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'transfer_enable') required int transferEnable,
    required String name,
    @JsonKey(name: 'speed_limit') int? speedLimit,
    @Default(true) bool show,
    int? sort,
    @Default(true) bool renew,
    @Default("") String content,
    @JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,
    @JsonKey(name: 'capacity_limit') int? capacityLimit,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'updated_at') required int updatedAt,
    required XboardPlanPrices prices,
    @Default(1) int sell,
    @JsonKey(name: 'device_limit') @Default(1) int deviceLimit,
  }) = _XboardPlan;

  factory XboardPlan.fromJson(Map<String, Object?> json) =>
      _$XboardPlanFromJson(json);
}

// 订阅价格
@freezed
class XboardPlanPrices with _$XboardPlanPrices {
  const factory XboardPlanPrices({
    required String monthly,
    required String quarterly,
    @JsonKey(name: 'half_yearly') required String halfYearly,
    required String yearly,
    @JsonKey(name: 'two_yearly') required String twoYearly,
    @JsonKey(name: 'three_yearly') required String threeYearly,
    required String onetime,
    @JsonKey(name: 'reset_traffic') required String resetTraffic,
  }) = _XboardPlanPrices;

  factory XboardPlanPrices.fromJson(Map<String, Object?> json) =>
      _$XboardPlanPricesFromJson(json);
}

@freezed
class XboardSubscriptionUrlResponse with _$XboardSubscriptionUrlResponse {
  const factory XboardSubscriptionUrlResponse({
    required String status,
    required String message,
    XboardSubscriptionInfo? data,
    String? error,
  }) = _XboardSubscriptionUrlResponse;

  factory XboardSubscriptionUrlResponse.fromJson(Map<String, Object?> json) =>
      _$XboardSubscriptionUrlResponseFromJson(json);
}

// Xboard签到响应
@freezed
class XboardCheckinResponse with _$XboardCheckinResponse {
  const factory XboardCheckinResponse({
    required bool success,
    required String message,
    @Default(0) int data,
  }) = _XboardCheckinResponse;

  factory XboardCheckinResponse.fromJson(Map<String, Object?> json) =>
      _$XboardCheckinResponseFromJson(json);
}

// Xboard订单信息
@freezed
class XboardOrder with _$XboardOrder {
  const factory XboardOrder({
    required String tradeNo,
    required int totalAmount,
    required String status,
    @Default("") String callbackNo,
    @Default(0) int createdAt,
    @Default(0) int updatedAt,
  }) = _XboardOrder;

  factory XboardOrder.fromJson(Map<String, Object?> json) =>
      _$XboardOrderFromJson(json);
}

@freezed
class XboardOrderResponse with _$XboardOrderResponse {
  const factory XboardOrderResponse({
    required bool success,
    required String message,
    XboardOrder? data,
  }) = _XboardOrderResponse;

  factory XboardOrderResponse.fromJson(Map<String, Object?> json) =>
      _$XboardOrderResponseFromJson(json);
}

// Xboard购买请求
@freezed
class XboardPurchaseRequest with _$XboardPurchaseRequest {
  const factory XboardPurchaseRequest({
    required int planId,
    required String period,
    @Default("") String couponCode,
  }) = _XboardPurchaseRequest;

  factory XboardPurchaseRequest.fromJson(Map<String, Object?> json) =>
      _$XboardPurchaseRequestFromJson(json);
}
