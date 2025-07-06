// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../xboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

XboardUser _$XboardUserFromJson(Map<String, dynamic> json) {
  return _XboardUser.fromJson(json);
}

/// @nodoc
mixin _$XboardUser {
  String get email => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_enable')
  int get transferEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  int get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  bool get banned => throw _privateConstructorUsedError;
  @JsonKey(name: 'remind_expire')
  bool get remindExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'remind_traffic')
  bool get remindTraffic => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  int get expiredAt => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_balance')
  int get commissionBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_id')
  int get planId => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  int? get commissionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'telegram_id')
  int? get telegramId => throw _privateConstructorUsedError;
  XboardPlan get plan => throw _privateConstructorUsedError;

  /// Serializes this XboardUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardUserCopyWith<XboardUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardUserCopyWith<$Res> {
  factory $XboardUserCopyWith(
          XboardUser value, $Res Function(XboardUser) then) =
      _$XboardUserCopyWithImpl<$Res, XboardUser>;
  @useResult
  $Res call(
      {String email,
      String uuid,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      @JsonKey(name: 'last_login_at') int lastLoginAt,
      @JsonKey(name: 'created_at') int createdAt,
      bool banned,
      @JsonKey(name: 'remind_expire') bool remindExpire,
      @JsonKey(name: 'remind_traffic') bool remindTraffic,
      @JsonKey(name: 'expired_at') int expiredAt,
      int balance,
      @JsonKey(name: 'commission_balance') int commissionBalance,
      @JsonKey(name: 'plan_id') int planId,
      int? discount,
      @JsonKey(name: 'commission_rate') int? commissionRate,
      @JsonKey(name: 'telegram_id') int? telegramId,
      XboardPlan plan});

  $XboardPlanCopyWith<$Res> get plan;
}

/// @nodoc
class _$XboardUserCopyWithImpl<$Res, $Val extends XboardUser>
    implements $XboardUserCopyWith<$Res> {
  _$XboardUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uuid = null,
    Object? avatarUrl = null,
    Object? transferEnable = null,
    Object? lastLoginAt = null,
    Object? createdAt = null,
    Object? banned = null,
    Object? remindExpire = null,
    Object? remindTraffic = null,
    Object? expiredAt = null,
    Object? balance = null,
    Object? commissionBalance = null,
    Object? planId = null,
    Object? discount = freezed,
    Object? commissionRate = freezed,
    Object? telegramId = freezed,
    Object? plan = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      remindExpire: null == remindExpire
          ? _value.remindExpire
          : remindExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTraffic: null == remindTraffic
          ? _value.remindTraffic
          : remindTraffic // ignore: cast_nullable_to_non_nullable
              as bool,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      commissionBalance: null == commissionBalance
          ? _value.commissionBalance
          : commissionBalance // ignore: cast_nullable_to_non_nullable
              as int,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      telegramId: freezed == telegramId
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan,
    ) as $Val);
  }

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardPlanCopyWith<$Res> get plan {
    return $XboardPlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardUserImplCopyWith<$Res>
    implements $XboardUserCopyWith<$Res> {
  factory _$$XboardUserImplCopyWith(
          _$XboardUserImpl value, $Res Function(_$XboardUserImpl) then) =
      __$$XboardUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String uuid,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      @JsonKey(name: 'last_login_at') int lastLoginAt,
      @JsonKey(name: 'created_at') int createdAt,
      bool banned,
      @JsonKey(name: 'remind_expire') bool remindExpire,
      @JsonKey(name: 'remind_traffic') bool remindTraffic,
      @JsonKey(name: 'expired_at') int expiredAt,
      int balance,
      @JsonKey(name: 'commission_balance') int commissionBalance,
      @JsonKey(name: 'plan_id') int planId,
      int? discount,
      @JsonKey(name: 'commission_rate') int? commissionRate,
      @JsonKey(name: 'telegram_id') int? telegramId,
      XboardPlan plan});

  @override
  $XboardPlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$XboardUserImplCopyWithImpl<$Res>
    extends _$XboardUserCopyWithImpl<$Res, _$XboardUserImpl>
    implements _$$XboardUserImplCopyWith<$Res> {
  __$$XboardUserImplCopyWithImpl(
      _$XboardUserImpl _value, $Res Function(_$XboardUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uuid = null,
    Object? avatarUrl = null,
    Object? transferEnable = null,
    Object? lastLoginAt = null,
    Object? createdAt = null,
    Object? banned = null,
    Object? remindExpire = null,
    Object? remindTraffic = null,
    Object? expiredAt = null,
    Object? balance = null,
    Object? commissionBalance = null,
    Object? planId = null,
    Object? discount = freezed,
    Object? commissionRate = freezed,
    Object? telegramId = freezed,
    Object? plan = null,
  }) {
    return _then(_$XboardUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      remindExpire: null == remindExpire
          ? _value.remindExpire
          : remindExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTraffic: null == remindTraffic
          ? _value.remindTraffic
          : remindTraffic // ignore: cast_nullable_to_non_nullable
              as bool,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      commissionBalance: null == commissionBalance
          ? _value.commissionBalance
          : commissionBalance // ignore: cast_nullable_to_non_nullable
              as int,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      telegramId: freezed == telegramId
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardUserImpl implements _XboardUser {
  const _$XboardUserImpl(
      {required this.email,
      required this.uuid,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'transfer_enable') required this.transferEnable,
      @JsonKey(name: 'last_login_at') required this.lastLoginAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.banned,
      @JsonKey(name: 'remind_expire') required this.remindExpire,
      @JsonKey(name: 'remind_traffic') required this.remindTraffic,
      @JsonKey(name: 'expired_at') required this.expiredAt,
      required this.balance,
      @JsonKey(name: 'commission_balance') required this.commissionBalance,
      @JsonKey(name: 'plan_id') required this.planId,
      this.discount,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'telegram_id') this.telegramId,
      required this.plan});

  factory _$XboardUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardUserImplFromJson(json);

  @override
  final String email;
  @override
  final String uuid;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'transfer_enable')
  final int transferEnable;
  @override
  @JsonKey(name: 'last_login_at')
  final int lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  final bool banned;
  @override
  @JsonKey(name: 'remind_expire')
  final bool remindExpire;
  @override
  @JsonKey(name: 'remind_traffic')
  final bool remindTraffic;
  @override
  @JsonKey(name: 'expired_at')
  final int expiredAt;
  @override
  final int balance;
  @override
  @JsonKey(name: 'commission_balance')
  final int commissionBalance;
  @override
  @JsonKey(name: 'plan_id')
  final int planId;
  @override
  final int? discount;
  @override
  @JsonKey(name: 'commission_rate')
  final int? commissionRate;
  @override
  @JsonKey(name: 'telegram_id')
  final int? telegramId;
  @override
  final XboardPlan plan;

  @override
  String toString() {
    return 'XboardUser(email: $email, uuid: $uuid, avatarUrl: $avatarUrl, transferEnable: $transferEnable, lastLoginAt: $lastLoginAt, createdAt: $createdAt, banned: $banned, remindExpire: $remindExpire, remindTraffic: $remindTraffic, expiredAt: $expiredAt, balance: $balance, commissionBalance: $commissionBalance, planId: $planId, discount: $discount, commissionRate: $commissionRate, telegramId: $telegramId, plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.transferEnable, transferEnable) ||
                other.transferEnable == transferEnable) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.remindExpire, remindExpire) ||
                other.remindExpire == remindExpire) &&
            (identical(other.remindTraffic, remindTraffic) ||
                other.remindTraffic == remindTraffic) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.commissionBalance, commissionBalance) ||
                other.commissionBalance == commissionBalance) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            (identical(other.telegramId, telegramId) ||
                other.telegramId == telegramId) &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      uuid,
      avatarUrl,
      transferEnable,
      lastLoginAt,
      createdAt,
      banned,
      remindExpire,
      remindTraffic,
      expiredAt,
      balance,
      commissionBalance,
      planId,
      discount,
      commissionRate,
      telegramId,
      plan);

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardUserImplCopyWith<_$XboardUserImpl> get copyWith =>
      __$$XboardUserImplCopyWithImpl<_$XboardUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardUserImplToJson(
      this,
    );
  }
}

abstract class _XboardUser implements XboardUser {
  const factory _XboardUser(
      {required final String email,
      required final String uuid,
      @JsonKey(name: 'avatar_url') required final String avatarUrl,
      @JsonKey(name: 'transfer_enable') required final int transferEnable,
      @JsonKey(name: 'last_login_at') required final int lastLoginAt,
      @JsonKey(name: 'created_at') required final int createdAt,
      required final bool banned,
      @JsonKey(name: 'remind_expire') required final bool remindExpire,
      @JsonKey(name: 'remind_traffic') required final bool remindTraffic,
      @JsonKey(name: 'expired_at') required final int expiredAt,
      required final int balance,
      @JsonKey(name: 'commission_balance') required final int commissionBalance,
      @JsonKey(name: 'plan_id') required final int planId,
      final int? discount,
      @JsonKey(name: 'commission_rate') final int? commissionRate,
      @JsonKey(name: 'telegram_id') final int? telegramId,
      required final XboardPlan plan}) = _$XboardUserImpl;

  factory _XboardUser.fromJson(Map<String, dynamic> json) =
      _$XboardUserImpl.fromJson;

  @override
  String get email;
  @override
  String get uuid;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'transfer_enable')
  int get transferEnable;
  @override
  @JsonKey(name: 'last_login_at')
  int get lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  bool get banned;
  @override
  @JsonKey(name: 'remind_expire')
  bool get remindExpire;
  @override
  @JsonKey(name: 'remind_traffic')
  bool get remindTraffic;
  @override
  @JsonKey(name: 'expired_at')
  int get expiredAt;
  @override
  int get balance;
  @override
  @JsonKey(name: 'commission_balance')
  int get commissionBalance;
  @override
  @JsonKey(name: 'plan_id')
  int get planId;
  @override
  int? get discount;
  @override
  @JsonKey(name: 'commission_rate')
  int? get commissionRate;
  @override
  @JsonKey(name: 'telegram_id')
  int? get telegramId;
  @override
  XboardPlan get plan;

  /// Create a copy of XboardUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardUserImplCopyWith<_$XboardUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSubscription _$XboardSubscriptionFromJson(Map<String, dynamic> json) {
  return _XboardSubscription.fromJson(json);
}

/// @nodoc
mixin _$XboardSubscription {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get expireAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this XboardSubscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSubscriptionCopyWith<XboardSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSubscriptionCopyWith<$Res> {
  factory $XboardSubscriptionCopyWith(
          XboardSubscription value, $Res Function(XboardSubscription) then) =
      _$XboardSubscriptionCopyWithImpl<$Res, XboardSubscription>;
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      bool isActive,
      DateTime? expireAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$XboardSubscriptionCopyWithImpl<$Res, $Val extends XboardSubscription>
    implements $XboardSubscriptionCopyWith<$Res> {
  _$XboardSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? isActive = null,
    Object? expireAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      expireAt: freezed == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardSubscriptionImplCopyWith<$Res>
    implements $XboardSubscriptionCopyWith<$Res> {
  factory _$$XboardSubscriptionImplCopyWith(_$XboardSubscriptionImpl value,
          $Res Function(_$XboardSubscriptionImpl) then) =
      __$$XboardSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      bool isActive,
      DateTime? expireAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$XboardSubscriptionImplCopyWithImpl<$Res>
    extends _$XboardSubscriptionCopyWithImpl<$Res, _$XboardSubscriptionImpl>
    implements _$$XboardSubscriptionImplCopyWith<$Res> {
  __$$XboardSubscriptionImplCopyWithImpl(_$XboardSubscriptionImpl _value,
      $Res Function(_$XboardSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? isActive = null,
    Object? expireAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$XboardSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      expireAt: freezed == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscriptionImpl implements _XboardSubscription {
  const _$XboardSubscriptionImpl(
      {required this.id,
      required this.name,
      required this.url,
      this.isActive = false,
      this.expireAt,
      this.createdAt,
      this.updatedAt});

  factory _$XboardSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardSubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? expireAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'XboardSubscription(id: $id, name: $name, url: $url, isActive: $isActive, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, url, isActive, expireAt, createdAt, updatedAt);

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSubscriptionImplCopyWith<_$XboardSubscriptionImpl> get copyWith =>
      __$$XboardSubscriptionImplCopyWithImpl<_$XboardSubscriptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSubscriptionImplToJson(
      this,
    );
  }
}

abstract class _XboardSubscription implements XboardSubscription {
  const factory _XboardSubscription(
      {required final String id,
      required final String name,
      required final String url,
      final bool isActive,
      final DateTime? expireAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$XboardSubscriptionImpl;

  factory _XboardSubscription.fromJson(Map<String, dynamic> json) =
      _$XboardSubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  bool get isActive;
  @override
  DateTime? get expireAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscriptionImplCopyWith<_$XboardSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$XboardAuthState {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  XboardUser? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardAuthStateCopyWith<XboardAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardAuthStateCopyWith<$Res> {
  factory $XboardAuthStateCopyWith(
          XboardAuthState value, $Res Function(XboardAuthState) then) =
      _$XboardAuthStateCopyWithImpl<$Res, XboardAuthState>;
  @useResult
  $Res call({bool isLoggedIn, XboardUser? user, bool isLoading, String? error});

  $XboardUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$XboardAuthStateCopyWithImpl<$Res, $Val extends XboardAuthState>
    implements $XboardAuthStateCopyWith<$Res> {
  _$XboardAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? user = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as XboardUser?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $XboardUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardAuthStateImplCopyWith<$Res>
    implements $XboardAuthStateCopyWith<$Res> {
  factory _$$XboardAuthStateImplCopyWith(_$XboardAuthStateImpl value,
          $Res Function(_$XboardAuthStateImpl) then) =
      __$$XboardAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn, XboardUser? user, bool isLoading, String? error});

  @override
  $XboardUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$XboardAuthStateImplCopyWithImpl<$Res>
    extends _$XboardAuthStateCopyWithImpl<$Res, _$XboardAuthStateImpl>
    implements _$$XboardAuthStateImplCopyWith<$Res> {
  __$$XboardAuthStateImplCopyWithImpl(
      _$XboardAuthStateImpl _value, $Res Function(_$XboardAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? user = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$XboardAuthStateImpl(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as XboardUser?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$XboardAuthStateImpl implements _XboardAuthState {
  const _$XboardAuthStateImpl(
      {this.isLoggedIn = false, this.user, this.isLoading = false, this.error});

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  final XboardUser? user;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'XboardAuthState(isLoggedIn: $isLoggedIn, user: $user, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardAuthStateImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoggedIn, user, isLoading, error);

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardAuthStateImplCopyWith<_$XboardAuthStateImpl> get copyWith =>
      __$$XboardAuthStateImplCopyWithImpl<_$XboardAuthStateImpl>(
          this, _$identity);
}

abstract class _XboardAuthState implements XboardAuthState {
  const factory _XboardAuthState(
      {final bool isLoggedIn,
      final XboardUser? user,
      final bool isLoading,
      final String? error}) = _$XboardAuthStateImpl;

  @override
  bool get isLoggedIn;
  @override
  XboardUser? get user;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of XboardAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardAuthStateImplCopyWith<_$XboardAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSession _$XboardSessionFromJson(Map<String, dynamic> json) {
  return _XboardSession.fromJson(json);
}

/// @nodoc
mixin _$XboardSession {
  String get token => throw _privateConstructorUsedError;
  String get authData => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;

  /// Serializes this XboardSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSessionCopyWith<XboardSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSessionCopyWith<$Res> {
  factory $XboardSessionCopyWith(
          XboardSession value, $Res Function(XboardSession) then) =
      _$XboardSessionCopyWithImpl<$Res, XboardSession>;
  @useResult
  $Res call({String token, String authData, bool isAdmin});
}

/// @nodoc
class _$XboardSessionCopyWithImpl<$Res, $Val extends XboardSession>
    implements $XboardSessionCopyWith<$Res> {
  _$XboardSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? authData = null,
    Object? isAdmin = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      authData: null == authData
          ? _value.authData
          : authData // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardSessionImplCopyWith<$Res>
    implements $XboardSessionCopyWith<$Res> {
  factory _$$XboardSessionImplCopyWith(
          _$XboardSessionImpl value, $Res Function(_$XboardSessionImpl) then) =
      __$$XboardSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String authData, bool isAdmin});
}

/// @nodoc
class __$$XboardSessionImplCopyWithImpl<$Res>
    extends _$XboardSessionCopyWithImpl<$Res, _$XboardSessionImpl>
    implements _$$XboardSessionImplCopyWith<$Res> {
  __$$XboardSessionImplCopyWithImpl(
      _$XboardSessionImpl _value, $Res Function(_$XboardSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? authData = null,
    Object? isAdmin = null,
  }) {
    return _then(_$XboardSessionImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      authData: null == authData
          ? _value.authData
          : authData // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSessionImpl implements _XboardSession {
  const _$XboardSessionImpl(
      {required this.token, required this.authData, this.isAdmin = false});

  factory _$XboardSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardSessionImplFromJson(json);

  @override
  final String token;
  @override
  final String authData;
  @override
  @JsonKey()
  final bool isAdmin;

  @override
  String toString() {
    return 'XboardSession(token: $token, authData: $authData, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSessionImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.authData, authData) ||
                other.authData == authData) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, authData, isAdmin);

  /// Create a copy of XboardSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSessionImplCopyWith<_$XboardSessionImpl> get copyWith =>
      __$$XboardSessionImplCopyWithImpl<_$XboardSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSessionImplToJson(
      this,
    );
  }
}

abstract class _XboardSession implements XboardSession {
  const factory _XboardSession(
      {required final String token,
      required final String authData,
      final bool isAdmin}) = _$XboardSessionImpl;

  factory _XboardSession.fromJson(Map<String, dynamic> json) =
      _$XboardSessionImpl.fromJson;

  @override
  String get token;
  @override
  String get authData;
  @override
  bool get isAdmin;

  /// Create a copy of XboardSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSessionImplCopyWith<_$XboardSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardPlan _$XboardPlanFromJson(Map<String, dynamic> json) {
  return _XboardPlan.fromJson(json);
}

/// @nodoc
mixin _$XboardPlan {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_enable')
  int get transferEnable => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed_limit')
  int? get speedLimit => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;
  int? get sort => throw _privateConstructorUsedError;
  bool get renew => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'reset_traffic_method')
  String? get resetTrafficMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'capacity_limit')
  int? get capacityLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int get updatedAt => throw _privateConstructorUsedError;
  Map<String, String> get prices => throw _privateConstructorUsedError;
  int get sell => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_limit')
  int get deviceLimit => throw _privateConstructorUsedError;

  /// Serializes this XboardPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardPlanCopyWith<XboardPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardPlanCopyWith<$Res> {
  factory $XboardPlanCopyWith(
          XboardPlan value, $Res Function(XboardPlan) then) =
      _$XboardPlanCopyWithImpl<$Res, XboardPlan>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String name,
      @JsonKey(name: 'speed_limit') int? speedLimit,
      bool show,
      int? sort,
      bool renew,
      String content,
      @JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') int? capacityLimit,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt,
      Map<String, String> prices,
      int sell,
      @JsonKey(name: 'device_limit') int deviceLimit});
}

/// @nodoc
class _$XboardPlanCopyWithImpl<$Res, $Val extends XboardPlan>
    implements $XboardPlanCopyWith<$Res> {
  _$XboardPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? transferEnable = null,
    Object? name = null,
    Object? speedLimit = freezed,
    Object? show = null,
    Object? sort = freezed,
    Object? renew = null,
    Object? content = null,
    Object? resetTrafficMethod = freezed,
    Object? capacityLimit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? prices = null,
    Object? sell = null,
    Object? deviceLimit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      renew: null == renew
          ? _value.renew
          : renew // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      resetTrafficMethod: freezed == resetTrafficMethod
          ? _value.resetTrafficMethod
          : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityLimit: freezed == capacityLimit
          ? _value.capacityLimit
          : capacityLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as int,
      deviceLimit: null == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardPlanImplCopyWith<$Res>
    implements $XboardPlanCopyWith<$Res> {
  factory _$$XboardPlanImplCopyWith(
          _$XboardPlanImpl value, $Res Function(_$XboardPlanImpl) then) =
      __$$XboardPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String name,
      @JsonKey(name: 'speed_limit') int? speedLimit,
      bool show,
      int? sort,
      bool renew,
      String content,
      @JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') int? capacityLimit,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt,
      Map<String, String> prices,
      int sell,
      @JsonKey(name: 'device_limit') int deviceLimit});
}

/// @nodoc
class __$$XboardPlanImplCopyWithImpl<$Res>
    extends _$XboardPlanCopyWithImpl<$Res, _$XboardPlanImpl>
    implements _$$XboardPlanImplCopyWith<$Res> {
  __$$XboardPlanImplCopyWithImpl(
      _$XboardPlanImpl _value, $Res Function(_$XboardPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? transferEnable = null,
    Object? name = null,
    Object? speedLimit = freezed,
    Object? show = null,
    Object? sort = freezed,
    Object? renew = null,
    Object? content = null,
    Object? resetTrafficMethod = freezed,
    Object? capacityLimit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? prices = null,
    Object? sell = null,
    Object? deviceLimit = null,
  }) {
    return _then(_$XboardPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      renew: null == renew
          ? _value.renew
          : renew // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      resetTrafficMethod: freezed == resetTrafficMethod
          ? _value.resetTrafficMethod
          : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityLimit: freezed == capacityLimit
          ? _value.capacityLimit
          : capacityLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      prices: null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as int,
      deviceLimit: null == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardPlanImpl implements _XboardPlan {
  const _$XboardPlanImpl(
      {required this.id,
      @JsonKey(name: 'group_id') required this.groupId,
      @JsonKey(name: 'transfer_enable') required this.transferEnable,
      required this.name,
      @JsonKey(name: 'speed_limit') this.speedLimit,
      required this.show,
      this.sort,
      required this.renew,
      required this.content,
      @JsonKey(name: 'reset_traffic_method') this.resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') this.capacityLimit,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required final Map<String, String> prices,
      required this.sell,
      @JsonKey(name: 'device_limit') required this.deviceLimit})
      : _prices = prices;

  factory _$XboardPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardPlanImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'group_id')
  final int groupId;
  @override
  @JsonKey(name: 'transfer_enable')
  final int transferEnable;
  @override
  final String name;
  @override
  @JsonKey(name: 'speed_limit')
  final int? speedLimit;
  @override
  final bool show;
  @override
  final int? sort;
  @override
  final bool renew;
  @override
  final String content;
  @override
  @JsonKey(name: 'reset_traffic_method')
  final String? resetTrafficMethod;
  @override
  @JsonKey(name: 'capacity_limit')
  final int? capacityLimit;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final Map<String, String> _prices;
  @override
  Map<String, String> get prices {
    if (_prices is EqualUnmodifiableMapView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prices);
  }

  @override
  final int sell;
  @override
  @JsonKey(name: 'device_limit')
  final int deviceLimit;

  @override
  String toString() {
    return 'XboardPlan(id: $id, groupId: $groupId, transferEnable: $transferEnable, name: $name, speedLimit: $speedLimit, show: $show, sort: $sort, renew: $renew, content: $content, resetTrafficMethod: $resetTrafficMethod, capacityLimit: $capacityLimit, createdAt: $createdAt, updatedAt: $updatedAt, prices: $prices, sell: $sell, deviceLimit: $deviceLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.transferEnable, transferEnable) ||
                other.transferEnable == transferEnable) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit) &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.renew, renew) || other.renew == renew) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.resetTrafficMethod, resetTrafficMethod) ||
                other.resetTrafficMethod == resetTrafficMethod) &&
            (identical(other.capacityLimit, capacityLimit) ||
                other.capacityLimit == capacityLimit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.deviceLimit, deviceLimit) ||
                other.deviceLimit == deviceLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      transferEnable,
      name,
      speedLimit,
      show,
      sort,
      renew,
      content,
      resetTrafficMethod,
      capacityLimit,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_prices),
      sell,
      deviceLimit);

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardPlanImplCopyWith<_$XboardPlanImpl> get copyWith =>
      __$$XboardPlanImplCopyWithImpl<_$XboardPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardPlanImplToJson(
      this,
    );
  }
}

abstract class _XboardPlan implements XboardPlan {
  const factory _XboardPlan(
      {required final int id,
      @JsonKey(name: 'group_id') required final int groupId,
      @JsonKey(name: 'transfer_enable') required final int transferEnable,
      required final String name,
      @JsonKey(name: 'speed_limit') final int? speedLimit,
      required final bool show,
      final int? sort,
      required final bool renew,
      required final String content,
      @JsonKey(name: 'reset_traffic_method') final String? resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') final int? capacityLimit,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'updated_at') required final int updatedAt,
      required final Map<String, String> prices,
      required final int sell,
      @JsonKey(name: 'device_limit')
      required final int deviceLimit}) = _$XboardPlanImpl;

  factory _XboardPlan.fromJson(Map<String, dynamic> json) =
      _$XboardPlanImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'group_id')
  int get groupId;
  @override
  @JsonKey(name: 'transfer_enable')
  int get transferEnable;
  @override
  String get name;
  @override
  @JsonKey(name: 'speed_limit')
  int? get speedLimit;
  @override
  bool get show;
  @override
  int? get sort;
  @override
  bool get renew;
  @override
  String get content;
  @override
  @JsonKey(name: 'reset_traffic_method')
  String? get resetTrafficMethod;
  @override
  @JsonKey(name: 'capacity_limit')
  int? get capacityLimit;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  int get updatedAt;
  @override
  Map<String, String> get prices;
  @override
  int get sell;
  @override
  @JsonKey(name: 'device_limit')
  int get deviceLimit;

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardPlanImplCopyWith<_$XboardPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSubscribeInfo _$XboardSubscribeInfoFromJson(Map<String, dynamic> json) {
  return _XboardSubscribeInfo.fromJson(json);
}

/// @nodoc
mixin _$XboardSubscribeInfo {
  @JsonKey(name: 'subscribe_url')
  String get subscribeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_id')
  int get planId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  int get expiredAt => throw _privateConstructorUsedError;
  int get u => throw _privateConstructorUsedError;
  int get d => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_enable')
  int get transferEnable => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  XboardPlan get plan => throw _privateConstructorUsedError;
  @JsonKey(name: 'reset_day')
  int get resetDay => throw _privateConstructorUsedError;

  /// Serializes this XboardSubscribeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSubscribeInfoCopyWith<XboardSubscribeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSubscribeInfoCopyWith<$Res> {
  factory $XboardSubscribeInfoCopyWith(
          XboardSubscribeInfo value, $Res Function(XboardSubscribeInfo) then) =
      _$XboardSubscribeInfoCopyWithImpl<$Res, XboardSubscribeInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subscribe_url') String subscribeUrl,
      @JsonKey(name: 'plan_id') int planId,
      String token,
      @JsonKey(name: 'expired_at') int expiredAt,
      int u,
      int d,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String email,
      String uuid,
      XboardPlan plan,
      @JsonKey(name: 'reset_day') int resetDay});

  $XboardPlanCopyWith<$Res> get plan;
}

/// @nodoc
class _$XboardSubscribeInfoCopyWithImpl<$Res, $Val extends XboardSubscribeInfo>
    implements $XboardSubscribeInfoCopyWith<$Res> {
  _$XboardSubscribeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribeUrl = null,
    Object? planId = null,
    Object? token = null,
    Object? expiredAt = null,
    Object? u = null,
    Object? d = null,
    Object? transferEnable = null,
    Object? email = null,
    Object? uuid = null,
    Object? plan = null,
    Object? resetDay = null,
  }) {
    return _then(_value.copyWith(
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as int,
      u: null == u
          ? _value.u
          : u // ignore: cast_nullable_to_non_nullable
              as int,
      d: null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan,
      resetDay: null == resetDay
          ? _value.resetDay
          : resetDay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardPlanCopyWith<$Res> get plan {
    return $XboardPlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardSubscribeInfoImplCopyWith<$Res>
    implements $XboardSubscribeInfoCopyWith<$Res> {
  factory _$$XboardSubscribeInfoImplCopyWith(_$XboardSubscribeInfoImpl value,
          $Res Function(_$XboardSubscribeInfoImpl) then) =
      __$$XboardSubscribeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subscribe_url') String subscribeUrl,
      @JsonKey(name: 'plan_id') int planId,
      String token,
      @JsonKey(name: 'expired_at') int expiredAt,
      int u,
      int d,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String email,
      String uuid,
      XboardPlan plan,
      @JsonKey(name: 'reset_day') int resetDay});

  @override
  $XboardPlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$XboardSubscribeInfoImplCopyWithImpl<$Res>
    extends _$XboardSubscribeInfoCopyWithImpl<$Res, _$XboardSubscribeInfoImpl>
    implements _$$XboardSubscribeInfoImplCopyWith<$Res> {
  __$$XboardSubscribeInfoImplCopyWithImpl(_$XboardSubscribeInfoImpl _value,
      $Res Function(_$XboardSubscribeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribeUrl = null,
    Object? planId = null,
    Object? token = null,
    Object? expiredAt = null,
    Object? u = null,
    Object? d = null,
    Object? transferEnable = null,
    Object? email = null,
    Object? uuid = null,
    Object? plan = null,
    Object? resetDay = null,
  }) {
    return _then(_$XboardSubscribeInfoImpl(
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as int,
      u: null == u
          ? _value.u
          : u // ignore: cast_nullable_to_non_nullable
              as int,
      d: null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan,
      resetDay: null == resetDay
          ? _value.resetDay
          : resetDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscribeInfoImpl implements _XboardSubscribeInfo {
  const _$XboardSubscribeInfoImpl(
      {@JsonKey(name: 'subscribe_url') required this.subscribeUrl,
      @JsonKey(name: 'plan_id') required this.planId,
      required this.token,
      @JsonKey(name: 'expired_at') required this.expiredAt,
      required this.u,
      required this.d,
      @JsonKey(name: 'transfer_enable') required this.transferEnable,
      required this.email,
      required this.uuid,
      required this.plan,
      @JsonKey(name: 'reset_day') required this.resetDay});

  factory _$XboardSubscribeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardSubscribeInfoImplFromJson(json);

  @override
  @JsonKey(name: 'subscribe_url')
  final String subscribeUrl;
  @override
  @JsonKey(name: 'plan_id')
  final int planId;
  @override
  final String token;
  @override
  @JsonKey(name: 'expired_at')
  final int expiredAt;
  @override
  final int u;
  @override
  final int d;
  @override
  @JsonKey(name: 'transfer_enable')
  final int transferEnable;
  @override
  final String email;
  @override
  final String uuid;
  @override
  final XboardPlan plan;
  @override
  @JsonKey(name: 'reset_day')
  final int resetDay;

  @override
  String toString() {
    return 'XboardSubscribeInfo(subscribeUrl: $subscribeUrl, planId: $planId, token: $token, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, email: $email, uuid: $uuid, plan: $plan, resetDay: $resetDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscribeInfoImpl &&
            (identical(other.subscribeUrl, subscribeUrl) ||
                other.subscribeUrl == subscribeUrl) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.u, u) || other.u == u) &&
            (identical(other.d, d) || other.d == d) &&
            (identical(other.transferEnable, transferEnable) ||
                other.transferEnable == transferEnable) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.resetDay, resetDay) ||
                other.resetDay == resetDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subscribeUrl, planId, token,
      expiredAt, u, d, transferEnable, email, uuid, plan, resetDay);

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSubscribeInfoImplCopyWith<_$XboardSubscribeInfoImpl> get copyWith =>
      __$$XboardSubscribeInfoImplCopyWithImpl<_$XboardSubscribeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSubscribeInfoImplToJson(
      this,
    );
  }
}

abstract class _XboardSubscribeInfo implements XboardSubscribeInfo {
  const factory _XboardSubscribeInfo(
          {@JsonKey(name: 'subscribe_url') required final String subscribeUrl,
          @JsonKey(name: 'plan_id') required final int planId,
          required final String token,
          @JsonKey(name: 'expired_at') required final int expiredAt,
          required final int u,
          required final int d,
          @JsonKey(name: 'transfer_enable') required final int transferEnable,
          required final String email,
          required final String uuid,
          required final XboardPlan plan,
          @JsonKey(name: 'reset_day') required final int resetDay}) =
      _$XboardSubscribeInfoImpl;

  factory _XboardSubscribeInfo.fromJson(Map<String, dynamic> json) =
      _$XboardSubscribeInfoImpl.fromJson;

  @override
  @JsonKey(name: 'subscribe_url')
  String get subscribeUrl;
  @override
  @JsonKey(name: 'plan_id')
  int get planId;
  @override
  String get token;
  @override
  @JsonKey(name: 'expired_at')
  int get expiredAt;
  @override
  int get u;
  @override
  int get d;
  @override
  @JsonKey(name: 'transfer_enable')
  int get transferEnable;
  @override
  String get email;
  @override
  String get uuid;
  @override
  XboardPlan get plan;
  @override
  @JsonKey(name: 'reset_day')
  int get resetDay;

  /// Create a copy of XboardSubscribeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscribeInfoImplCopyWith<_$XboardSubscribeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
