// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../xboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$XboardUserImpl _$$XboardUserImplFromJson(Map<String, dynamic> json) =>
    _$XboardUserImpl(
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      avatarUrl: json['avatar_url'] as String,
      transferEnable: (json['transfer_enable'] as num).toInt(),
      lastLoginAt: (json['last_login_at'] as num).toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      banned: json['banned'] as bool,
      remindExpire: json['remind_expire'] as bool,
      remindTraffic: json['remind_traffic'] as bool,
      expiredAt: (json['expired_at'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
      commissionBalance: (json['commission_balance'] as num).toInt(),
      planId: (json['plan_id'] as num).toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      commissionRate: (json['commission_rate'] as num?)?.toInt(),
      telegramId: (json['telegram_id'] as num?)?.toInt(),
      plan: XboardPlan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$XboardUserImplToJson(_$XboardUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uuid': instance.uuid,
      'avatar_url': instance.avatarUrl,
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
      'plan': instance.plan,
    };

_$XboardSubscriptionImpl _$$XboardSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardSubscriptionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      isActive: json['isActive'] as bool? ?? false,
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$XboardSubscriptionImplToJson(
        _$XboardSubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'isActive': instance.isActive,
      'expireAt': instance.expireAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$XboardSessionImpl _$$XboardSessionImplFromJson(Map<String, dynamic> json) =>
    _$XboardSessionImpl(
      token: json['token'] as String,
      authData: json['authData'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$XboardSessionImplToJson(_$XboardSessionImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'authData': instance.authData,
      'isAdmin': instance.isAdmin,
    };

_$XboardPlanImpl _$$XboardPlanImplFromJson(Map<String, dynamic> json) =>
    _$XboardPlanImpl(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      transferEnable: (json['transfer_enable'] as num).toInt(),
      name: json['name'] as String,
      speedLimit: (json['speed_limit'] as num?)?.toInt(),
      show: json['show'] as bool,
      sort: (json['sort'] as num?)?.toInt(),
      renew: json['renew'] as bool,
      content: json['content'] as String,
      resetTrafficMethod: json['reset_traffic_method'] as String?,
      capacityLimit: (json['capacity_limit'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      updatedAt: (json['updated_at'] as num).toInt(),
      prices: Map<String, String>.from(json['prices'] as Map),
      sell: (json['sell'] as num).toInt(),
      deviceLimit: (json['device_limit'] as num).toInt(),
    );

Map<String, dynamic> _$$XboardPlanImplToJson(_$XboardPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'transfer_enable': instance.transferEnable,
      'name': instance.name,
      'speed_limit': instance.speedLimit,
      'show': instance.show,
      'sort': instance.sort,
      'renew': instance.renew,
      'content': instance.content,
      'reset_traffic_method': instance.resetTrafficMethod,
      'capacity_limit': instance.capacityLimit,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'prices': instance.prices,
      'sell': instance.sell,
      'device_limit': instance.deviceLimit,
    };

_$XboardSubscribeInfoImpl _$$XboardSubscribeInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardSubscribeInfoImpl(
      subscribeUrl: json['subscribe_url'] as String,
      planId: (json['plan_id'] as num).toInt(),
      token: json['token'] as String,
      expiredAt: (json['expired_at'] as num).toInt(),
      u: (json['u'] as num).toInt(),
      d: (json['d'] as num).toInt(),
      transferEnable: (json['transfer_enable'] as num).toInt(),
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      plan: XboardPlan.fromJson(json['plan'] as Map<String, dynamic>),
      resetDay: (json['reset_day'] as num).toInt(),
    );

Map<String, dynamic> _$$XboardSubscribeInfoImplToJson(
        _$XboardSubscribeInfoImpl instance) =>
    <String, dynamic>{
      'subscribe_url': instance.subscribeUrl,
      'plan_id': instance.planId,
      'token': instance.token,
      'expired_at': instance.expiredAt,
      'u': instance.u,
      'd': instance.d,
      'transfer_enable': instance.transferEnable,
      'email': instance.email,
      'uuid': instance.uuid,
      'plan': instance.plan,
      'reset_day': instance.resetDay,
    };
