// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../xboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XboardAuth _$XboardAuthFromJson(Map<String, dynamic> json) => _XboardAuth(
  token: json['token'] as String,
  authData: json['auth_data'] as String,
  isAdmin: json['is_admin'] as bool? ?? false,
);

Map<String, dynamic> _$XboardAuthToJson(_XboardAuth instance) =>
    <String, dynamic>{
      'token': instance.token,
      'auth_data': instance.authData,
      'is_admin': instance.isAdmin,
    };

_XboardUser _$XboardUserFromJson(Map<String, dynamic> json) => _XboardUser(
  email: json['email'] as String,
  transferEnable: (json['transfer_enable'] as num?)?.toInt() ?? 0,
  lastLoginAt: (json['last_login_at'] as num?)?.toInt(),
  createdAt: (json['created_at'] as num?)?.toInt(),
  banned: json['banned'] as bool? ?? false,
  remindExpire: json['remind_expire'] as bool? ?? true,
  remindTraffic: json['remind_traffic'] as bool? ?? true,
  expiredAt: (json['expired_at'] as num?)?.toInt(),
  balance: (json['balance'] as num?)?.toInt() ?? 0,
  commissionBalance: (json['commission_balance'] as num?)?.toInt() ?? 0,
  planId: (json['plan_id'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toDouble(),
  commissionRate: (json['commission_rate'] as num?)?.toDouble(),
  telegramId: (json['telegram_id'] as num?)?.toInt(),
  uuid: json['uuid'] as String?,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$XboardUserToJson(_XboardUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'transfer_enable': instance.transferEnable,
      'last_login_at': instance.lastLoginAt,
      'created_at': instance.createdAt,
      'banned': instance.banned,
      'remind_expire': instance.remindExpire,
      'remind_traffic': instance.remindTraffic,
      'expired_at': instance.expiredAt,
      'balance': instance.balance,
      'commission_balance': instance.commissionBalance,
      'plan_id': instance.planId,
      'discount': instance.discount,
      'commission_rate': instance.commissionRate,
      'telegram_id': instance.telegramId,
      'uuid': instance.uuid,
      'avatar_url': instance.avatarUrl,
    };

_XboardPlan _$XboardPlanFromJson(Map<String, dynamic> json) => _XboardPlan(
  id: (json['id'] as num).toInt(),
  groupId: (json['group_id'] as num?)?.toInt(),
  transferEnable: (json['transfer_enable'] as num?)?.toInt() ?? 0,
  name: json['name'] as String,
  prices: (json['prices'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  sell: (json['sell'] as num?)?.toInt() ?? 1,
  speedLimit: (json['speed_limit'] as num?)?.toInt(),
  deviceLimit: (json['device_limit'] as num?)?.toInt(),
  show: json['show'] as bool? ?? true,
  sort: (json['sort'] as num?)?.toInt(),
  renew: json['renew'] as bool? ?? true,
  content: json['content'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  resetTrafficMethod: json['reset_traffic_method'] as String?,
  capacityLimit: (json['capacity_limit'] as num?)?.toInt(),
  createdAt: (json['created_at'] as num?)?.toInt(),
  updatedAt: (json['updated_at'] as num?)?.toInt(),
);

Map<String, dynamic> _$XboardPlanToJson(_XboardPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'transfer_enable': instance.transferEnable,
      'name': instance.name,
      'prices': instance.prices,
      'sell': instance.sell,
      'speed_limit': instance.speedLimit,
      'device_limit': instance.deviceLimit,
      'show': instance.show,
      'sort': instance.sort,
      'renew': instance.renew,
      'content': instance.content,
      'tags': instance.tags,
      'reset_traffic_method': instance.resetTrafficMethod,
      'capacity_limit': instance.capacityLimit,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_XboardSubscribe _$XboardSubscribeFromJson(Map<String, dynamic> json) =>
    _XboardSubscribe(
      planId: (json['plan_id'] as num?)?.toInt(),
      token: json['token'] as String,
      expiredAt: (json['expired_at'] as num?)?.toInt(),
      u: (json['u'] as num?)?.toInt() ?? 0,
      d: (json['d'] as num?)?.toInt() ?? 0,
      transferEnable: (json['transfer_enable'] as num?)?.toInt() ?? 0,
      email: json['email'] as String?,
      uuid: json['uuid'] as String?,
      deviceLimit: (json['device_limit'] as num?)?.toInt(),
      speedLimit: (json['speed_limit'] as num?)?.toInt(),
      nextResetAt: (json['next_reset_at'] as num?)?.toInt(),
      plan: json['plan'] == null
          ? null
          : XboardPlan.fromJson(json['plan'] as Map<String, dynamic>),
      subscribeUrl: json['subscribe_url'] as String?,
      resetDay: (json['reset_day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XboardSubscribeToJson(_XboardSubscribe instance) =>
    <String, dynamic>{
      'plan_id': instance.planId,
      'token': instance.token,
      'expired_at': instance.expiredAt,
      'u': instance.u,
      'd': instance.d,
      'transfer_enable': instance.transferEnable,
      'email': instance.email,
      'uuid': instance.uuid,
      'device_limit': instance.deviceLimit,
      'speed_limit': instance.speedLimit,
      'next_reset_at': instance.nextResetAt,
      'plan': instance.plan,
      'subscribe_url': instance.subscribeUrl,
      'reset_day': instance.resetDay,
    };

_XboardNotice _$XboardNoticeFromJson(Map<String, dynamic> json) =>
    _XboardNotice(
      id: (json['id'] as num).toInt(),
      sort: (json['sort'] as num?)?.toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      show: json['show'] as bool? ?? true,
      imgUrl: json['img_url'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XboardNoticeToJson(_XboardNotice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sort': instance.sort,
      'title': instance.title,
      'content': instance.content,
      'show': instance.show,
      'img_url': instance.imgUrl,
      'tags': instance.tags,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_XboardConfig _$XboardConfigFromJson(Map<String, dynamic> json) =>
    _XboardConfig(
      baseUrl: json['baseUrl'] as String?,
      authToken: json['authToken'] as String?,
      authData: json['authData'] as String?,
      loginTime: (json['loginTime'] as num?)?.toInt(),
      autoSyncSubscribe: json['autoSyncSubscribe'] as bool? ?? true,
      enableHA: json['enableHA'] as bool? ?? true,
      haResolvedUrl: json['haResolvedUrl'] as String?,
      haResolvedTime: (json['haResolvedTime'] as num?)?.toInt(),
      haConfigVersion: (json['haConfigVersion'] as num?)?.toInt(),
      cachedUiConfig: json['cachedUiConfig'] as String?,
    );

Map<String, dynamic> _$XboardConfigToJson(_XboardConfig instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'authToken': instance.authToken,
      'authData': instance.authData,
      'loginTime': instance.loginTime,
      'autoSyncSubscribe': instance.autoSyncSubscribe,
      'enableHA': instance.enableHA,
      'haResolvedUrl': instance.haResolvedUrl,
      'haResolvedTime': instance.haResolvedTime,
      'haConfigVersion': instance.haConfigVersion,
      'cachedUiConfig': instance.cachedUiConfig,
    };

_XboardState _$XboardStateFromJson(Map<String, dynamic> json) => _XboardState(
  isLoggedIn: json['isLoggedIn'] as bool? ?? false,
  isLoading: json['isLoading'] as bool? ?? false,
  user: json['user'] == null
      ? null
      : XboardUser.fromJson(json['user'] as Map<String, dynamic>),
  subscribe: json['subscribe'] == null
      ? null
      : XboardSubscribe.fromJson(json['subscribe'] as Map<String, dynamic>),
  notices:
      (json['notices'] as List<dynamic>?)
          ?.map((e) => XboardNotice.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  error: json['error'] as String?,
);

Map<String, dynamic> _$XboardStateToJson(_XboardState instance) =>
    <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
      'isLoading': instance.isLoading,
      'user': instance.user,
      'subscribe': instance.subscribe,
      'notices': instance.notices,
      'error': instance.error,
    };
