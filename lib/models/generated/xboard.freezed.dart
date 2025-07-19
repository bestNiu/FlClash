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
  String? get telegramId => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'telegram_id') String? telegramId,
      String uuid,
      @JsonKey(name: 'avatar_url') String avatarUrl});
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
    Object? uuid = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
              as String?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      @JsonKey(name: 'telegram_id') String? telegramId,
      String uuid,
      @JsonKey(name: 'avatar_url') String avatarUrl});
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
    Object? uuid = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$XboardUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
              as String?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardUserImpl implements _XboardUser {
  const _$XboardUserImpl(
      {required this.email,
      @JsonKey(name: 'transfer_enable') this.transferEnable = 0,
      @JsonKey(name: 'last_login_at') this.lastLoginAt = 0,
      @JsonKey(name: 'created_at') this.createdAt = 0,
      this.banned = false,
      @JsonKey(name: 'remind_expire') this.remindExpire = true,
      @JsonKey(name: 'remind_traffic') this.remindTraffic = true,
      @JsonKey(name: 'expired_at') this.expiredAt = 0,
      this.balance = 0,
      @JsonKey(name: 'commission_balance') this.commissionBalance = 0,
      @JsonKey(name: 'plan_id') this.planId = 0,
      this.discount,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'telegram_id') this.telegramId,
      this.uuid = "",
      @JsonKey(name: 'avatar_url') this.avatarUrl = ""});

  factory _$XboardUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardUserImplFromJson(json);

  @override
  final String email;
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
  @JsonKey()
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
  @JsonKey()
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
  final String? telegramId;
  @override
  @JsonKey()
  final String uuid;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'XboardUser(email: $email, transferEnable: $transferEnable, lastLoginAt: $lastLoginAt, createdAt: $createdAt, banned: $banned, remindExpire: $remindExpire, remindTraffic: $remindTraffic, expiredAt: $expiredAt, balance: $balance, commissionBalance: $commissionBalance, planId: $planId, discount: $discount, commissionRate: $commissionRate, telegramId: $telegramId, uuid: $uuid, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardUserImpl &&
            (identical(other.email, email) || other.email == email) &&
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
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
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
      uuid,
      avatarUrl);

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
      @JsonKey(name: 'transfer_enable') final int transferEnable,
      @JsonKey(name: 'last_login_at') final int lastLoginAt,
      @JsonKey(name: 'created_at') final int createdAt,
      final bool banned,
      @JsonKey(name: 'remind_expire') final bool remindExpire,
      @JsonKey(name: 'remind_traffic') final bool remindTraffic,
      @JsonKey(name: 'expired_at') final int expiredAt,
      final int balance,
      @JsonKey(name: 'commission_balance') final int commissionBalance,
      @JsonKey(name: 'plan_id') final int planId,
      final int? discount,
      @JsonKey(name: 'commission_rate') final int? commissionRate,
      @JsonKey(name: 'telegram_id') final String? telegramId,
      final String uuid,
      @JsonKey(name: 'avatar_url') final String avatarUrl}) = _$XboardUserImpl;

  factory _XboardUser.fromJson(Map<String, dynamic> json) =
      _$XboardUserImpl.fromJson;

  @override
  String get email;
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
  String? get telegramId;
  @override
  String get uuid;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

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
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get transferEnable => throw _privateConstructorUsedError;
  int get monthPrice => throw _privateConstructorUsedError;
  int get quarterPrice => throw _privateConstructorUsedError;
  int get halfYearPrice => throw _privateConstructorUsedError;
  int get yearPrice => throw _privateConstructorUsedError;
  int get twoYearPrice => throw _privateConstructorUsedError;
  int get threeYearPrice => throw _privateConstructorUsedError;
  int get onetimePrice => throw _privateConstructorUsedError;
  int get resetPrice => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;
  int get sort => throw _privateConstructorUsedError;
  bool get renew => throw _privateConstructorUsedError;
  bool get resetTrafficMethod => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  int get speeds => throw _privateConstructorUsedError;

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
      {int id,
      String name,
      int price,
      int transferEnable,
      int monthPrice,
      int quarterPrice,
      int halfYearPrice,
      int yearPrice,
      int twoYearPrice,
      int threeYearPrice,
      int onetimePrice,
      int resetPrice,
      String content,
      bool show,
      int sort,
      bool renew,
      bool resetTrafficMethod,
      int capacity,
      int speeds});
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
    Object? price = null,
    Object? transferEnable = null,
    Object? monthPrice = null,
    Object? quarterPrice = null,
    Object? halfYearPrice = null,
    Object? yearPrice = null,
    Object? twoYearPrice = null,
    Object? threeYearPrice = null,
    Object? onetimePrice = null,
    Object? resetPrice = null,
    Object? content = null,
    Object? show = null,
    Object? sort = null,
    Object? renew = null,
    Object? resetTrafficMethod = null,
    Object? capacity = null,
    Object? speeds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      monthPrice: null == monthPrice
          ? _value.monthPrice
          : monthPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quarterPrice: null == quarterPrice
          ? _value.quarterPrice
          : quarterPrice // ignore: cast_nullable_to_non_nullable
              as int,
      halfYearPrice: null == halfYearPrice
          ? _value.halfYearPrice
          : halfYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      yearPrice: null == yearPrice
          ? _value.yearPrice
          : yearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      twoYearPrice: null == twoYearPrice
          ? _value.twoYearPrice
          : twoYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      threeYearPrice: null == threeYearPrice
          ? _value.threeYearPrice
          : threeYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      onetimePrice: null == onetimePrice
          ? _value.onetimePrice
          : onetimePrice // ignore: cast_nullable_to_non_nullable
              as int,
      resetPrice: null == resetPrice
          ? _value.resetPrice
          : resetPrice // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      renew: null == renew
          ? _value.renew
          : renew // ignore: cast_nullable_to_non_nullable
              as bool,
      resetTrafficMethod: null == resetTrafficMethod
          ? _value.resetTrafficMethod
          : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      speeds: null == speeds
          ? _value.speeds
          : speeds // ignore: cast_nullable_to_non_nullable
              as int,
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
      {int id,
      String name,
      int price,
      int transferEnable,
      int monthPrice,
      int quarterPrice,
      int halfYearPrice,
      int yearPrice,
      int twoYearPrice,
      int threeYearPrice,
      int onetimePrice,
      int resetPrice,
      String content,
      bool show,
      int sort,
      bool renew,
      bool resetTrafficMethod,
      int capacity,
      int speeds});
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
    Object? price = null,
    Object? transferEnable = null,
    Object? monthPrice = null,
    Object? quarterPrice = null,
    Object? halfYearPrice = null,
    Object? yearPrice = null,
    Object? twoYearPrice = null,
    Object? threeYearPrice = null,
    Object? onetimePrice = null,
    Object? resetPrice = null,
    Object? content = null,
    Object? show = null,
    Object? sort = null,
    Object? renew = null,
    Object? resetTrafficMethod = null,
    Object? capacity = null,
    Object? speeds = null,
  }) {
    return _then(_$XboardSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      transferEnable: null == transferEnable
          ? _value.transferEnable
          : transferEnable // ignore: cast_nullable_to_non_nullable
              as int,
      monthPrice: null == monthPrice
          ? _value.monthPrice
          : monthPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quarterPrice: null == quarterPrice
          ? _value.quarterPrice
          : quarterPrice // ignore: cast_nullable_to_non_nullable
              as int,
      halfYearPrice: null == halfYearPrice
          ? _value.halfYearPrice
          : halfYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      yearPrice: null == yearPrice
          ? _value.yearPrice
          : yearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      twoYearPrice: null == twoYearPrice
          ? _value.twoYearPrice
          : twoYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      threeYearPrice: null == threeYearPrice
          ? _value.threeYearPrice
          : threeYearPrice // ignore: cast_nullable_to_non_nullable
              as int,
      onetimePrice: null == onetimePrice
          ? _value.onetimePrice
          : onetimePrice // ignore: cast_nullable_to_non_nullable
              as int,
      resetPrice: null == resetPrice
          ? _value.resetPrice
          : resetPrice // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      renew: null == renew
          ? _value.renew
          : renew // ignore: cast_nullable_to_non_nullable
              as bool,
      resetTrafficMethod: null == resetTrafficMethod
          ? _value.resetTrafficMethod
          : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      speeds: null == speeds
          ? _value.speeds
          : speeds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscriptionImpl implements _XboardSubscription {
  const _$XboardSubscriptionImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.transferEnable,
      required this.monthPrice,
      required this.quarterPrice,
      required this.halfYearPrice,
      required this.yearPrice,
      required this.twoYearPrice,
      required this.threeYearPrice,
      required this.onetimePrice,
      required this.resetPrice,
      this.content = "",
      this.show = true,
      this.sort = 0,
      this.renew = false,
      this.resetTrafficMethod = false,
      this.capacity = 0,
      this.speeds = 0});

  factory _$XboardSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardSubscriptionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int price;
  @override
  final int transferEnable;
  @override
  final int monthPrice;
  @override
  final int quarterPrice;
  @override
  final int halfYearPrice;
  @override
  final int yearPrice;
  @override
  final int twoYearPrice;
  @override
  final int threeYearPrice;
  @override
  final int onetimePrice;
  @override
  final int resetPrice;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final bool show;
  @override
  @JsonKey()
  final int sort;
  @override
  @JsonKey()
  final bool renew;
  @override
  @JsonKey()
  final bool resetTrafficMethod;
  @override
  @JsonKey()
  final int capacity;
  @override
  @JsonKey()
  final int speeds;

  @override
  String toString() {
    return 'XboardSubscription(id: $id, name: $name, price: $price, transferEnable: $transferEnable, monthPrice: $monthPrice, quarterPrice: $quarterPrice, halfYearPrice: $halfYearPrice, yearPrice: $yearPrice, twoYearPrice: $twoYearPrice, threeYearPrice: $threeYearPrice, onetimePrice: $onetimePrice, resetPrice: $resetPrice, content: $content, show: $show, sort: $sort, renew: $renew, resetTrafficMethod: $resetTrafficMethod, capacity: $capacity, speeds: $speeds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.transferEnable, transferEnable) ||
                other.transferEnable == transferEnable) &&
            (identical(other.monthPrice, monthPrice) ||
                other.monthPrice == monthPrice) &&
            (identical(other.quarterPrice, quarterPrice) ||
                other.quarterPrice == quarterPrice) &&
            (identical(other.halfYearPrice, halfYearPrice) ||
                other.halfYearPrice == halfYearPrice) &&
            (identical(other.yearPrice, yearPrice) ||
                other.yearPrice == yearPrice) &&
            (identical(other.twoYearPrice, twoYearPrice) ||
                other.twoYearPrice == twoYearPrice) &&
            (identical(other.threeYearPrice, threeYearPrice) ||
                other.threeYearPrice == threeYearPrice) &&
            (identical(other.onetimePrice, onetimePrice) ||
                other.onetimePrice == onetimePrice) &&
            (identical(other.resetPrice, resetPrice) ||
                other.resetPrice == resetPrice) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.renew, renew) || other.renew == renew) &&
            (identical(other.resetTrafficMethod, resetTrafficMethod) ||
                other.resetTrafficMethod == resetTrafficMethod) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.speeds, speeds) || other.speeds == speeds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        price,
        transferEnable,
        monthPrice,
        quarterPrice,
        halfYearPrice,
        yearPrice,
        twoYearPrice,
        threeYearPrice,
        onetimePrice,
        resetPrice,
        content,
        show,
        sort,
        renew,
        resetTrafficMethod,
        capacity,
        speeds
      ]);

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
      {required final int id,
      required final String name,
      required final int price,
      required final int transferEnable,
      required final int monthPrice,
      required final int quarterPrice,
      required final int halfYearPrice,
      required final int yearPrice,
      required final int twoYearPrice,
      required final int threeYearPrice,
      required final int onetimePrice,
      required final int resetPrice,
      final String content,
      final bool show,
      final int sort,
      final bool renew,
      final bool resetTrafficMethod,
      final int capacity,
      final int speeds}) = _$XboardSubscriptionImpl;

  factory _XboardSubscription.fromJson(Map<String, dynamic> json) =
      _$XboardSubscriptionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get price;
  @override
  int get transferEnable;
  @override
  int get monthPrice;
  @override
  int get quarterPrice;
  @override
  int get halfYearPrice;
  @override
  int get yearPrice;
  @override
  int get twoYearPrice;
  @override
  int get threeYearPrice;
  @override
  int get onetimePrice;
  @override
  int get resetPrice;
  @override
  String get content;
  @override
  bool get show;
  @override
  int get sort;
  @override
  bool get renew;
  @override
  bool get resetTrafficMethod;
  @override
  int get capacity;
  @override
  int get speeds;

  /// Create a copy of XboardSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscriptionImplCopyWith<_$XboardSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardNode _$XboardNodeFromJson(Map<String, dynamic> json) {
  return _XboardNode.fromJson(json);
}

/// @nodoc
mixin _$XboardNode {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get server => throw _privateConstructorUsedError;
  int get serverPort => throw _privateConstructorUsedError;
  String get cipher => throw _privateConstructorUsedError;
  String get obfs => throw _privateConstructorUsedError;
  String get obfsSettings => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  String get protocolSettings => throw _privateConstructorUsedError;
  String get tags => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;
  int get sort => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get networkSettings => throw _privateConstructorUsedError;
  String get tlsSettings => throw _privateConstructorUsedError;
  String get ruleSettings => throw _privateConstructorUsedError;
  String get dnsSettings => throw _privateConstructorUsedError;

  /// Serializes this XboardNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardNodeCopyWith<XboardNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardNodeCopyWith<$Res> {
  factory $XboardNodeCopyWith(
          XboardNode value, $Res Function(XboardNode) then) =
      _$XboardNodeCopyWithImpl<$Res, XboardNode>;
  @useResult
  $Res call(
      {int id,
      String name,
      String server,
      int serverPort,
      String cipher,
      String obfs,
      String obfsSettings,
      String protocol,
      String protocolSettings,
      String tags,
      int rate,
      bool show,
      int sort,
      String remark,
      String type,
      String networkSettings,
      String tlsSettings,
      String ruleSettings,
      String dnsSettings});
}

/// @nodoc
class _$XboardNodeCopyWithImpl<$Res, $Val extends XboardNode>
    implements $XboardNodeCopyWith<$Res> {
  _$XboardNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? server = null,
    Object? serverPort = null,
    Object? cipher = null,
    Object? obfs = null,
    Object? obfsSettings = null,
    Object? protocol = null,
    Object? protocolSettings = null,
    Object? tags = null,
    Object? rate = null,
    Object? show = null,
    Object? sort = null,
    Object? remark = null,
    Object? type = null,
    Object? networkSettings = null,
    Object? tlsSettings = null,
    Object? ruleSettings = null,
    Object? dnsSettings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      serverPort: null == serverPort
          ? _value.serverPort
          : serverPort // ignore: cast_nullable_to_non_nullable
              as int,
      cipher: null == cipher
          ? _value.cipher
          : cipher // ignore: cast_nullable_to_non_nullable
              as String,
      obfs: null == obfs
          ? _value.obfs
          : obfs // ignore: cast_nullable_to_non_nullable
              as String,
      obfsSettings: null == obfsSettings
          ? _value.obfsSettings
          : obfsSettings // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      protocolSettings: null == protocolSettings
          ? _value.protocolSettings
          : protocolSettings // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      networkSettings: null == networkSettings
          ? _value.networkSettings
          : networkSettings // ignore: cast_nullable_to_non_nullable
              as String,
      tlsSettings: null == tlsSettings
          ? _value.tlsSettings
          : tlsSettings // ignore: cast_nullable_to_non_nullable
              as String,
      ruleSettings: null == ruleSettings
          ? _value.ruleSettings
          : ruleSettings // ignore: cast_nullable_to_non_nullable
              as String,
      dnsSettings: null == dnsSettings
          ? _value.dnsSettings
          : dnsSettings // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardNodeImplCopyWith<$Res>
    implements $XboardNodeCopyWith<$Res> {
  factory _$$XboardNodeImplCopyWith(
          _$XboardNodeImpl value, $Res Function(_$XboardNodeImpl) then) =
      __$$XboardNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String server,
      int serverPort,
      String cipher,
      String obfs,
      String obfsSettings,
      String protocol,
      String protocolSettings,
      String tags,
      int rate,
      bool show,
      int sort,
      String remark,
      String type,
      String networkSettings,
      String tlsSettings,
      String ruleSettings,
      String dnsSettings});
}

/// @nodoc
class __$$XboardNodeImplCopyWithImpl<$Res>
    extends _$XboardNodeCopyWithImpl<$Res, _$XboardNodeImpl>
    implements _$$XboardNodeImplCopyWith<$Res> {
  __$$XboardNodeImplCopyWithImpl(
      _$XboardNodeImpl _value, $Res Function(_$XboardNodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? server = null,
    Object? serverPort = null,
    Object? cipher = null,
    Object? obfs = null,
    Object? obfsSettings = null,
    Object? protocol = null,
    Object? protocolSettings = null,
    Object? tags = null,
    Object? rate = null,
    Object? show = null,
    Object? sort = null,
    Object? remark = null,
    Object? type = null,
    Object? networkSettings = null,
    Object? tlsSettings = null,
    Object? ruleSettings = null,
    Object? dnsSettings = null,
  }) {
    return _then(_$XboardNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      serverPort: null == serverPort
          ? _value.serverPort
          : serverPort // ignore: cast_nullable_to_non_nullable
              as int,
      cipher: null == cipher
          ? _value.cipher
          : cipher // ignore: cast_nullable_to_non_nullable
              as String,
      obfs: null == obfs
          ? _value.obfs
          : obfs // ignore: cast_nullable_to_non_nullable
              as String,
      obfsSettings: null == obfsSettings
          ? _value.obfsSettings
          : obfsSettings // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      protocolSettings: null == protocolSettings
          ? _value.protocolSettings
          : protocolSettings // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      networkSettings: null == networkSettings
          ? _value.networkSettings
          : networkSettings // ignore: cast_nullable_to_non_nullable
              as String,
      tlsSettings: null == tlsSettings
          ? _value.tlsSettings
          : tlsSettings // ignore: cast_nullable_to_non_nullable
              as String,
      ruleSettings: null == ruleSettings
          ? _value.ruleSettings
          : ruleSettings // ignore: cast_nullable_to_non_nullable
              as String,
      dnsSettings: null == dnsSettings
          ? _value.dnsSettings
          : dnsSettings // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardNodeImpl implements _XboardNode {
  const _$XboardNodeImpl(
      {required this.id,
      required this.name,
      required this.server,
      required this.serverPort,
      required this.cipher,
      required this.obfs,
      required this.obfsSettings,
      required this.protocol,
      required this.protocolSettings,
      this.tags = "",
      this.rate = 1,
      this.show = true,
      this.sort = 0,
      this.remark = "",
      this.type = "shadowsocks",
      this.networkSettings = "",
      this.tlsSettings = "",
      this.ruleSettings = "",
      this.dnsSettings = ""});

  factory _$XboardNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardNodeImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String server;
  @override
  final int serverPort;
  @override
  final String cipher;
  @override
  final String obfs;
  @override
  final String obfsSettings;
  @override
  final String protocol;
  @override
  final String protocolSettings;
  @override
  @JsonKey()
  final String tags;
  @override
  @JsonKey()
  final int rate;
  @override
  @JsonKey()
  final bool show;
  @override
  @JsonKey()
  final int sort;
  @override
  @JsonKey()
  final String remark;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String networkSettings;
  @override
  @JsonKey()
  final String tlsSettings;
  @override
  @JsonKey()
  final String ruleSettings;
  @override
  @JsonKey()
  final String dnsSettings;

  @override
  String toString() {
    return 'XboardNode(id: $id, name: $name, server: $server, serverPort: $serverPort, cipher: $cipher, obfs: $obfs, obfsSettings: $obfsSettings, protocol: $protocol, protocolSettings: $protocolSettings, tags: $tags, rate: $rate, show: $show, sort: $sort, remark: $remark, type: $type, networkSettings: $networkSettings, tlsSettings: $tlsSettings, ruleSettings: $ruleSettings, dnsSettings: $dnsSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.serverPort, serverPort) ||
                other.serverPort == serverPort) &&
            (identical(other.cipher, cipher) || other.cipher == cipher) &&
            (identical(other.obfs, obfs) || other.obfs == obfs) &&
            (identical(other.obfsSettings, obfsSettings) ||
                other.obfsSettings == obfsSettings) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.protocolSettings, protocolSettings) ||
                other.protocolSettings == protocolSettings) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.networkSettings, networkSettings) ||
                other.networkSettings == networkSettings) &&
            (identical(other.tlsSettings, tlsSettings) ||
                other.tlsSettings == tlsSettings) &&
            (identical(other.ruleSettings, ruleSettings) ||
                other.ruleSettings == ruleSettings) &&
            (identical(other.dnsSettings, dnsSettings) ||
                other.dnsSettings == dnsSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        server,
        serverPort,
        cipher,
        obfs,
        obfsSettings,
        protocol,
        protocolSettings,
        tags,
        rate,
        show,
        sort,
        remark,
        type,
        networkSettings,
        tlsSettings,
        ruleSettings,
        dnsSettings
      ]);

  /// Create a copy of XboardNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardNodeImplCopyWith<_$XboardNodeImpl> get copyWith =>
      __$$XboardNodeImplCopyWithImpl<_$XboardNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardNodeImplToJson(
      this,
    );
  }
}

abstract class _XboardNode implements XboardNode {
  const factory _XboardNode(
      {required final int id,
      required final String name,
      required final String server,
      required final int serverPort,
      required final String cipher,
      required final String obfs,
      required final String obfsSettings,
      required final String protocol,
      required final String protocolSettings,
      final String tags,
      final int rate,
      final bool show,
      final int sort,
      final String remark,
      final String type,
      final String networkSettings,
      final String tlsSettings,
      final String ruleSettings,
      final String dnsSettings}) = _$XboardNodeImpl;

  factory _XboardNode.fromJson(Map<String, dynamic> json) =
      _$XboardNodeImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get server;
  @override
  int get serverPort;
  @override
  String get cipher;
  @override
  String get obfs;
  @override
  String get obfsSettings;
  @override
  String get protocol;
  @override
  String get protocolSettings;
  @override
  String get tags;
  @override
  int get rate;
  @override
  bool get show;
  @override
  int get sort;
  @override
  String get remark;
  @override
  String get type;
  @override
  String get networkSettings;
  @override
  String get tlsSettings;
  @override
  String get ruleSettings;
  @override
  String get dnsSettings;

  /// Create a copy of XboardNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardNodeImplCopyWith<_$XboardNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardLoginResponse _$XboardLoginResponseFromJson(Map<String, dynamic> json) {
  return _XboardLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardLoginResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  XboardLoginData? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this XboardLoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardLoginResponseCopyWith<XboardLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardLoginResponseCopyWith<$Res> {
  factory $XboardLoginResponseCopyWith(
          XboardLoginResponse value, $Res Function(XboardLoginResponse) then) =
      _$XboardLoginResponseCopyWithImpl<$Res, XboardLoginResponse>;
  @useResult
  $Res call(
      {String status, String message, XboardLoginData? data, String? error});

  $XboardLoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$XboardLoginResponseCopyWithImpl<$Res, $Val extends XboardLoginResponse>
    implements $XboardLoginResponseCopyWith<$Res> {
  _$XboardLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardLoginData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardLoginDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $XboardLoginDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardLoginResponseImplCopyWith<$Res>
    implements $XboardLoginResponseCopyWith<$Res> {
  factory _$$XboardLoginResponseImplCopyWith(_$XboardLoginResponseImpl value,
          $Res Function(_$XboardLoginResponseImpl) then) =
      __$$XboardLoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, String message, XboardLoginData? data, String? error});

  @override
  $XboardLoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$XboardLoginResponseImplCopyWithImpl<$Res>
    extends _$XboardLoginResponseCopyWithImpl<$Res, _$XboardLoginResponseImpl>
    implements _$$XboardLoginResponseImplCopyWith<$Res> {
  __$$XboardLoginResponseImplCopyWithImpl(_$XboardLoginResponseImpl _value,
      $Res Function(_$XboardLoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$XboardLoginResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardLoginData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardLoginResponseImpl implements _XboardLoginResponse {
  const _$XboardLoginResponseImpl(
      {required this.status, required this.message, this.data, this.error});

  factory _$XboardLoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardLoginResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final XboardLoginData? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'XboardLoginResponse(status: $status, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardLoginResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, error);

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardLoginResponseImplCopyWith<_$XboardLoginResponseImpl> get copyWith =>
      __$$XboardLoginResponseImplCopyWithImpl<_$XboardLoginResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardLoginResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardLoginResponse implements XboardLoginResponse {
  const factory _XboardLoginResponse(
      {required final String status,
      required final String message,
      final XboardLoginData? data,
      final String? error}) = _$XboardLoginResponseImpl;

  factory _XboardLoginResponse.fromJson(Map<String, dynamic> json) =
      _$XboardLoginResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  XboardLoginData? get data;
  @override
  String? get error;

  /// Create a copy of XboardLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardLoginResponseImplCopyWith<_$XboardLoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardLoginData _$XboardLoginDataFromJson(Map<String, dynamic> json) {
  return _XboardLoginData.fromJson(json);
}

/// @nodoc
mixin _$XboardLoginData {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_data')
  String get authData => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;

  /// Serializes this XboardLoginData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardLoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardLoginDataCopyWith<XboardLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardLoginDataCopyWith<$Res> {
  factory $XboardLoginDataCopyWith(
          XboardLoginData value, $Res Function(XboardLoginData) then) =
      _$XboardLoginDataCopyWithImpl<$Res, XboardLoginData>;
  @useResult
  $Res call(
      {String token,
      @JsonKey(name: 'auth_data') String authData,
      @JsonKey(name: 'is_admin') bool isAdmin});
}

/// @nodoc
class _$XboardLoginDataCopyWithImpl<$Res, $Val extends XboardLoginData>
    implements $XboardLoginDataCopyWith<$Res> {
  _$XboardLoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardLoginData
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
abstract class _$$XboardLoginDataImplCopyWith<$Res>
    implements $XboardLoginDataCopyWith<$Res> {
  factory _$$XboardLoginDataImplCopyWith(_$XboardLoginDataImpl value,
          $Res Function(_$XboardLoginDataImpl) then) =
      __$$XboardLoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      @JsonKey(name: 'auth_data') String authData,
      @JsonKey(name: 'is_admin') bool isAdmin});
}

/// @nodoc
class __$$XboardLoginDataImplCopyWithImpl<$Res>
    extends _$XboardLoginDataCopyWithImpl<$Res, _$XboardLoginDataImpl>
    implements _$$XboardLoginDataImplCopyWith<$Res> {
  __$$XboardLoginDataImplCopyWithImpl(
      _$XboardLoginDataImpl _value, $Res Function(_$XboardLoginDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardLoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? authData = null,
    Object? isAdmin = null,
  }) {
    return _then(_$XboardLoginDataImpl(
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
class _$XboardLoginDataImpl implements _XboardLoginData {
  const _$XboardLoginDataImpl(
      {required this.token,
      @JsonKey(name: 'auth_data') required this.authData,
      @JsonKey(name: 'is_admin') this.isAdmin = false});

  factory _$XboardLoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardLoginDataImplFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'auth_data')
  final String authData;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;

  @override
  String toString() {
    return 'XboardLoginData(token: $token, authData: $authData, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardLoginDataImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.authData, authData) ||
                other.authData == authData) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, authData, isAdmin);

  /// Create a copy of XboardLoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardLoginDataImplCopyWith<_$XboardLoginDataImpl> get copyWith =>
      __$$XboardLoginDataImplCopyWithImpl<_$XboardLoginDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardLoginDataImplToJson(
      this,
    );
  }
}

abstract class _XboardLoginData implements XboardLoginData {
  const factory _XboardLoginData(
      {required final String token,
      @JsonKey(name: 'auth_data') required final String authData,
      @JsonKey(name: 'is_admin') final bool isAdmin}) = _$XboardLoginDataImpl;

  factory _XboardLoginData.fromJson(Map<String, dynamic> json) =
      _$XboardLoginDataImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'auth_data')
  String get authData;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;

  /// Create a copy of XboardLoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardLoginDataImplCopyWith<_$XboardLoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardApiResponse _$XboardApiResponseFromJson(Map<String, dynamic> json) {
  return _XboardApiResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardApiResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this XboardApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardApiResponseCopyWith<XboardApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardApiResponseCopyWith<$Res> {
  factory $XboardApiResponseCopyWith(
          XboardApiResponse value, $Res Function(XboardApiResponse) then) =
      _$XboardApiResponseCopyWithImpl<$Res, XboardApiResponse>;
  @useResult
  $Res call({bool success, String message, dynamic data});
}

/// @nodoc
class _$XboardApiResponseCopyWithImpl<$Res, $Val extends XboardApiResponse>
    implements $XboardApiResponseCopyWith<$Res> {
  _$XboardApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardApiResponseImplCopyWith<$Res>
    implements $XboardApiResponseCopyWith<$Res> {
  factory _$$XboardApiResponseImplCopyWith(_$XboardApiResponseImpl value,
          $Res Function(_$XboardApiResponseImpl) then) =
      __$$XboardApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, dynamic data});
}

/// @nodoc
class __$$XboardApiResponseImplCopyWithImpl<$Res>
    extends _$XboardApiResponseCopyWithImpl<$Res, _$XboardApiResponseImpl>
    implements _$$XboardApiResponseImplCopyWith<$Res> {
  __$$XboardApiResponseImplCopyWithImpl(_$XboardApiResponseImpl _value,
      $Res Function(_$XboardApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$XboardApiResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardApiResponseImpl implements _XboardApiResponse {
  const _$XboardApiResponseImpl(
      {required this.success, required this.message, this.data});

  factory _$XboardApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'XboardApiResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, message, const DeepCollectionEquality().hash(data));

  /// Create a copy of XboardApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardApiResponseImplCopyWith<_$XboardApiResponseImpl> get copyWith =>
      __$$XboardApiResponseImplCopyWithImpl<_$XboardApiResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardApiResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardApiResponse implements XboardApiResponse {
  const factory _XboardApiResponse(
      {required final bool success,
      required final String message,
      final dynamic data}) = _$XboardApiResponseImpl;

  factory _XboardApiResponse.fromJson(Map<String, dynamic> json) =
      _$XboardApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  dynamic get data;

  /// Create a copy of XboardApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardApiResponseImplCopyWith<_$XboardApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardUserResponse _$XboardUserResponseFromJson(Map<String, dynamic> json) {
  return _XboardUserResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardUserResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  XboardUser? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this XboardUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardUserResponseCopyWith<XboardUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardUserResponseCopyWith<$Res> {
  factory $XboardUserResponseCopyWith(
          XboardUserResponse value, $Res Function(XboardUserResponse) then) =
      _$XboardUserResponseCopyWithImpl<$Res, XboardUserResponse>;
  @useResult
  $Res call({String status, String message, XboardUser? data, String? error});

  $XboardUserCopyWith<$Res>? get data;
}

/// @nodoc
class _$XboardUserResponseCopyWithImpl<$Res, $Val extends XboardUserResponse>
    implements $XboardUserResponseCopyWith<$Res> {
  _$XboardUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardUser?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardUserCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $XboardUserCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardUserResponseImplCopyWith<$Res>
    implements $XboardUserResponseCopyWith<$Res> {
  factory _$$XboardUserResponseImplCopyWith(_$XboardUserResponseImpl value,
          $Res Function(_$XboardUserResponseImpl) then) =
      __$$XboardUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, XboardUser? data, String? error});

  @override
  $XboardUserCopyWith<$Res>? get data;
}

/// @nodoc
class __$$XboardUserResponseImplCopyWithImpl<$Res>
    extends _$XboardUserResponseCopyWithImpl<$Res, _$XboardUserResponseImpl>
    implements _$$XboardUserResponseImplCopyWith<$Res> {
  __$$XboardUserResponseImplCopyWithImpl(_$XboardUserResponseImpl _value,
      $Res Function(_$XboardUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$XboardUserResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardUser?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardUserResponseImpl implements _XboardUserResponse {
  const _$XboardUserResponseImpl(
      {required this.status, required this.message, this.data, this.error});

  factory _$XboardUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardUserResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final XboardUser? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'XboardUserResponse(status: $status, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardUserResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, error);

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardUserResponseImplCopyWith<_$XboardUserResponseImpl> get copyWith =>
      __$$XboardUserResponseImplCopyWithImpl<_$XboardUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardUserResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardUserResponse implements XboardUserResponse {
  const factory _XboardUserResponse(
      {required final String status,
      required final String message,
      final XboardUser? data,
      final String? error}) = _$XboardUserResponseImpl;

  factory _XboardUserResponse.fromJson(Map<String, dynamic> json) =
      _$XboardUserResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  XboardUser? get data;
  @override
  String? get error;

  /// Create a copy of XboardUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardUserResponseImplCopyWith<_$XboardUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSubscriptionsResponse _$XboardSubscriptionsResponseFromJson(
    Map<String, dynamic> json) {
  return _XboardSubscriptionsResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardSubscriptionsResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<XboardSubscription> get data => throw _privateConstructorUsedError;

  /// Serializes this XboardSubscriptionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSubscriptionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSubscriptionsResponseCopyWith<XboardSubscriptionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSubscriptionsResponseCopyWith<$Res> {
  factory $XboardSubscriptionsResponseCopyWith(
          XboardSubscriptionsResponse value,
          $Res Function(XboardSubscriptionsResponse) then) =
      _$XboardSubscriptionsResponseCopyWithImpl<$Res,
          XboardSubscriptionsResponse>;
  @useResult
  $Res call({bool success, String message, List<XboardSubscription> data});
}

/// @nodoc
class _$XboardSubscriptionsResponseCopyWithImpl<$Res,
        $Val extends XboardSubscriptionsResponse>
    implements $XboardSubscriptionsResponseCopyWith<$Res> {
  _$XboardSubscriptionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSubscriptionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<XboardSubscription>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardSubscriptionsResponseImplCopyWith<$Res>
    implements $XboardSubscriptionsResponseCopyWith<$Res> {
  factory _$$XboardSubscriptionsResponseImplCopyWith(
          _$XboardSubscriptionsResponseImpl value,
          $Res Function(_$XboardSubscriptionsResponseImpl) then) =
      __$$XboardSubscriptionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<XboardSubscription> data});
}

/// @nodoc
class __$$XboardSubscriptionsResponseImplCopyWithImpl<$Res>
    extends _$XboardSubscriptionsResponseCopyWithImpl<$Res,
        _$XboardSubscriptionsResponseImpl>
    implements _$$XboardSubscriptionsResponseImplCopyWith<$Res> {
  __$$XboardSubscriptionsResponseImplCopyWithImpl(
      _$XboardSubscriptionsResponseImpl _value,
      $Res Function(_$XboardSubscriptionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSubscriptionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$XboardSubscriptionsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<XboardSubscription>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscriptionsResponseImpl
    implements _XboardSubscriptionsResponse {
  const _$XboardSubscriptionsResponseImpl(
      {required this.success,
      required this.message,
      final List<XboardSubscription> data = const []})
      : _data = data;

  factory _$XboardSubscriptionsResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$XboardSubscriptionsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<XboardSubscription> _data;
  @override
  @JsonKey()
  List<XboardSubscription> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'XboardSubscriptionsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscriptionsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of XboardSubscriptionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSubscriptionsResponseImplCopyWith<_$XboardSubscriptionsResponseImpl>
      get copyWith => __$$XboardSubscriptionsResponseImplCopyWithImpl<
          _$XboardSubscriptionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSubscriptionsResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardSubscriptionsResponse
    implements XboardSubscriptionsResponse {
  const factory _XboardSubscriptionsResponse(
      {required final bool success,
      required final String message,
      final List<XboardSubscription> data}) = _$XboardSubscriptionsResponseImpl;

  factory _XboardSubscriptionsResponse.fromJson(Map<String, dynamic> json) =
      _$XboardSubscriptionsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<XboardSubscription> get data;

  /// Create a copy of XboardSubscriptionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscriptionsResponseImplCopyWith<_$XboardSubscriptionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

XboardNodesResponse _$XboardNodesResponseFromJson(Map<String, dynamic> json) {
  return _XboardNodesResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardNodesResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<XboardNode> get data => throw _privateConstructorUsedError;

  /// Serializes this XboardNodesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardNodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardNodesResponseCopyWith<XboardNodesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardNodesResponseCopyWith<$Res> {
  factory $XboardNodesResponseCopyWith(
          XboardNodesResponse value, $Res Function(XboardNodesResponse) then) =
      _$XboardNodesResponseCopyWithImpl<$Res, XboardNodesResponse>;
  @useResult
  $Res call({bool success, String message, List<XboardNode> data});
}

/// @nodoc
class _$XboardNodesResponseCopyWithImpl<$Res, $Val extends XboardNodesResponse>
    implements $XboardNodesResponseCopyWith<$Res> {
  _$XboardNodesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardNodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<XboardNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardNodesResponseImplCopyWith<$Res>
    implements $XboardNodesResponseCopyWith<$Res> {
  factory _$$XboardNodesResponseImplCopyWith(_$XboardNodesResponseImpl value,
          $Res Function(_$XboardNodesResponseImpl) then) =
      __$$XboardNodesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<XboardNode> data});
}

/// @nodoc
class __$$XboardNodesResponseImplCopyWithImpl<$Res>
    extends _$XboardNodesResponseCopyWithImpl<$Res, _$XboardNodesResponseImpl>
    implements _$$XboardNodesResponseImplCopyWith<$Res> {
  __$$XboardNodesResponseImplCopyWithImpl(_$XboardNodesResponseImpl _value,
      $Res Function(_$XboardNodesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardNodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$XboardNodesResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<XboardNode>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardNodesResponseImpl implements _XboardNodesResponse {
  const _$XboardNodesResponseImpl(
      {required this.success,
      required this.message,
      final List<XboardNode> data = const []})
      : _data = data;

  factory _$XboardNodesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardNodesResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<XboardNode> _data;
  @override
  @JsonKey()
  List<XboardNode> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'XboardNodesResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardNodesResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of XboardNodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardNodesResponseImplCopyWith<_$XboardNodesResponseImpl> get copyWith =>
      __$$XboardNodesResponseImplCopyWithImpl<_$XboardNodesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardNodesResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardNodesResponse implements XboardNodesResponse {
  const factory _XboardNodesResponse(
      {required final bool success,
      required final String message,
      final List<XboardNode> data}) = _$XboardNodesResponseImpl;

  factory _XboardNodesResponse.fromJson(Map<String, dynamic> json) =
      _$XboardNodesResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<XboardNode> get data;

  /// Create a copy of XboardNodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardNodesResponseImplCopyWith<_$XboardNodesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSubscriptionInfo _$XboardSubscriptionInfoFromJson(
    Map<String, dynamic> json) {
  return _XboardSubscriptionInfo.fromJson(json);
}

/// @nodoc
mixin _$XboardSubscriptionInfo {
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
  XboardPlan? get plan => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscribe_url')
  String get subscribeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'reset_day')
  int? get resetDay => throw _privateConstructorUsedError;

  /// Serializes this XboardSubscriptionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSubscriptionInfoCopyWith<XboardSubscriptionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSubscriptionInfoCopyWith<$Res> {
  factory $XboardSubscriptionInfoCopyWith(XboardSubscriptionInfo value,
          $Res Function(XboardSubscriptionInfo) then) =
      _$XboardSubscriptionInfoCopyWithImpl<$Res, XboardSubscriptionInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'plan_id') int planId,
      String token,
      @JsonKey(name: 'expired_at') int expiredAt,
      int u,
      int d,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String email,
      String uuid,
      XboardPlan? plan,
      @JsonKey(name: 'subscribe_url') String subscribeUrl,
      @JsonKey(name: 'reset_day') int? resetDay});

  $XboardPlanCopyWith<$Res>? get plan;
}

/// @nodoc
class _$XboardSubscriptionInfoCopyWithImpl<$Res,
        $Val extends XboardSubscriptionInfo>
    implements $XboardSubscriptionInfoCopyWith<$Res> {
  _$XboardSubscriptionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? token = null,
    Object? expiredAt = null,
    Object? u = null,
    Object? d = null,
    Object? transferEnable = null,
    Object? email = null,
    Object? uuid = null,
    Object? plan = freezed,
    Object? subscribeUrl = null,
    Object? resetDay = freezed,
  }) {
    return _then(_value.copyWith(
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
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan?,
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      resetDay: freezed == resetDay
          ? _value.resetDay
          : resetDay // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardPlanCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $XboardPlanCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardSubscriptionInfoImplCopyWith<$Res>
    implements $XboardSubscriptionInfoCopyWith<$Res> {
  factory _$$XboardSubscriptionInfoImplCopyWith(
          _$XboardSubscriptionInfoImpl value,
          $Res Function(_$XboardSubscriptionInfoImpl) then) =
      __$$XboardSubscriptionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'plan_id') int planId,
      String token,
      @JsonKey(name: 'expired_at') int expiredAt,
      int u,
      int d,
      @JsonKey(name: 'transfer_enable') int transferEnable,
      String email,
      String uuid,
      XboardPlan? plan,
      @JsonKey(name: 'subscribe_url') String subscribeUrl,
      @JsonKey(name: 'reset_day') int? resetDay});

  @override
  $XboardPlanCopyWith<$Res>? get plan;
}

/// @nodoc
class __$$XboardSubscriptionInfoImplCopyWithImpl<$Res>
    extends _$XboardSubscriptionInfoCopyWithImpl<$Res,
        _$XboardSubscriptionInfoImpl>
    implements _$$XboardSubscriptionInfoImplCopyWith<$Res> {
  __$$XboardSubscriptionInfoImplCopyWithImpl(
      _$XboardSubscriptionInfoImpl _value,
      $Res Function(_$XboardSubscriptionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? token = null,
    Object? expiredAt = null,
    Object? u = null,
    Object? d = null,
    Object? transferEnable = null,
    Object? email = null,
    Object? uuid = null,
    Object? plan = freezed,
    Object? subscribeUrl = null,
    Object? resetDay = freezed,
  }) {
    return _then(_$XboardSubscriptionInfoImpl(
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
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as XboardPlan?,
      subscribeUrl: null == subscribeUrl
          ? _value.subscribeUrl
          : subscribeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      resetDay: freezed == resetDay
          ? _value.resetDay
          : resetDay // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscriptionInfoImpl implements _XboardSubscriptionInfo {
  const _$XboardSubscriptionInfoImpl(
      {@JsonKey(name: 'plan_id') required this.planId,
      required this.token,
      @JsonKey(name: 'expired_at') required this.expiredAt,
      required this.u,
      required this.d,
      @JsonKey(name: 'transfer_enable') required this.transferEnable,
      required this.email,
      required this.uuid,
      this.plan,
      @JsonKey(name: 'subscribe_url') required this.subscribeUrl,
      @JsonKey(name: 'reset_day') this.resetDay});

  factory _$XboardSubscriptionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardSubscriptionInfoImplFromJson(json);

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
  final XboardPlan? plan;
  @override
  @JsonKey(name: 'subscribe_url')
  final String subscribeUrl;
  @override
  @JsonKey(name: 'reset_day')
  final int? resetDay;

  @override
  String toString() {
    return 'XboardSubscriptionInfo(planId: $planId, token: $token, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, email: $email, uuid: $uuid, plan: $plan, subscribeUrl: $subscribeUrl, resetDay: $resetDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscriptionInfoImpl &&
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
            (identical(other.subscribeUrl, subscribeUrl) ||
                other.subscribeUrl == subscribeUrl) &&
            (identical(other.resetDay, resetDay) ||
                other.resetDay == resetDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, planId, token, expiredAt, u, d,
      transferEnable, email, uuid, plan, subscribeUrl, resetDay);

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSubscriptionInfoImplCopyWith<_$XboardSubscriptionInfoImpl>
      get copyWith => __$$XboardSubscriptionInfoImplCopyWithImpl<
          _$XboardSubscriptionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSubscriptionInfoImplToJson(
      this,
    );
  }
}

abstract class _XboardSubscriptionInfo implements XboardSubscriptionInfo {
  const factory _XboardSubscriptionInfo(
          {@JsonKey(name: 'plan_id') required final int planId,
          required final String token,
          @JsonKey(name: 'expired_at') required final int expiredAt,
          required final int u,
          required final int d,
          @JsonKey(name: 'transfer_enable') required final int transferEnable,
          required final String email,
          required final String uuid,
          final XboardPlan? plan,
          @JsonKey(name: 'subscribe_url') required final String subscribeUrl,
          @JsonKey(name: 'reset_day') final int? resetDay}) =
      _$XboardSubscriptionInfoImpl;

  factory _XboardSubscriptionInfo.fromJson(Map<String, dynamic> json) =
      _$XboardSubscriptionInfoImpl.fromJson;

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
  XboardPlan? get plan;
  @override
  @JsonKey(name: 'subscribe_url')
  String get subscribeUrl;
  @override
  @JsonKey(name: 'reset_day')
  int? get resetDay;

  /// Create a copy of XboardSubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscriptionInfoImplCopyWith<_$XboardSubscriptionInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  XboardPlanPrices get prices => throw _privateConstructorUsedError;
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
      XboardPlanPrices prices,
      int sell,
      @JsonKey(name: 'device_limit') int deviceLimit});

  $XboardPlanPricesCopyWith<$Res> get prices;
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
              as XboardPlanPrices,
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

  /// Create a copy of XboardPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardPlanPricesCopyWith<$Res> get prices {
    return $XboardPlanPricesCopyWith<$Res>(_value.prices, (value) {
      return _then(_value.copyWith(prices: value) as $Val);
    });
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
      XboardPlanPrices prices,
      int sell,
      @JsonKey(name: 'device_limit') int deviceLimit});

  @override
  $XboardPlanPricesCopyWith<$Res> get prices;
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
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as XboardPlanPrices,
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
      this.show = true,
      this.sort,
      this.renew = true,
      this.content = "",
      @JsonKey(name: 'reset_traffic_method') this.resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') this.capacityLimit,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.prices,
      this.sell = 1,
      @JsonKey(name: 'device_limit') this.deviceLimit = 1});

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
  @JsonKey()
  final bool show;
  @override
  final int? sort;
  @override
  @JsonKey()
  final bool renew;
  @override
  @JsonKey()
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
  @override
  final XboardPlanPrices prices;
  @override
  @JsonKey()
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
            (identical(other.prices, prices) || other.prices == prices) &&
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
      prices,
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
      final bool show,
      final int? sort,
      final bool renew,
      final String content,
      @JsonKey(name: 'reset_traffic_method') final String? resetTrafficMethod,
      @JsonKey(name: 'capacity_limit') final int? capacityLimit,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'updated_at') required final int updatedAt,
      required final XboardPlanPrices prices,
      final int sell,
      @JsonKey(name: 'device_limit') final int deviceLimit}) = _$XboardPlanImpl;

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
  XboardPlanPrices get prices;
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

XboardPlanPrices _$XboardPlanPricesFromJson(Map<String, dynamic> json) {
  return _XboardPlanPrices.fromJson(json);
}

/// @nodoc
mixin _$XboardPlanPrices {
  String get monthly => throw _privateConstructorUsedError;
  String get quarterly => throw _privateConstructorUsedError;
  @JsonKey(name: 'half_yearly')
  String get halfYearly => throw _privateConstructorUsedError;
  String get yearly => throw _privateConstructorUsedError;
  @JsonKey(name: 'two_yearly')
  String get twoYearly => throw _privateConstructorUsedError;
  @JsonKey(name: 'three_yearly')
  String get threeYearly => throw _privateConstructorUsedError;
  String get onetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'reset_traffic')
  String get resetTraffic => throw _privateConstructorUsedError;

  /// Serializes this XboardPlanPrices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardPlanPrices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardPlanPricesCopyWith<XboardPlanPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardPlanPricesCopyWith<$Res> {
  factory $XboardPlanPricesCopyWith(
          XboardPlanPrices value, $Res Function(XboardPlanPrices) then) =
      _$XboardPlanPricesCopyWithImpl<$Res, XboardPlanPrices>;
  @useResult
  $Res call(
      {String monthly,
      String quarterly,
      @JsonKey(name: 'half_yearly') String halfYearly,
      String yearly,
      @JsonKey(name: 'two_yearly') String twoYearly,
      @JsonKey(name: 'three_yearly') String threeYearly,
      String onetime,
      @JsonKey(name: 'reset_traffic') String resetTraffic});
}

/// @nodoc
class _$XboardPlanPricesCopyWithImpl<$Res, $Val extends XboardPlanPrices>
    implements $XboardPlanPricesCopyWith<$Res> {
  _$XboardPlanPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardPlanPrices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthly = null,
    Object? quarterly = null,
    Object? halfYearly = null,
    Object? yearly = null,
    Object? twoYearly = null,
    Object? threeYearly = null,
    Object? onetime = null,
    Object? resetTraffic = null,
  }) {
    return _then(_value.copyWith(
      monthly: null == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as String,
      quarterly: null == quarterly
          ? _value.quarterly
          : quarterly // ignore: cast_nullable_to_non_nullable
              as String,
      halfYearly: null == halfYearly
          ? _value.halfYearly
          : halfYearly // ignore: cast_nullable_to_non_nullable
              as String,
      yearly: null == yearly
          ? _value.yearly
          : yearly // ignore: cast_nullable_to_non_nullable
              as String,
      twoYearly: null == twoYearly
          ? _value.twoYearly
          : twoYearly // ignore: cast_nullable_to_non_nullable
              as String,
      threeYearly: null == threeYearly
          ? _value.threeYearly
          : threeYearly // ignore: cast_nullable_to_non_nullable
              as String,
      onetime: null == onetime
          ? _value.onetime
          : onetime // ignore: cast_nullable_to_non_nullable
              as String,
      resetTraffic: null == resetTraffic
          ? _value.resetTraffic
          : resetTraffic // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardPlanPricesImplCopyWith<$Res>
    implements $XboardPlanPricesCopyWith<$Res> {
  factory _$$XboardPlanPricesImplCopyWith(_$XboardPlanPricesImpl value,
          $Res Function(_$XboardPlanPricesImpl) then) =
      __$$XboardPlanPricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String monthly,
      String quarterly,
      @JsonKey(name: 'half_yearly') String halfYearly,
      String yearly,
      @JsonKey(name: 'two_yearly') String twoYearly,
      @JsonKey(name: 'three_yearly') String threeYearly,
      String onetime,
      @JsonKey(name: 'reset_traffic') String resetTraffic});
}

/// @nodoc
class __$$XboardPlanPricesImplCopyWithImpl<$Res>
    extends _$XboardPlanPricesCopyWithImpl<$Res, _$XboardPlanPricesImpl>
    implements _$$XboardPlanPricesImplCopyWith<$Res> {
  __$$XboardPlanPricesImplCopyWithImpl(_$XboardPlanPricesImpl _value,
      $Res Function(_$XboardPlanPricesImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardPlanPrices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthly = null,
    Object? quarterly = null,
    Object? halfYearly = null,
    Object? yearly = null,
    Object? twoYearly = null,
    Object? threeYearly = null,
    Object? onetime = null,
    Object? resetTraffic = null,
  }) {
    return _then(_$XboardPlanPricesImpl(
      monthly: null == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as String,
      quarterly: null == quarterly
          ? _value.quarterly
          : quarterly // ignore: cast_nullable_to_non_nullable
              as String,
      halfYearly: null == halfYearly
          ? _value.halfYearly
          : halfYearly // ignore: cast_nullable_to_non_nullable
              as String,
      yearly: null == yearly
          ? _value.yearly
          : yearly // ignore: cast_nullable_to_non_nullable
              as String,
      twoYearly: null == twoYearly
          ? _value.twoYearly
          : twoYearly // ignore: cast_nullable_to_non_nullable
              as String,
      threeYearly: null == threeYearly
          ? _value.threeYearly
          : threeYearly // ignore: cast_nullable_to_non_nullable
              as String,
      onetime: null == onetime
          ? _value.onetime
          : onetime // ignore: cast_nullable_to_non_nullable
              as String,
      resetTraffic: null == resetTraffic
          ? _value.resetTraffic
          : resetTraffic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardPlanPricesImpl implements _XboardPlanPrices {
  const _$XboardPlanPricesImpl(
      {required this.monthly,
      required this.quarterly,
      @JsonKey(name: 'half_yearly') required this.halfYearly,
      required this.yearly,
      @JsonKey(name: 'two_yearly') required this.twoYearly,
      @JsonKey(name: 'three_yearly') required this.threeYearly,
      required this.onetime,
      @JsonKey(name: 'reset_traffic') required this.resetTraffic});

  factory _$XboardPlanPricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardPlanPricesImplFromJson(json);

  @override
  final String monthly;
  @override
  final String quarterly;
  @override
  @JsonKey(name: 'half_yearly')
  final String halfYearly;
  @override
  final String yearly;
  @override
  @JsonKey(name: 'two_yearly')
  final String twoYearly;
  @override
  @JsonKey(name: 'three_yearly')
  final String threeYearly;
  @override
  final String onetime;
  @override
  @JsonKey(name: 'reset_traffic')
  final String resetTraffic;

  @override
  String toString() {
    return 'XboardPlanPrices(monthly: $monthly, quarterly: $quarterly, halfYearly: $halfYearly, yearly: $yearly, twoYearly: $twoYearly, threeYearly: $threeYearly, onetime: $onetime, resetTraffic: $resetTraffic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardPlanPricesImpl &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.quarterly, quarterly) ||
                other.quarterly == quarterly) &&
            (identical(other.halfYearly, halfYearly) ||
                other.halfYearly == halfYearly) &&
            (identical(other.yearly, yearly) || other.yearly == yearly) &&
            (identical(other.twoYearly, twoYearly) ||
                other.twoYearly == twoYearly) &&
            (identical(other.threeYearly, threeYearly) ||
                other.threeYearly == threeYearly) &&
            (identical(other.onetime, onetime) || other.onetime == onetime) &&
            (identical(other.resetTraffic, resetTraffic) ||
                other.resetTraffic == resetTraffic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, monthly, quarterly, halfYearly,
      yearly, twoYearly, threeYearly, onetime, resetTraffic);

  /// Create a copy of XboardPlanPrices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardPlanPricesImplCopyWith<_$XboardPlanPricesImpl> get copyWith =>
      __$$XboardPlanPricesImplCopyWithImpl<_$XboardPlanPricesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardPlanPricesImplToJson(
      this,
    );
  }
}

abstract class _XboardPlanPrices implements XboardPlanPrices {
  const factory _XboardPlanPrices(
          {required final String monthly,
          required final String quarterly,
          @JsonKey(name: 'half_yearly') required final String halfYearly,
          required final String yearly,
          @JsonKey(name: 'two_yearly') required final String twoYearly,
          @JsonKey(name: 'three_yearly') required final String threeYearly,
          required final String onetime,
          @JsonKey(name: 'reset_traffic') required final String resetTraffic}) =
      _$XboardPlanPricesImpl;

  factory _XboardPlanPrices.fromJson(Map<String, dynamic> json) =
      _$XboardPlanPricesImpl.fromJson;

  @override
  String get monthly;
  @override
  String get quarterly;
  @override
  @JsonKey(name: 'half_yearly')
  String get halfYearly;
  @override
  String get yearly;
  @override
  @JsonKey(name: 'two_yearly')
  String get twoYearly;
  @override
  @JsonKey(name: 'three_yearly')
  String get threeYearly;
  @override
  String get onetime;
  @override
  @JsonKey(name: 'reset_traffic')
  String get resetTraffic;

  /// Create a copy of XboardPlanPrices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardPlanPricesImplCopyWith<_$XboardPlanPricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardSubscriptionUrlResponse _$XboardSubscriptionUrlResponseFromJson(
    Map<String, dynamic> json) {
  return _XboardSubscriptionUrlResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardSubscriptionUrlResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  XboardSubscriptionInfo? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this XboardSubscriptionUrlResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardSubscriptionUrlResponseCopyWith<XboardSubscriptionUrlResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardSubscriptionUrlResponseCopyWith<$Res> {
  factory $XboardSubscriptionUrlResponseCopyWith(
          XboardSubscriptionUrlResponse value,
          $Res Function(XboardSubscriptionUrlResponse) then) =
      _$XboardSubscriptionUrlResponseCopyWithImpl<$Res,
          XboardSubscriptionUrlResponse>;
  @useResult
  $Res call(
      {String status,
      String message,
      XboardSubscriptionInfo? data,
      String? error});

  $XboardSubscriptionInfoCopyWith<$Res>? get data;
}

/// @nodoc
class _$XboardSubscriptionUrlResponseCopyWithImpl<$Res,
        $Val extends XboardSubscriptionUrlResponse>
    implements $XboardSubscriptionUrlResponseCopyWith<$Res> {
  _$XboardSubscriptionUrlResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardSubscriptionInfo?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardSubscriptionInfoCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $XboardSubscriptionInfoCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardSubscriptionUrlResponseImplCopyWith<$Res>
    implements $XboardSubscriptionUrlResponseCopyWith<$Res> {
  factory _$$XboardSubscriptionUrlResponseImplCopyWith(
          _$XboardSubscriptionUrlResponseImpl value,
          $Res Function(_$XboardSubscriptionUrlResponseImpl) then) =
      __$$XboardSubscriptionUrlResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      XboardSubscriptionInfo? data,
      String? error});

  @override
  $XboardSubscriptionInfoCopyWith<$Res>? get data;
}

/// @nodoc
class __$$XboardSubscriptionUrlResponseImplCopyWithImpl<$Res>
    extends _$XboardSubscriptionUrlResponseCopyWithImpl<$Res,
        _$XboardSubscriptionUrlResponseImpl>
    implements _$$XboardSubscriptionUrlResponseImplCopyWith<$Res> {
  __$$XboardSubscriptionUrlResponseImplCopyWithImpl(
      _$XboardSubscriptionUrlResponseImpl _value,
      $Res Function(_$XboardSubscriptionUrlResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$XboardSubscriptionUrlResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardSubscriptionInfo?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardSubscriptionUrlResponseImpl
    implements _XboardSubscriptionUrlResponse {
  const _$XboardSubscriptionUrlResponseImpl(
      {required this.status, required this.message, this.data, this.error});

  factory _$XboardSubscriptionUrlResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$XboardSubscriptionUrlResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final XboardSubscriptionInfo? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'XboardSubscriptionUrlResponse(status: $status, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardSubscriptionUrlResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, error);

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardSubscriptionUrlResponseImplCopyWith<
          _$XboardSubscriptionUrlResponseImpl>
      get copyWith => __$$XboardSubscriptionUrlResponseImplCopyWithImpl<
          _$XboardSubscriptionUrlResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardSubscriptionUrlResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardSubscriptionUrlResponse
    implements XboardSubscriptionUrlResponse {
  const factory _XboardSubscriptionUrlResponse(
      {required final String status,
      required final String message,
      final XboardSubscriptionInfo? data,
      final String? error}) = _$XboardSubscriptionUrlResponseImpl;

  factory _XboardSubscriptionUrlResponse.fromJson(Map<String, dynamic> json) =
      _$XboardSubscriptionUrlResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  XboardSubscriptionInfo? get data;
  @override
  String? get error;

  /// Create a copy of XboardSubscriptionUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardSubscriptionUrlResponseImplCopyWith<
          _$XboardSubscriptionUrlResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

XboardCheckinResponse _$XboardCheckinResponseFromJson(
    Map<String, dynamic> json) {
  return _XboardCheckinResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardCheckinResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get data => throw _privateConstructorUsedError;

  /// Serializes this XboardCheckinResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardCheckinResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardCheckinResponseCopyWith<XboardCheckinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardCheckinResponseCopyWith<$Res> {
  factory $XboardCheckinResponseCopyWith(XboardCheckinResponse value,
          $Res Function(XboardCheckinResponse) then) =
      _$XboardCheckinResponseCopyWithImpl<$Res, XboardCheckinResponse>;
  @useResult
  $Res call({bool success, String message, int data});
}

/// @nodoc
class _$XboardCheckinResponseCopyWithImpl<$Res,
        $Val extends XboardCheckinResponse>
    implements $XboardCheckinResponseCopyWith<$Res> {
  _$XboardCheckinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardCheckinResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardCheckinResponseImplCopyWith<$Res>
    implements $XboardCheckinResponseCopyWith<$Res> {
  factory _$$XboardCheckinResponseImplCopyWith(
          _$XboardCheckinResponseImpl value,
          $Res Function(_$XboardCheckinResponseImpl) then) =
      __$$XboardCheckinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, int data});
}

/// @nodoc
class __$$XboardCheckinResponseImplCopyWithImpl<$Res>
    extends _$XboardCheckinResponseCopyWithImpl<$Res,
        _$XboardCheckinResponseImpl>
    implements _$$XboardCheckinResponseImplCopyWith<$Res> {
  __$$XboardCheckinResponseImplCopyWithImpl(_$XboardCheckinResponseImpl _value,
      $Res Function(_$XboardCheckinResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardCheckinResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$XboardCheckinResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardCheckinResponseImpl implements _XboardCheckinResponse {
  const _$XboardCheckinResponseImpl(
      {required this.success, required this.message, this.data = 0});

  factory _$XboardCheckinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardCheckinResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  @JsonKey()
  final int data;

  @override
  String toString() {
    return 'XboardCheckinResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardCheckinResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of XboardCheckinResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardCheckinResponseImplCopyWith<_$XboardCheckinResponseImpl>
      get copyWith => __$$XboardCheckinResponseImplCopyWithImpl<
          _$XboardCheckinResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardCheckinResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardCheckinResponse implements XboardCheckinResponse {
  const factory _XboardCheckinResponse(
      {required final bool success,
      required final String message,
      final int data}) = _$XboardCheckinResponseImpl;

  factory _XboardCheckinResponse.fromJson(Map<String, dynamic> json) =
      _$XboardCheckinResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  int get data;

  /// Create a copy of XboardCheckinResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardCheckinResponseImplCopyWith<_$XboardCheckinResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

XboardOrder _$XboardOrderFromJson(Map<String, dynamic> json) {
  return _XboardOrder.fromJson(json);
}

/// @nodoc
mixin _$XboardOrder {
  String get tradeNo => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get callbackNo => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this XboardOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardOrderCopyWith<XboardOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardOrderCopyWith<$Res> {
  factory $XboardOrderCopyWith(
          XboardOrder value, $Res Function(XboardOrder) then) =
      _$XboardOrderCopyWithImpl<$Res, XboardOrder>;
  @useResult
  $Res call(
      {String tradeNo,
      int totalAmount,
      String status,
      String callbackNo,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$XboardOrderCopyWithImpl<$Res, $Val extends XboardOrder>
    implements $XboardOrderCopyWith<$Res> {
  _$XboardOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeNo = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? callbackNo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      tradeNo: null == tradeNo
          ? _value.tradeNo
          : tradeNo // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      callbackNo: null == callbackNo
          ? _value.callbackNo
          : callbackNo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardOrderImplCopyWith<$Res>
    implements $XboardOrderCopyWith<$Res> {
  factory _$$XboardOrderImplCopyWith(
          _$XboardOrderImpl value, $Res Function(_$XboardOrderImpl) then) =
      __$$XboardOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tradeNo,
      int totalAmount,
      String status,
      String callbackNo,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$$XboardOrderImplCopyWithImpl<$Res>
    extends _$XboardOrderCopyWithImpl<$Res, _$XboardOrderImpl>
    implements _$$XboardOrderImplCopyWith<$Res> {
  __$$XboardOrderImplCopyWithImpl(
      _$XboardOrderImpl _value, $Res Function(_$XboardOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeNo = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? callbackNo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$XboardOrderImpl(
      tradeNo: null == tradeNo
          ? _value.tradeNo
          : tradeNo // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      callbackNo: null == callbackNo
          ? _value.callbackNo
          : callbackNo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardOrderImpl implements _XboardOrder {
  const _$XboardOrderImpl(
      {required this.tradeNo,
      required this.totalAmount,
      required this.status,
      this.callbackNo = "",
      this.createdAt = 0,
      this.updatedAt = 0});

  factory _$XboardOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardOrderImplFromJson(json);

  @override
  final String tradeNo;
  @override
  final int totalAmount;
  @override
  final String status;
  @override
  @JsonKey()
  final String callbackNo;
  @override
  @JsonKey()
  final int createdAt;
  @override
  @JsonKey()
  final int updatedAt;

  @override
  String toString() {
    return 'XboardOrder(tradeNo: $tradeNo, totalAmount: $totalAmount, status: $status, callbackNo: $callbackNo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardOrderImpl &&
            (identical(other.tradeNo, tradeNo) || other.tradeNo == tradeNo) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.callbackNo, callbackNo) ||
                other.callbackNo == callbackNo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tradeNo, totalAmount, status,
      callbackNo, createdAt, updatedAt);

  /// Create a copy of XboardOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardOrderImplCopyWith<_$XboardOrderImpl> get copyWith =>
      __$$XboardOrderImplCopyWithImpl<_$XboardOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardOrderImplToJson(
      this,
    );
  }
}

abstract class _XboardOrder implements XboardOrder {
  const factory _XboardOrder(
      {required final String tradeNo,
      required final int totalAmount,
      required final String status,
      final String callbackNo,
      final int createdAt,
      final int updatedAt}) = _$XboardOrderImpl;

  factory _XboardOrder.fromJson(Map<String, dynamic> json) =
      _$XboardOrderImpl.fromJson;

  @override
  String get tradeNo;
  @override
  int get totalAmount;
  @override
  String get status;
  @override
  String get callbackNo;
  @override
  int get createdAt;
  @override
  int get updatedAt;

  /// Create a copy of XboardOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardOrderImplCopyWith<_$XboardOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardOrderResponse _$XboardOrderResponseFromJson(Map<String, dynamic> json) {
  return _XboardOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$XboardOrderResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  XboardOrder? get data => throw _privateConstructorUsedError;

  /// Serializes this XboardOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardOrderResponseCopyWith<XboardOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardOrderResponseCopyWith<$Res> {
  factory $XboardOrderResponseCopyWith(
          XboardOrderResponse value, $Res Function(XboardOrderResponse) then) =
      _$XboardOrderResponseCopyWithImpl<$Res, XboardOrderResponse>;
  @useResult
  $Res call({bool success, String message, XboardOrder? data});

  $XboardOrderCopyWith<$Res>? get data;
}

/// @nodoc
class _$XboardOrderResponseCopyWithImpl<$Res, $Val extends XboardOrderResponse>
    implements $XboardOrderResponseCopyWith<$Res> {
  _$XboardOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardOrder?,
    ) as $Val);
  }

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XboardOrderCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $XboardOrderCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XboardOrderResponseImplCopyWith<$Res>
    implements $XboardOrderResponseCopyWith<$Res> {
  factory _$$XboardOrderResponseImplCopyWith(_$XboardOrderResponseImpl value,
          $Res Function(_$XboardOrderResponseImpl) then) =
      __$$XboardOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, XboardOrder? data});

  @override
  $XboardOrderCopyWith<$Res>? get data;
}

/// @nodoc
class __$$XboardOrderResponseImplCopyWithImpl<$Res>
    extends _$XboardOrderResponseCopyWithImpl<$Res, _$XboardOrderResponseImpl>
    implements _$$XboardOrderResponseImplCopyWith<$Res> {
  __$$XboardOrderResponseImplCopyWithImpl(_$XboardOrderResponseImpl _value,
      $Res Function(_$XboardOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$XboardOrderResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as XboardOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardOrderResponseImpl implements _XboardOrderResponse {
  const _$XboardOrderResponseImpl(
      {required this.success, required this.message, this.data});

  factory _$XboardOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final XboardOrder? data;

  @override
  String toString() {
    return 'XboardOrderResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardOrderResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardOrderResponseImplCopyWith<_$XboardOrderResponseImpl> get copyWith =>
      __$$XboardOrderResponseImplCopyWithImpl<_$XboardOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _XboardOrderResponse implements XboardOrderResponse {
  const factory _XboardOrderResponse(
      {required final bool success,
      required final String message,
      final XboardOrder? data}) = _$XboardOrderResponseImpl;

  factory _XboardOrderResponse.fromJson(Map<String, dynamic> json) =
      _$XboardOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  XboardOrder? get data;

  /// Create a copy of XboardOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardOrderResponseImplCopyWith<_$XboardOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XboardPurchaseRequest _$XboardPurchaseRequestFromJson(
    Map<String, dynamic> json) {
  return _XboardPurchaseRequest.fromJson(json);
}

/// @nodoc
mixin _$XboardPurchaseRequest {
  int get planId => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;

  /// Serializes this XboardPurchaseRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XboardPurchaseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XboardPurchaseRequestCopyWith<XboardPurchaseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XboardPurchaseRequestCopyWith<$Res> {
  factory $XboardPurchaseRequestCopyWith(XboardPurchaseRequest value,
          $Res Function(XboardPurchaseRequest) then) =
      _$XboardPurchaseRequestCopyWithImpl<$Res, XboardPurchaseRequest>;
  @useResult
  $Res call({int planId, String period, String couponCode});
}

/// @nodoc
class _$XboardPurchaseRequestCopyWithImpl<$Res,
        $Val extends XboardPurchaseRequest>
    implements $XboardPurchaseRequestCopyWith<$Res> {
  _$XboardPurchaseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XboardPurchaseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? period = null,
    Object? couponCode = null,
  }) {
    return _then(_value.copyWith(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XboardPurchaseRequestImplCopyWith<$Res>
    implements $XboardPurchaseRequestCopyWith<$Res> {
  factory _$$XboardPurchaseRequestImplCopyWith(
          _$XboardPurchaseRequestImpl value,
          $Res Function(_$XboardPurchaseRequestImpl) then) =
      __$$XboardPurchaseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int planId, String period, String couponCode});
}

/// @nodoc
class __$$XboardPurchaseRequestImplCopyWithImpl<$Res>
    extends _$XboardPurchaseRequestCopyWithImpl<$Res,
        _$XboardPurchaseRequestImpl>
    implements _$$XboardPurchaseRequestImplCopyWith<$Res> {
  __$$XboardPurchaseRequestImplCopyWithImpl(_$XboardPurchaseRequestImpl _value,
      $Res Function(_$XboardPurchaseRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of XboardPurchaseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? period = null,
    Object? couponCode = null,
  }) {
    return _then(_$XboardPurchaseRequestImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XboardPurchaseRequestImpl implements _XboardPurchaseRequest {
  const _$XboardPurchaseRequestImpl(
      {required this.planId, required this.period, this.couponCode = ""});

  factory _$XboardPurchaseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$XboardPurchaseRequestImplFromJson(json);

  @override
  final int planId;
  @override
  final String period;
  @override
  @JsonKey()
  final String couponCode;

  @override
  String toString() {
    return 'XboardPurchaseRequest(planId: $planId, period: $period, couponCode: $couponCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XboardPurchaseRequestImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, planId, period, couponCode);

  /// Create a copy of XboardPurchaseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XboardPurchaseRequestImplCopyWith<_$XboardPurchaseRequestImpl>
      get copyWith => __$$XboardPurchaseRequestImplCopyWithImpl<
          _$XboardPurchaseRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XboardPurchaseRequestImplToJson(
      this,
    );
  }
}

abstract class _XboardPurchaseRequest implements XboardPurchaseRequest {
  const factory _XboardPurchaseRequest(
      {required final int planId,
      required final String period,
      final String couponCode}) = _$XboardPurchaseRequestImpl;

  factory _XboardPurchaseRequest.fromJson(Map<String, dynamic> json) =
      _$XboardPurchaseRequestImpl.fromJson;

  @override
  int get planId;
  @override
  String get period;
  @override
  String get couponCode;

  /// Create a copy of XboardPurchaseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XboardPurchaseRequestImplCopyWith<_$XboardPurchaseRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
