// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../xboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$XboardUserImpl _$$XboardUserImplFromJson(Map<String, dynamic> json) =>
    _$XboardUserImpl(
      email: json['email'] as String,
      transferEnable: (json['transfer_enable'] as num?)?.toInt() ?? 0,
      lastLoginAt: (json['last_login_at'] as num?)?.toInt() ?? 0,
      createdAt: (json['created_at'] as num?)?.toInt() ?? 0,
      banned: json['banned'] as bool? ?? false,
      remindExpire: json['remind_expire'] as bool? ?? true,
      remindTraffic: json['remind_traffic'] as bool? ?? true,
      expiredAt: (json['expired_at'] as num?)?.toInt() ?? 0,
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      commissionBalance: (json['commission_balance'] as num?)?.toInt() ?? 0,
      planId: (json['plan_id'] as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toInt(),
      commissionRate: (json['commission_rate'] as num?)?.toInt(),
      telegramId: json['telegram_id'] as String?,
      uuid: json['uuid'] as String? ?? "",
      avatarUrl: json['avatar_url'] as String? ?? "",
    );

Map<String, dynamic> _$$XboardUserImplToJson(_$XboardUserImpl instance) =>
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

_$XboardSubscriptionImpl _$$XboardSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardSubscriptionImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      transferEnable: (json['transferEnable'] as num).toInt(),
      monthPrice: (json['monthPrice'] as num).toInt(),
      quarterPrice: (json['quarterPrice'] as num).toInt(),
      halfYearPrice: (json['halfYearPrice'] as num).toInt(),
      yearPrice: (json['yearPrice'] as num).toInt(),
      twoYearPrice: (json['twoYearPrice'] as num).toInt(),
      threeYearPrice: (json['threeYearPrice'] as num).toInt(),
      onetimePrice: (json['onetimePrice'] as num).toInt(),
      resetPrice: (json['resetPrice'] as num).toInt(),
      content: json['content'] as String? ?? "",
      show: json['show'] as bool? ?? true,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      renew: json['renew'] as bool? ?? false,
      resetTrafficMethod: json['resetTrafficMethod'] as bool? ?? false,
      capacity: (json['capacity'] as num?)?.toInt() ?? 0,
      speeds: (json['speeds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$XboardSubscriptionImplToJson(
        _$XboardSubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'transferEnable': instance.transferEnable,
      'monthPrice': instance.monthPrice,
      'quarterPrice': instance.quarterPrice,
      'halfYearPrice': instance.halfYearPrice,
      'yearPrice': instance.yearPrice,
      'twoYearPrice': instance.twoYearPrice,
      'threeYearPrice': instance.threeYearPrice,
      'onetimePrice': instance.onetimePrice,
      'resetPrice': instance.resetPrice,
      'content': instance.content,
      'show': instance.show,
      'sort': instance.sort,
      'renew': instance.renew,
      'resetTrafficMethod': instance.resetTrafficMethod,
      'capacity': instance.capacity,
      'speeds': instance.speeds,
    };

_$XboardNodeImpl _$$XboardNodeImplFromJson(Map<String, dynamic> json) =>
    _$XboardNodeImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      server: json['server'] as String,
      serverPort: (json['serverPort'] as num).toInt(),
      cipher: json['cipher'] as String,
      obfs: json['obfs'] as String,
      obfsSettings: json['obfsSettings'] as String,
      protocol: json['protocol'] as String,
      protocolSettings: json['protocolSettings'] as String,
      tags: json['tags'] as String? ?? "",
      rate: (json['rate'] as num?)?.toInt() ?? 1,
      show: json['show'] as bool? ?? true,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? "",
      type: json['type'] as String? ?? "shadowsocks",
      networkSettings: json['networkSettings'] as String? ?? "",
      tlsSettings: json['tlsSettings'] as String? ?? "",
      ruleSettings: json['ruleSettings'] as String? ?? "",
      dnsSettings: json['dnsSettings'] as String? ?? "",
    );

Map<String, dynamic> _$$XboardNodeImplToJson(_$XboardNodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'serverPort': instance.serverPort,
      'cipher': instance.cipher,
      'obfs': instance.obfs,
      'obfsSettings': instance.obfsSettings,
      'protocol': instance.protocol,
      'protocolSettings': instance.protocolSettings,
      'tags': instance.tags,
      'rate': instance.rate,
      'show': instance.show,
      'sort': instance.sort,
      'remark': instance.remark,
      'type': instance.type,
      'networkSettings': instance.networkSettings,
      'tlsSettings': instance.tlsSettings,
      'ruleSettings': instance.ruleSettings,
      'dnsSettings': instance.dnsSettings,
    };

_$XboardLoginResponseImpl _$$XboardLoginResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardLoginResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : XboardLoginData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$XboardLoginResponseImplToJson(
        _$XboardLoginResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$XboardLoginDataImpl _$$XboardLoginDataImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardLoginDataImpl(
      token: json['token'] as String,
      authData: json['auth_data'] as String,
      isAdmin: json['is_admin'] as bool? ?? false,
    );

Map<String, dynamic> _$$XboardLoginDataImplToJson(
        _$XboardLoginDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'auth_data': instance.authData,
      'is_admin': instance.isAdmin,
    };

_$XboardApiResponseImpl _$$XboardApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardApiResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$XboardApiResponseImplToJson(
        _$XboardApiResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$XboardUserResponseImpl _$$XboardUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardUserResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : XboardUser.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$XboardUserResponseImplToJson(
        _$XboardUserResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$XboardSubscriptionsResponseImpl _$$XboardSubscriptionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardSubscriptionsResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => XboardSubscription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$XboardSubscriptionsResponseImplToJson(
        _$XboardSubscriptionsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$XboardNodesResponseImpl _$$XboardNodesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardNodesResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => XboardNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$XboardNodesResponseImplToJson(
        _$XboardNodesResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$XboardSubscriptionInfoImpl _$$XboardSubscriptionInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardSubscriptionInfoImpl(
      planId: (json['plan_id'] as num).toInt(),
      token: json['token'] as String,
      expiredAt: (json['expired_at'] as num).toInt(),
      u: (json['u'] as num).toInt(),
      d: (json['d'] as num).toInt(),
      transferEnable: (json['transfer_enable'] as num).toInt(),
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      plan: json['plan'] == null
          ? null
          : XboardPlan.fromJson(json['plan'] as Map<String, dynamic>),
      subscribeUrl: json['subscribe_url'] as String,
      resetDay: (json['reset_day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$XboardSubscriptionInfoImplToJson(
        _$XboardSubscriptionInfoImpl instance) =>
    <String, dynamic>{
      'plan_id': instance.planId,
      'token': instance.token,
      'expired_at': instance.expiredAt,
      'u': instance.u,
      'd': instance.d,
      'transfer_enable': instance.transferEnable,
      'email': instance.email,
      'uuid': instance.uuid,
      'plan': instance.plan,
      'subscribe_url': instance.subscribeUrl,
      'reset_day': instance.resetDay,
    };

_$XboardPlanImpl _$$XboardPlanImplFromJson(Map<String, dynamic> json) =>
    _$XboardPlanImpl(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      transferEnable: (json['transfer_enable'] as num).toInt(),
      name: json['name'] as String,
      speedLimit: (json['speed_limit'] as num?)?.toInt(),
      show: json['show'] as bool? ?? true,
      sort: (json['sort'] as num?)?.toInt(),
      renew: json['renew'] as bool? ?? true,
      content: json['content'] as String? ?? "",
      resetTrafficMethod: json['reset_traffic_method'] as String?,
      capacityLimit: (json['capacity_limit'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      updatedAt: (json['updated_at'] as num).toInt(),
      prices: XboardPlanPrices.fromJson(json['prices'] as Map<String, dynamic>),
      sell: (json['sell'] as num?)?.toInt() ?? 1,
      deviceLimit: (json['device_limit'] as num?)?.toInt() ?? 1,
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

_$XboardPlanPricesImpl _$$XboardPlanPricesImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardPlanPricesImpl(
      monthly: json['monthly'] as String,
      quarterly: json['quarterly'] as String,
      halfYearly: json['half_yearly'] as String,
      yearly: json['yearly'] as String,
      twoYearly: json['two_yearly'] as String,
      threeYearly: json['three_yearly'] as String,
      onetime: json['onetime'] as String,
      resetTraffic: json['reset_traffic'] as String,
    );

Map<String, dynamic> _$$XboardPlanPricesImplToJson(
        _$XboardPlanPricesImpl instance) =>
    <String, dynamic>{
      'monthly': instance.monthly,
      'quarterly': instance.quarterly,
      'half_yearly': instance.halfYearly,
      'yearly': instance.yearly,
      'two_yearly': instance.twoYearly,
      'three_yearly': instance.threeYearly,
      'onetime': instance.onetime,
      'reset_traffic': instance.resetTraffic,
    };

_$XboardSubscriptionUrlResponseImpl
    _$$XboardSubscriptionUrlResponseImplFromJson(Map<String, dynamic> json) =>
        _$XboardSubscriptionUrlResponseImpl(
          status: json['status'] as String,
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : XboardSubscriptionInfo.fromJson(
                  json['data'] as Map<String, dynamic>),
          error: json['error'] as String?,
        );

Map<String, dynamic> _$$XboardSubscriptionUrlResponseImplToJson(
        _$XboardSubscriptionUrlResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$XboardCheckinResponseImpl _$$XboardCheckinResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardCheckinResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$XboardCheckinResponseImplToJson(
        _$XboardCheckinResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$XboardOrderImpl _$$XboardOrderImplFromJson(Map<String, dynamic> json) =>
    _$XboardOrderImpl(
      tradeNo: json['tradeNo'] as String,
      totalAmount: (json['totalAmount'] as num).toInt(),
      status: json['status'] as String,
      callbackNo: json['callbackNo'] as String? ?? "",
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$XboardOrderImplToJson(_$XboardOrderImpl instance) =>
    <String, dynamic>{
      'tradeNo': instance.tradeNo,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'callbackNo': instance.callbackNo,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$XboardOrderResponseImpl _$$XboardOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardOrderResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : XboardOrder.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$XboardOrderResponseImplToJson(
        _$XboardOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$XboardPurchaseRequestImpl _$$XboardPurchaseRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$XboardPurchaseRequestImpl(
      planId: (json['planId'] as num).toInt(),
      period: json['period'] as String,
      couponCode: json['couponCode'] as String? ?? "",
    );

Map<String, dynamic> _$$XboardPurchaseRequestImplToJson(
        _$XboardPurchaseRequestImpl instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'period': instance.period,
      'couponCode': instance.couponCode,
    };
