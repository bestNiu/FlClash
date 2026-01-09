// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../xboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XboardAuth {

 String get token;@JsonKey(name: 'auth_data') String get authData;@JsonKey(name: 'is_admin') bool get isAdmin;
/// Create a copy of XboardAuth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardAuthCopyWith<XboardAuth> get copyWith => _$XboardAuthCopyWithImpl<XboardAuth>(this as XboardAuth, _$identity);

  /// Serializes this XboardAuth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardAuth&&(identical(other.token, token) || other.token == token)&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,authData,isAdmin);

@override
String toString() {
  return 'XboardAuth(token: $token, authData: $authData, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class $XboardAuthCopyWith<$Res>  {
  factory $XboardAuthCopyWith(XboardAuth value, $Res Function(XboardAuth) _then) = _$XboardAuthCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'auth_data') String authData,@JsonKey(name: 'is_admin') bool isAdmin
});




}
/// @nodoc
class _$XboardAuthCopyWithImpl<$Res>
    implements $XboardAuthCopyWith<$Res> {
  _$XboardAuthCopyWithImpl(this._self, this._then);

  final XboardAuth _self;
  final $Res Function(XboardAuth) _then;

/// Create a copy of XboardAuth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? authData = null,Object? isAdmin = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,authData: null == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardAuth].
extension XboardAuthPatterns on XboardAuth {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardAuth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardAuth() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardAuth value)  $default,){
final _that = this;
switch (_that) {
case _XboardAuth():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardAuth value)?  $default,){
final _that = this;
switch (_that) {
case _XboardAuth() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'auth_data')  String authData, @JsonKey(name: 'is_admin')  bool isAdmin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardAuth() when $default != null:
return $default(_that.token,_that.authData,_that.isAdmin);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'auth_data')  String authData, @JsonKey(name: 'is_admin')  bool isAdmin)  $default,) {final _that = this;
switch (_that) {
case _XboardAuth():
return $default(_that.token,_that.authData,_that.isAdmin);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'auth_data')  String authData, @JsonKey(name: 'is_admin')  bool isAdmin)?  $default,) {final _that = this;
switch (_that) {
case _XboardAuth() when $default != null:
return $default(_that.token,_that.authData,_that.isAdmin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardAuth implements XboardAuth {
  const _XboardAuth({required this.token, @JsonKey(name: 'auth_data') required this.authData, @JsonKey(name: 'is_admin') this.isAdmin = false});
  factory _XboardAuth.fromJson(Map<String, dynamic> json) => _$XboardAuthFromJson(json);

@override final  String token;
@override@JsonKey(name: 'auth_data') final  String authData;
@override@JsonKey(name: 'is_admin') final  bool isAdmin;

/// Create a copy of XboardAuth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardAuthCopyWith<_XboardAuth> get copyWith => __$XboardAuthCopyWithImpl<_XboardAuth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardAuthToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardAuth&&(identical(other.token, token) || other.token == token)&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,authData,isAdmin);

@override
String toString() {
  return 'XboardAuth(token: $token, authData: $authData, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class _$XboardAuthCopyWith<$Res> implements $XboardAuthCopyWith<$Res> {
  factory _$XboardAuthCopyWith(_XboardAuth value, $Res Function(_XboardAuth) _then) = __$XboardAuthCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'auth_data') String authData,@JsonKey(name: 'is_admin') bool isAdmin
});




}
/// @nodoc
class __$XboardAuthCopyWithImpl<$Res>
    implements _$XboardAuthCopyWith<$Res> {
  __$XboardAuthCopyWithImpl(this._self, this._then);

  final _XboardAuth _self;
  final $Res Function(_XboardAuth) _then;

/// Create a copy of XboardAuth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? authData = null,Object? isAdmin = null,}) {
  return _then(_XboardAuth(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,authData: null == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$XboardUser {

 String get email;@JsonKey(name: 'transfer_enable') int get transferEnable;@JsonKey(name: 'last_login_at') int? get lastLoginAt;@JsonKey(name: 'created_at') int? get createdAt; bool get banned;@JsonKey(name: 'remind_expire') bool get remindExpire;@JsonKey(name: 'remind_traffic') bool get remindTraffic;@JsonKey(name: 'expired_at') int? get expiredAt; int get balance;@JsonKey(name: 'commission_balance') int get commissionBalance;@JsonKey(name: 'plan_id') int? get planId; double? get discount;@JsonKey(name: 'commission_rate') double? get commissionRate;@JsonKey(name: 'telegram_id') int? get telegramId; String? get uuid;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of XboardUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardUserCopyWith<XboardUser> get copyWith => _$XboardUserCopyWithImpl<XboardUser>(this as XboardUser, _$identity);

  /// Serializes this XboardUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardUser&&(identical(other.email, email) || other.email == email)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.remindExpire, remindExpire) || other.remindExpire == remindExpire)&&(identical(other.remindTraffic, remindTraffic) || other.remindTraffic == remindTraffic)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,transferEnable,lastLoginAt,createdAt,banned,remindExpire,remindTraffic,expiredAt,balance,commissionBalance,planId,discount,commissionRate,telegramId,uuid,avatarUrl);

@override
String toString() {
  return 'XboardUser(email: $email, transferEnable: $transferEnable, lastLoginAt: $lastLoginAt, createdAt: $createdAt, banned: $banned, remindExpire: $remindExpire, remindTraffic: $remindTraffic, expiredAt: $expiredAt, balance: $balance, commissionBalance: $commissionBalance, planId: $planId, discount: $discount, commissionRate: $commissionRate, telegramId: $telegramId, uuid: $uuid, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $XboardUserCopyWith<$Res>  {
  factory $XboardUserCopyWith(XboardUser value, $Res Function(XboardUser) _then) = _$XboardUserCopyWithImpl;
@useResult
$Res call({
 String email,@JsonKey(name: 'transfer_enable') int transferEnable,@JsonKey(name: 'last_login_at') int? lastLoginAt,@JsonKey(name: 'created_at') int? createdAt, bool banned,@JsonKey(name: 'remind_expire') bool remindExpire,@JsonKey(name: 'remind_traffic') bool remindTraffic,@JsonKey(name: 'expired_at') int? expiredAt, int balance,@JsonKey(name: 'commission_balance') int commissionBalance,@JsonKey(name: 'plan_id') int? planId, double? discount,@JsonKey(name: 'commission_rate') double? commissionRate,@JsonKey(name: 'telegram_id') int? telegramId, String? uuid,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$XboardUserCopyWithImpl<$Res>
    implements $XboardUserCopyWith<$Res> {
  _$XboardUserCopyWithImpl(this._self, this._then);

  final XboardUser _self;
  final $Res Function(XboardUser) _then;

/// Create a copy of XboardUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? transferEnable = null,Object? lastLoginAt = freezed,Object? createdAt = freezed,Object? banned = null,Object? remindExpire = null,Object? remindTraffic = null,Object? expiredAt = freezed,Object? balance = null,Object? commissionBalance = null,Object? planId = freezed,Object? discount = freezed,Object? commissionRate = freezed,Object? telegramId = freezed,Object? uuid = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,remindExpire: null == remindExpire ? _self.remindExpire : remindExpire // ignore: cast_nullable_to_non_nullable
as bool,remindTraffic: null == remindTraffic ? _self.remindTraffic : remindTraffic // ignore: cast_nullable_to_non_nullable
as bool,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,commissionBalance: null == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as double?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardUser].
extension XboardUserPatterns on XboardUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardUser value)  $default,){
final _that = this;
switch (_that) {
case _XboardUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardUser value)?  $default,){
final _that = this;
switch (_that) {
case _XboardUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'transfer_enable')  int transferEnable, @JsonKey(name: 'last_login_at')  int? lastLoginAt, @JsonKey(name: 'created_at')  int? createdAt,  bool banned, @JsonKey(name: 'remind_expire')  bool remindExpire, @JsonKey(name: 'remind_traffic')  bool remindTraffic, @JsonKey(name: 'expired_at')  int? expiredAt,  int balance, @JsonKey(name: 'commission_balance')  int commissionBalance, @JsonKey(name: 'plan_id')  int? planId,  double? discount, @JsonKey(name: 'commission_rate')  double? commissionRate, @JsonKey(name: 'telegram_id')  int? telegramId,  String? uuid, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardUser() when $default != null:
return $default(_that.email,_that.transferEnable,_that.lastLoginAt,_that.createdAt,_that.banned,_that.remindExpire,_that.remindTraffic,_that.expiredAt,_that.balance,_that.commissionBalance,_that.planId,_that.discount,_that.commissionRate,_that.telegramId,_that.uuid,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'transfer_enable')  int transferEnable, @JsonKey(name: 'last_login_at')  int? lastLoginAt, @JsonKey(name: 'created_at')  int? createdAt,  bool banned, @JsonKey(name: 'remind_expire')  bool remindExpire, @JsonKey(name: 'remind_traffic')  bool remindTraffic, @JsonKey(name: 'expired_at')  int? expiredAt,  int balance, @JsonKey(name: 'commission_balance')  int commissionBalance, @JsonKey(name: 'plan_id')  int? planId,  double? discount, @JsonKey(name: 'commission_rate')  double? commissionRate, @JsonKey(name: 'telegram_id')  int? telegramId,  String? uuid, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _XboardUser():
return $default(_that.email,_that.transferEnable,_that.lastLoginAt,_that.createdAt,_that.banned,_that.remindExpire,_that.remindTraffic,_that.expiredAt,_that.balance,_that.commissionBalance,_that.planId,_that.discount,_that.commissionRate,_that.telegramId,_that.uuid,_that.avatarUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email, @JsonKey(name: 'transfer_enable')  int transferEnable, @JsonKey(name: 'last_login_at')  int? lastLoginAt, @JsonKey(name: 'created_at')  int? createdAt,  bool banned, @JsonKey(name: 'remind_expire')  bool remindExpire, @JsonKey(name: 'remind_traffic')  bool remindTraffic, @JsonKey(name: 'expired_at')  int? expiredAt,  int balance, @JsonKey(name: 'commission_balance')  int commissionBalance, @JsonKey(name: 'plan_id')  int? planId,  double? discount, @JsonKey(name: 'commission_rate')  double? commissionRate, @JsonKey(name: 'telegram_id')  int? telegramId,  String? uuid, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _XboardUser() when $default != null:
return $default(_that.email,_that.transferEnable,_that.lastLoginAt,_that.createdAt,_that.banned,_that.remindExpire,_that.remindTraffic,_that.expiredAt,_that.balance,_that.commissionBalance,_that.planId,_that.discount,_that.commissionRate,_that.telegramId,_that.uuid,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardUser implements XboardUser {
  const _XboardUser({required this.email, @JsonKey(name: 'transfer_enable') this.transferEnable = 0, @JsonKey(name: 'last_login_at') this.lastLoginAt, @JsonKey(name: 'created_at') this.createdAt, this.banned = false, @JsonKey(name: 'remind_expire') this.remindExpire = true, @JsonKey(name: 'remind_traffic') this.remindTraffic = true, @JsonKey(name: 'expired_at') this.expiredAt, this.balance = 0, @JsonKey(name: 'commission_balance') this.commissionBalance = 0, @JsonKey(name: 'plan_id') this.planId, this.discount, @JsonKey(name: 'commission_rate') this.commissionRate, @JsonKey(name: 'telegram_id') this.telegramId, this.uuid, @JsonKey(name: 'avatar_url') this.avatarUrl});
  factory _XboardUser.fromJson(Map<String, dynamic> json) => _$XboardUserFromJson(json);

@override final  String email;
@override@JsonKey(name: 'transfer_enable') final  int transferEnable;
@override@JsonKey(name: 'last_login_at') final  int? lastLoginAt;
@override@JsonKey(name: 'created_at') final  int? createdAt;
@override@JsonKey() final  bool banned;
@override@JsonKey(name: 'remind_expire') final  bool remindExpire;
@override@JsonKey(name: 'remind_traffic') final  bool remindTraffic;
@override@JsonKey(name: 'expired_at') final  int? expiredAt;
@override@JsonKey() final  int balance;
@override@JsonKey(name: 'commission_balance') final  int commissionBalance;
@override@JsonKey(name: 'plan_id') final  int? planId;
@override final  double? discount;
@override@JsonKey(name: 'commission_rate') final  double? commissionRate;
@override@JsonKey(name: 'telegram_id') final  int? telegramId;
@override final  String? uuid;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of XboardUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardUserCopyWith<_XboardUser> get copyWith => __$XboardUserCopyWithImpl<_XboardUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardUser&&(identical(other.email, email) || other.email == email)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.remindExpire, remindExpire) || other.remindExpire == remindExpire)&&(identical(other.remindTraffic, remindTraffic) || other.remindTraffic == remindTraffic)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,transferEnable,lastLoginAt,createdAt,banned,remindExpire,remindTraffic,expiredAt,balance,commissionBalance,planId,discount,commissionRate,telegramId,uuid,avatarUrl);

@override
String toString() {
  return 'XboardUser(email: $email, transferEnable: $transferEnable, lastLoginAt: $lastLoginAt, createdAt: $createdAt, banned: $banned, remindExpire: $remindExpire, remindTraffic: $remindTraffic, expiredAt: $expiredAt, balance: $balance, commissionBalance: $commissionBalance, planId: $planId, discount: $discount, commissionRate: $commissionRate, telegramId: $telegramId, uuid: $uuid, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$XboardUserCopyWith<$Res> implements $XboardUserCopyWith<$Res> {
  factory _$XboardUserCopyWith(_XboardUser value, $Res Function(_XboardUser) _then) = __$XboardUserCopyWithImpl;
@override @useResult
$Res call({
 String email,@JsonKey(name: 'transfer_enable') int transferEnable,@JsonKey(name: 'last_login_at') int? lastLoginAt,@JsonKey(name: 'created_at') int? createdAt, bool banned,@JsonKey(name: 'remind_expire') bool remindExpire,@JsonKey(name: 'remind_traffic') bool remindTraffic,@JsonKey(name: 'expired_at') int? expiredAt, int balance,@JsonKey(name: 'commission_balance') int commissionBalance,@JsonKey(name: 'plan_id') int? planId, double? discount,@JsonKey(name: 'commission_rate') double? commissionRate,@JsonKey(name: 'telegram_id') int? telegramId, String? uuid,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$XboardUserCopyWithImpl<$Res>
    implements _$XboardUserCopyWith<$Res> {
  __$XboardUserCopyWithImpl(this._self, this._then);

  final _XboardUser _self;
  final $Res Function(_XboardUser) _then;

/// Create a copy of XboardUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? transferEnable = null,Object? lastLoginAt = freezed,Object? createdAt = freezed,Object? banned = null,Object? remindExpire = null,Object? remindTraffic = null,Object? expiredAt = freezed,Object? balance = null,Object? commissionBalance = null,Object? planId = freezed,Object? discount = freezed,Object? commissionRate = freezed,Object? telegramId = freezed,Object? uuid = freezed,Object? avatarUrl = freezed,}) {
  return _then(_XboardUser(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,remindExpire: null == remindExpire ? _self.remindExpire : remindExpire // ignore: cast_nullable_to_non_nullable
as bool,remindTraffic: null == remindTraffic ? _self.remindTraffic : remindTraffic // ignore: cast_nullable_to_non_nullable
as bool,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,commissionBalance: null == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as double?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$XboardPlan {

 int get id;@JsonKey(name: 'group_id') int? get groupId;@JsonKey(name: 'transfer_enable') int get transferEnable; String get name; Map<String, String>? get prices; int get sell;@JsonKey(name: 'speed_limit') int? get speedLimit;@JsonKey(name: 'device_limit') int? get deviceLimit; bool get show; int? get sort; bool get renew; String? get content; List<String>? get tags;@JsonKey(name: 'reset_traffic_method') String? get resetTrafficMethod;@JsonKey(name: 'capacity_limit') int? get capacityLimit;@JsonKey(name: 'created_at') int? get createdAt;@JsonKey(name: 'updated_at') int? get updatedAt;
/// Create a copy of XboardPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardPlanCopyWith<XboardPlan> get copyWith => _$XboardPlanCopyWithImpl<XboardPlan>(this as XboardPlan, _$identity);

  /// Serializes this XboardPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.prices, prices)&&(identical(other.sell, sell) || other.sell == sell)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.show, show) || other.show == show)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.renew, renew) || other.renew == renew)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.resetTrafficMethod, resetTrafficMethod) || other.resetTrafficMethod == resetTrafficMethod)&&(identical(other.capacityLimit, capacityLimit) || other.capacityLimit == capacityLimit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,transferEnable,name,const DeepCollectionEquality().hash(prices),sell,speedLimit,deviceLimit,show,sort,renew,content,const DeepCollectionEquality().hash(tags),resetTrafficMethod,capacityLimit,createdAt,updatedAt);

@override
String toString() {
  return 'XboardPlan(id: $id, groupId: $groupId, transferEnable: $transferEnable, name: $name, prices: $prices, sell: $sell, speedLimit: $speedLimit, deviceLimit: $deviceLimit, show: $show, sort: $sort, renew: $renew, content: $content, tags: $tags, resetTrafficMethod: $resetTrafficMethod, capacityLimit: $capacityLimit, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $XboardPlanCopyWith<$Res>  {
  factory $XboardPlanCopyWith(XboardPlan value, $Res Function(XboardPlan) _then) = _$XboardPlanCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'group_id') int? groupId,@JsonKey(name: 'transfer_enable') int transferEnable, String name, Map<String, String>? prices, int sell,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'device_limit') int? deviceLimit, bool show, int? sort, bool renew, String? content, List<String>? tags,@JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,@JsonKey(name: 'capacity_limit') int? capacityLimit,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class _$XboardPlanCopyWithImpl<$Res>
    implements $XboardPlanCopyWith<$Res> {
  _$XboardPlanCopyWithImpl(this._self, this._then);

  final XboardPlan _self;
  final $Res Function(XboardPlan) _then;

/// Create a copy of XboardPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = freezed,Object? transferEnable = null,Object? name = null,Object? prices = freezed,Object? sell = null,Object? speedLimit = freezed,Object? deviceLimit = freezed,Object? show = null,Object? sort = freezed,Object? renew = null,Object? content = freezed,Object? tags = freezed,Object? resetTrafficMethod = freezed,Object? capacityLimit = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,prices: freezed == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,sell: null == sell ? _self.sell : sell // ignore: cast_nullable_to_non_nullable
as int,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int?,renew: null == renew ? _self.renew : renew // ignore: cast_nullable_to_non_nullable
as bool,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,resetTrafficMethod: freezed == resetTrafficMethod ? _self.resetTrafficMethod : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
as String?,capacityLimit: freezed == capacityLimit ? _self.capacityLimit : capacityLimit // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardPlan].
extension XboardPlanPatterns on XboardPlan {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardPlan() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardPlan value)  $default,){
final _that = this;
switch (_that) {
case _XboardPlan():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardPlan value)?  $default,){
final _that = this;
switch (_that) {
case _XboardPlan() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'group_id')  int? groupId, @JsonKey(name: 'transfer_enable')  int transferEnable,  String name,  Map<String, String>? prices,  int sell, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'device_limit')  int? deviceLimit,  bool show,  int? sort,  bool renew,  String? content,  List<String>? tags, @JsonKey(name: 'reset_traffic_method')  String? resetTrafficMethod, @JsonKey(name: 'capacity_limit')  int? capacityLimit, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardPlan() when $default != null:
return $default(_that.id,_that.groupId,_that.transferEnable,_that.name,_that.prices,_that.sell,_that.speedLimit,_that.deviceLimit,_that.show,_that.sort,_that.renew,_that.content,_that.tags,_that.resetTrafficMethod,_that.capacityLimit,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'group_id')  int? groupId, @JsonKey(name: 'transfer_enable')  int transferEnable,  String name,  Map<String, String>? prices,  int sell, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'device_limit')  int? deviceLimit,  bool show,  int? sort,  bool renew,  String? content,  List<String>? tags, @JsonKey(name: 'reset_traffic_method')  String? resetTrafficMethod, @JsonKey(name: 'capacity_limit')  int? capacityLimit, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _XboardPlan():
return $default(_that.id,_that.groupId,_that.transferEnable,_that.name,_that.prices,_that.sell,_that.speedLimit,_that.deviceLimit,_that.show,_that.sort,_that.renew,_that.content,_that.tags,_that.resetTrafficMethod,_that.capacityLimit,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'group_id')  int? groupId, @JsonKey(name: 'transfer_enable')  int transferEnable,  String name,  Map<String, String>? prices,  int sell, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'device_limit')  int? deviceLimit,  bool show,  int? sort,  bool renew,  String? content,  List<String>? tags, @JsonKey(name: 'reset_traffic_method')  String? resetTrafficMethod, @JsonKey(name: 'capacity_limit')  int? capacityLimit, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _XboardPlan() when $default != null:
return $default(_that.id,_that.groupId,_that.transferEnable,_that.name,_that.prices,_that.sell,_that.speedLimit,_that.deviceLimit,_that.show,_that.sort,_that.renew,_that.content,_that.tags,_that.resetTrafficMethod,_that.capacityLimit,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardPlan implements XboardPlan {
  const _XboardPlan({required this.id, @JsonKey(name: 'group_id') this.groupId, @JsonKey(name: 'transfer_enable') this.transferEnable = 0, required this.name, final  Map<String, String>? prices, this.sell = 1, @JsonKey(name: 'speed_limit') this.speedLimit, @JsonKey(name: 'device_limit') this.deviceLimit, this.show = true, this.sort, this.renew = true, this.content, final  List<String>? tags, @JsonKey(name: 'reset_traffic_method') this.resetTrafficMethod, @JsonKey(name: 'capacity_limit') this.capacityLimit, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _prices = prices,_tags = tags;
  factory _XboardPlan.fromJson(Map<String, dynamic> json) => _$XboardPlanFromJson(json);

@override final  int id;
@override@JsonKey(name: 'group_id') final  int? groupId;
@override@JsonKey(name: 'transfer_enable') final  int transferEnable;
@override final  String name;
 final  Map<String, String>? _prices;
@override Map<String, String>? get prices {
  final value = _prices;
  if (value == null) return null;
  if (_prices is EqualUnmodifiableMapView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  int sell;
@override@JsonKey(name: 'speed_limit') final  int? speedLimit;
@override@JsonKey(name: 'device_limit') final  int? deviceLimit;
@override@JsonKey() final  bool show;
@override final  int? sort;
@override@JsonKey() final  bool renew;
@override final  String? content;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'reset_traffic_method') final  String? resetTrafficMethod;
@override@JsonKey(name: 'capacity_limit') final  int? capacityLimit;
@override@JsonKey(name: 'created_at') final  int? createdAt;
@override@JsonKey(name: 'updated_at') final  int? updatedAt;

/// Create a copy of XboardPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardPlanCopyWith<_XboardPlan> get copyWith => __$XboardPlanCopyWithImpl<_XboardPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._prices, _prices)&&(identical(other.sell, sell) || other.sell == sell)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.show, show) || other.show == show)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.renew, renew) || other.renew == renew)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.resetTrafficMethod, resetTrafficMethod) || other.resetTrafficMethod == resetTrafficMethod)&&(identical(other.capacityLimit, capacityLimit) || other.capacityLimit == capacityLimit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,transferEnable,name,const DeepCollectionEquality().hash(_prices),sell,speedLimit,deviceLimit,show,sort,renew,content,const DeepCollectionEquality().hash(_tags),resetTrafficMethod,capacityLimit,createdAt,updatedAt);

@override
String toString() {
  return 'XboardPlan(id: $id, groupId: $groupId, transferEnable: $transferEnable, name: $name, prices: $prices, sell: $sell, speedLimit: $speedLimit, deviceLimit: $deviceLimit, show: $show, sort: $sort, renew: $renew, content: $content, tags: $tags, resetTrafficMethod: $resetTrafficMethod, capacityLimit: $capacityLimit, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$XboardPlanCopyWith<$Res> implements $XboardPlanCopyWith<$Res> {
  factory _$XboardPlanCopyWith(_XboardPlan value, $Res Function(_XboardPlan) _then) = __$XboardPlanCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'group_id') int? groupId,@JsonKey(name: 'transfer_enable') int transferEnable, String name, Map<String, String>? prices, int sell,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'device_limit') int? deviceLimit, bool show, int? sort, bool renew, String? content, List<String>? tags,@JsonKey(name: 'reset_traffic_method') String? resetTrafficMethod,@JsonKey(name: 'capacity_limit') int? capacityLimit,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class __$XboardPlanCopyWithImpl<$Res>
    implements _$XboardPlanCopyWith<$Res> {
  __$XboardPlanCopyWithImpl(this._self, this._then);

  final _XboardPlan _self;
  final $Res Function(_XboardPlan) _then;

/// Create a copy of XboardPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = freezed,Object? transferEnable = null,Object? name = null,Object? prices = freezed,Object? sell = null,Object? speedLimit = freezed,Object? deviceLimit = freezed,Object? show = null,Object? sort = freezed,Object? renew = null,Object? content = freezed,Object? tags = freezed,Object? resetTrafficMethod = freezed,Object? capacityLimit = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_XboardPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,prices: freezed == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,sell: null == sell ? _self.sell : sell // ignore: cast_nullable_to_non_nullable
as int,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int?,renew: null == renew ? _self.renew : renew // ignore: cast_nullable_to_non_nullable
as bool,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,resetTrafficMethod: freezed == resetTrafficMethod ? _self.resetTrafficMethod : resetTrafficMethod // ignore: cast_nullable_to_non_nullable
as String?,capacityLimit: freezed == capacityLimit ? _self.capacityLimit : capacityLimit // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$XboardSubscribe {

@JsonKey(name: 'plan_id') int? get planId; String get token;@JsonKey(name: 'expired_at') int? get expiredAt; int get u; int get d;@JsonKey(name: 'transfer_enable') int get transferEnable; String? get email; String? get uuid;@JsonKey(name: 'device_limit') int? get deviceLimit;@JsonKey(name: 'speed_limit') int? get speedLimit;@JsonKey(name: 'next_reset_at') int? get nextResetAt; XboardPlan? get plan;@JsonKey(name: 'subscribe_url') String? get subscribeUrl;@JsonKey(name: 'reset_day') int? get resetDay;
/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardSubscribeCopyWith<XboardSubscribe> get copyWith => _$XboardSubscribeCopyWithImpl<XboardSubscribe>(this as XboardSubscribe, _$identity);

  /// Serializes this XboardSubscribe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardSubscribe&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.email, email) || other.email == email)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.nextResetAt, nextResetAt) || other.nextResetAt == nextResetAt)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.subscribeUrl, subscribeUrl) || other.subscribeUrl == subscribeUrl)&&(identical(other.resetDay, resetDay) || other.resetDay == resetDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,token,expiredAt,u,d,transferEnable,email,uuid,deviceLimit,speedLimit,nextResetAt,plan,subscribeUrl,resetDay);

@override
String toString() {
  return 'XboardSubscribe(planId: $planId, token: $token, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, email: $email, uuid: $uuid, deviceLimit: $deviceLimit, speedLimit: $speedLimit, nextResetAt: $nextResetAt, plan: $plan, subscribeUrl: $subscribeUrl, resetDay: $resetDay)';
}


}

/// @nodoc
abstract mixin class $XboardSubscribeCopyWith<$Res>  {
  factory $XboardSubscribeCopyWith(XboardSubscribe value, $Res Function(XboardSubscribe) _then) = _$XboardSubscribeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'plan_id') int? planId, String token,@JsonKey(name: 'expired_at') int? expiredAt, int u, int d,@JsonKey(name: 'transfer_enable') int transferEnable, String? email, String? uuid,@JsonKey(name: 'device_limit') int? deviceLimit,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'next_reset_at') int? nextResetAt, XboardPlan? plan,@JsonKey(name: 'subscribe_url') String? subscribeUrl,@JsonKey(name: 'reset_day') int? resetDay
});


$XboardPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class _$XboardSubscribeCopyWithImpl<$Res>
    implements $XboardSubscribeCopyWith<$Res> {
  _$XboardSubscribeCopyWithImpl(this._self, this._then);

  final XboardSubscribe _self;
  final $Res Function(XboardSubscribe) _then;

/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = freezed,Object? token = null,Object? expiredAt = freezed,Object? u = null,Object? d = null,Object? transferEnable = null,Object? email = freezed,Object? uuid = freezed,Object? deviceLimit = freezed,Object? speedLimit = freezed,Object? nextResetAt = freezed,Object? plan = freezed,Object? subscribeUrl = freezed,Object? resetDay = freezed,}) {
  return _then(_self.copyWith(
planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,u: null == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,nextResetAt: freezed == nextResetAt ? _self.nextResetAt : nextResetAt // ignore: cast_nullable_to_non_nullable
as int?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as XboardPlan?,subscribeUrl: freezed == subscribeUrl ? _self.subscribeUrl : subscribeUrl // ignore: cast_nullable_to_non_nullable
as String?,resetDay: freezed == resetDay ? _self.resetDay : resetDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $XboardPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [XboardSubscribe].
extension XboardSubscribePatterns on XboardSubscribe {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardSubscribe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardSubscribe() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardSubscribe value)  $default,){
final _that = this;
switch (_that) {
case _XboardSubscribe():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardSubscribe value)?  $default,){
final _that = this;
switch (_that) {
case _XboardSubscribe() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'plan_id')  int? planId,  String token, @JsonKey(name: 'expired_at')  int? expiredAt,  int u,  int d, @JsonKey(name: 'transfer_enable')  int transferEnable,  String? email,  String? uuid, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'next_reset_at')  int? nextResetAt,  XboardPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'reset_day')  int? resetDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardSubscribe() when $default != null:
return $default(_that.planId,_that.token,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.email,_that.uuid,_that.deviceLimit,_that.speedLimit,_that.nextResetAt,_that.plan,_that.subscribeUrl,_that.resetDay);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'plan_id')  int? planId,  String token, @JsonKey(name: 'expired_at')  int? expiredAt,  int u,  int d, @JsonKey(name: 'transfer_enable')  int transferEnable,  String? email,  String? uuid, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'next_reset_at')  int? nextResetAt,  XboardPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'reset_day')  int? resetDay)  $default,) {final _that = this;
switch (_that) {
case _XboardSubscribe():
return $default(_that.planId,_that.token,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.email,_that.uuid,_that.deviceLimit,_that.speedLimit,_that.nextResetAt,_that.plan,_that.subscribeUrl,_that.resetDay);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'plan_id')  int? planId,  String token, @JsonKey(name: 'expired_at')  int? expiredAt,  int u,  int d, @JsonKey(name: 'transfer_enable')  int transferEnable,  String? email,  String? uuid, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'next_reset_at')  int? nextResetAt,  XboardPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'reset_day')  int? resetDay)?  $default,) {final _that = this;
switch (_that) {
case _XboardSubscribe() when $default != null:
return $default(_that.planId,_that.token,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.email,_that.uuid,_that.deviceLimit,_that.speedLimit,_that.nextResetAt,_that.plan,_that.subscribeUrl,_that.resetDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardSubscribe implements XboardSubscribe {
  const _XboardSubscribe({@JsonKey(name: 'plan_id') this.planId, required this.token, @JsonKey(name: 'expired_at') this.expiredAt, this.u = 0, this.d = 0, @JsonKey(name: 'transfer_enable') this.transferEnable = 0, this.email, this.uuid, @JsonKey(name: 'device_limit') this.deviceLimit, @JsonKey(name: 'speed_limit') this.speedLimit, @JsonKey(name: 'next_reset_at') this.nextResetAt, this.plan, @JsonKey(name: 'subscribe_url') this.subscribeUrl, @JsonKey(name: 'reset_day') this.resetDay});
  factory _XboardSubscribe.fromJson(Map<String, dynamic> json) => _$XboardSubscribeFromJson(json);

@override@JsonKey(name: 'plan_id') final  int? planId;
@override final  String token;
@override@JsonKey(name: 'expired_at') final  int? expiredAt;
@override@JsonKey() final  int u;
@override@JsonKey() final  int d;
@override@JsonKey(name: 'transfer_enable') final  int transferEnable;
@override final  String? email;
@override final  String? uuid;
@override@JsonKey(name: 'device_limit') final  int? deviceLimit;
@override@JsonKey(name: 'speed_limit') final  int? speedLimit;
@override@JsonKey(name: 'next_reset_at') final  int? nextResetAt;
@override final  XboardPlan? plan;
@override@JsonKey(name: 'subscribe_url') final  String? subscribeUrl;
@override@JsonKey(name: 'reset_day') final  int? resetDay;

/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardSubscribeCopyWith<_XboardSubscribe> get copyWith => __$XboardSubscribeCopyWithImpl<_XboardSubscribe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardSubscribeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardSubscribe&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.email, email) || other.email == email)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.nextResetAt, nextResetAt) || other.nextResetAt == nextResetAt)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.subscribeUrl, subscribeUrl) || other.subscribeUrl == subscribeUrl)&&(identical(other.resetDay, resetDay) || other.resetDay == resetDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,token,expiredAt,u,d,transferEnable,email,uuid,deviceLimit,speedLimit,nextResetAt,plan,subscribeUrl,resetDay);

@override
String toString() {
  return 'XboardSubscribe(planId: $planId, token: $token, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, email: $email, uuid: $uuid, deviceLimit: $deviceLimit, speedLimit: $speedLimit, nextResetAt: $nextResetAt, plan: $plan, subscribeUrl: $subscribeUrl, resetDay: $resetDay)';
}


}

/// @nodoc
abstract mixin class _$XboardSubscribeCopyWith<$Res> implements $XboardSubscribeCopyWith<$Res> {
  factory _$XboardSubscribeCopyWith(_XboardSubscribe value, $Res Function(_XboardSubscribe) _then) = __$XboardSubscribeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'plan_id') int? planId, String token,@JsonKey(name: 'expired_at') int? expiredAt, int u, int d,@JsonKey(name: 'transfer_enable') int transferEnable, String? email, String? uuid,@JsonKey(name: 'device_limit') int? deviceLimit,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'next_reset_at') int? nextResetAt, XboardPlan? plan,@JsonKey(name: 'subscribe_url') String? subscribeUrl,@JsonKey(name: 'reset_day') int? resetDay
});


@override $XboardPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class __$XboardSubscribeCopyWithImpl<$Res>
    implements _$XboardSubscribeCopyWith<$Res> {
  __$XboardSubscribeCopyWithImpl(this._self, this._then);

  final _XboardSubscribe _self;
  final $Res Function(_XboardSubscribe) _then;

/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = freezed,Object? token = null,Object? expiredAt = freezed,Object? u = null,Object? d = null,Object? transferEnable = null,Object? email = freezed,Object? uuid = freezed,Object? deviceLimit = freezed,Object? speedLimit = freezed,Object? nextResetAt = freezed,Object? plan = freezed,Object? subscribeUrl = freezed,Object? resetDay = freezed,}) {
  return _then(_XboardSubscribe(
planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,u: null == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int,transferEnable: null == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,nextResetAt: freezed == nextResetAt ? _self.nextResetAt : nextResetAt // ignore: cast_nullable_to_non_nullable
as int?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as XboardPlan?,subscribeUrl: freezed == subscribeUrl ? _self.subscribeUrl : subscribeUrl // ignore: cast_nullable_to_non_nullable
as String?,resetDay: freezed == resetDay ? _self.resetDay : resetDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of XboardSubscribe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $XboardPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// @nodoc
mixin _$XboardNotice {

 int get id; int? get sort; String get title; String get content; bool get show;@JsonKey(name: 'img_url') String? get imgUrl; List<String> get tags;@JsonKey(name: 'created_at') int? get createdAt;@JsonKey(name: 'updated_at') int? get updatedAt;
/// Create a copy of XboardNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardNoticeCopyWith<XboardNotice> get copyWith => _$XboardNoticeCopyWithImpl<XboardNotice>(this as XboardNotice, _$identity);

  /// Serializes this XboardNotice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardNotice&&(identical(other.id, id) || other.id == id)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.show, show) || other.show == show)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sort,title,content,show,imgUrl,const DeepCollectionEquality().hash(tags),createdAt,updatedAt);

@override
String toString() {
  return 'XboardNotice(id: $id, sort: $sort, title: $title, content: $content, show: $show, imgUrl: $imgUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $XboardNoticeCopyWith<$Res>  {
  factory $XboardNoticeCopyWith(XboardNotice value, $Res Function(XboardNotice) _then) = _$XboardNoticeCopyWithImpl;
@useResult
$Res call({
 int id, int? sort, String title, String content, bool show,@JsonKey(name: 'img_url') String? imgUrl, List<String> tags,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class _$XboardNoticeCopyWithImpl<$Res>
    implements $XboardNoticeCopyWith<$Res> {
  _$XboardNoticeCopyWithImpl(this._self, this._then);

  final XboardNotice _self;
  final $Res Function(XboardNotice) _then;

/// Create a copy of XboardNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sort = freezed,Object? title = null,Object? content = null,Object? show = null,Object? imgUrl = freezed,Object? tags = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardNotice].
extension XboardNoticePatterns on XboardNotice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardNotice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardNotice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardNotice value)  $default,){
final _that = this;
switch (_that) {
case _XboardNotice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardNotice value)?  $default,){
final _that = this;
switch (_that) {
case _XboardNotice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? sort,  String title,  String content,  bool show, @JsonKey(name: 'img_url')  String? imgUrl,  List<String> tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardNotice() when $default != null:
return $default(_that.id,_that.sort,_that.title,_that.content,_that.show,_that.imgUrl,_that.tags,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? sort,  String title,  String content,  bool show, @JsonKey(name: 'img_url')  String? imgUrl,  List<String> tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _XboardNotice():
return $default(_that.id,_that.sort,_that.title,_that.content,_that.show,_that.imgUrl,_that.tags,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? sort,  String title,  String content,  bool show, @JsonKey(name: 'img_url')  String? imgUrl,  List<String> tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _XboardNotice() when $default != null:
return $default(_that.id,_that.sort,_that.title,_that.content,_that.show,_that.imgUrl,_that.tags,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardNotice implements XboardNotice {
  const _XboardNotice({required this.id, this.sort, required this.title, required this.content, this.show = true, @JsonKey(name: 'img_url') this.imgUrl, final  List<String> tags = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _tags = tags;
  factory _XboardNotice.fromJson(Map<String, dynamic> json) => _$XboardNoticeFromJson(json);

@override final  int id;
@override final  int? sort;
@override final  String title;
@override final  String content;
@override@JsonKey() final  bool show;
@override@JsonKey(name: 'img_url') final  String? imgUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'created_at') final  int? createdAt;
@override@JsonKey(name: 'updated_at') final  int? updatedAt;

/// Create a copy of XboardNotice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardNoticeCopyWith<_XboardNotice> get copyWith => __$XboardNoticeCopyWithImpl<_XboardNotice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardNoticeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardNotice&&(identical(other.id, id) || other.id == id)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.show, show) || other.show == show)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sort,title,content,show,imgUrl,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt);

@override
String toString() {
  return 'XboardNotice(id: $id, sort: $sort, title: $title, content: $content, show: $show, imgUrl: $imgUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$XboardNoticeCopyWith<$Res> implements $XboardNoticeCopyWith<$Res> {
  factory _$XboardNoticeCopyWith(_XboardNotice value, $Res Function(_XboardNotice) _then) = __$XboardNoticeCopyWithImpl;
@override @useResult
$Res call({
 int id, int? sort, String title, String content, bool show,@JsonKey(name: 'img_url') String? imgUrl, List<String> tags,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class __$XboardNoticeCopyWithImpl<$Res>
    implements _$XboardNoticeCopyWith<$Res> {
  __$XboardNoticeCopyWithImpl(this._self, this._then);

  final _XboardNotice _self;
  final $Res Function(_XboardNotice) _then;

/// Create a copy of XboardNotice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sort = freezed,Object? title = null,Object? content = null,Object? show = null,Object? imgUrl = freezed,Object? tags = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_XboardNotice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$XboardConfig {

/// 面板地址（实际使用的地址）
 String? get baseUrl;/// 认证 Token
 String? get authToken;/// 认证数据
 String? get authData;/// 登录时间戳
 int? get loginTime;/// 是否自动同步订阅
 bool get autoSyncSubscribe;/// 是否启用高可用模式
 bool get enableHA;/// 高可用解析到的真实地址（缓存）
 String? get haResolvedUrl;/// 高可用解析时间戳
 int? get haResolvedTime;/// 高可用配置版本号（用于检测更新）
 int? get haConfigVersion;/// 缓存的 UI 配置（JSON 格式）
 String? get cachedUiConfig;/// 上次显示公告的配置版本号（用于避免重复弹窗）
 int? get lastShownAnnouncementVersion;
/// Create a copy of XboardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardConfigCopyWith<XboardConfig> get copyWith => _$XboardConfigCopyWithImpl<XboardConfig>(this as XboardConfig, _$identity);

  /// Serializes this XboardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.loginTime, loginTime) || other.loginTime == loginTime)&&(identical(other.autoSyncSubscribe, autoSyncSubscribe) || other.autoSyncSubscribe == autoSyncSubscribe)&&(identical(other.enableHA, enableHA) || other.enableHA == enableHA)&&(identical(other.haResolvedUrl, haResolvedUrl) || other.haResolvedUrl == haResolvedUrl)&&(identical(other.haResolvedTime, haResolvedTime) || other.haResolvedTime == haResolvedTime)&&(identical(other.haConfigVersion, haConfigVersion) || other.haConfigVersion == haConfigVersion)&&(identical(other.cachedUiConfig, cachedUiConfig) || other.cachedUiConfig == cachedUiConfig)&&(identical(other.lastShownAnnouncementVersion, lastShownAnnouncementVersion) || other.lastShownAnnouncementVersion == lastShownAnnouncementVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,authToken,authData,loginTime,autoSyncSubscribe,enableHA,haResolvedUrl,haResolvedTime,haConfigVersion,cachedUiConfig,lastShownAnnouncementVersion);

@override
String toString() {
  return 'XboardConfig(baseUrl: $baseUrl, authToken: $authToken, authData: $authData, loginTime: $loginTime, autoSyncSubscribe: $autoSyncSubscribe, enableHA: $enableHA, haResolvedUrl: $haResolvedUrl, haResolvedTime: $haResolvedTime, haConfigVersion: $haConfigVersion, cachedUiConfig: $cachedUiConfig, lastShownAnnouncementVersion: $lastShownAnnouncementVersion)';
}


}

/// @nodoc
abstract mixin class $XboardConfigCopyWith<$Res>  {
  factory $XboardConfigCopyWith(XboardConfig value, $Res Function(XboardConfig) _then) = _$XboardConfigCopyWithImpl;
@useResult
$Res call({
 String? baseUrl, String? authToken, String? authData, int? loginTime, bool autoSyncSubscribe, bool enableHA, String? haResolvedUrl, int? haResolvedTime, int? haConfigVersion, String? cachedUiConfig, int? lastShownAnnouncementVersion
});




}
/// @nodoc
class _$XboardConfigCopyWithImpl<$Res>
    implements $XboardConfigCopyWith<$Res> {
  _$XboardConfigCopyWithImpl(this._self, this._then);

  final XboardConfig _self;
  final $Res Function(XboardConfig) _then;

/// Create a copy of XboardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = freezed,Object? authToken = freezed,Object? authData = freezed,Object? loginTime = freezed,Object? autoSyncSubscribe = null,Object? enableHA = null,Object? haResolvedUrl = freezed,Object? haResolvedTime = freezed,Object? haConfigVersion = freezed,Object? cachedUiConfig = freezed,Object? lastShownAnnouncementVersion = freezed,}) {
  return _then(_self.copyWith(
baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,authData: freezed == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as String?,loginTime: freezed == loginTime ? _self.loginTime : loginTime // ignore: cast_nullable_to_non_nullable
as int?,autoSyncSubscribe: null == autoSyncSubscribe ? _self.autoSyncSubscribe : autoSyncSubscribe // ignore: cast_nullable_to_non_nullable
as bool,enableHA: null == enableHA ? _self.enableHA : enableHA // ignore: cast_nullable_to_non_nullable
as bool,haResolvedUrl: freezed == haResolvedUrl ? _self.haResolvedUrl : haResolvedUrl // ignore: cast_nullable_to_non_nullable
as String?,haResolvedTime: freezed == haResolvedTime ? _self.haResolvedTime : haResolvedTime // ignore: cast_nullable_to_non_nullable
as int?,haConfigVersion: freezed == haConfigVersion ? _self.haConfigVersion : haConfigVersion // ignore: cast_nullable_to_non_nullable
as int?,cachedUiConfig: freezed == cachedUiConfig ? _self.cachedUiConfig : cachedUiConfig // ignore: cast_nullable_to_non_nullable
as String?,lastShownAnnouncementVersion: freezed == lastShownAnnouncementVersion ? _self.lastShownAnnouncementVersion : lastShownAnnouncementVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardConfig].
extension XboardConfigPatterns on XboardConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardConfig value)  $default,){
final _that = this;
switch (_that) {
case _XboardConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _XboardConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? baseUrl,  String? authToken,  String? authData,  int? loginTime,  bool autoSyncSubscribe,  bool enableHA,  String? haResolvedUrl,  int? haResolvedTime,  int? haConfigVersion,  String? cachedUiConfig,  int? lastShownAnnouncementVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardConfig() when $default != null:
return $default(_that.baseUrl,_that.authToken,_that.authData,_that.loginTime,_that.autoSyncSubscribe,_that.enableHA,_that.haResolvedUrl,_that.haResolvedTime,_that.haConfigVersion,_that.cachedUiConfig,_that.lastShownAnnouncementVersion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? baseUrl,  String? authToken,  String? authData,  int? loginTime,  bool autoSyncSubscribe,  bool enableHA,  String? haResolvedUrl,  int? haResolvedTime,  int? haConfigVersion,  String? cachedUiConfig,  int? lastShownAnnouncementVersion)  $default,) {final _that = this;
switch (_that) {
case _XboardConfig():
return $default(_that.baseUrl,_that.authToken,_that.authData,_that.loginTime,_that.autoSyncSubscribe,_that.enableHA,_that.haResolvedUrl,_that.haResolvedTime,_that.haConfigVersion,_that.cachedUiConfig,_that.lastShownAnnouncementVersion);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? baseUrl,  String? authToken,  String? authData,  int? loginTime,  bool autoSyncSubscribe,  bool enableHA,  String? haResolvedUrl,  int? haResolvedTime,  int? haConfigVersion,  String? cachedUiConfig,  int? lastShownAnnouncementVersion)?  $default,) {final _that = this;
switch (_that) {
case _XboardConfig() when $default != null:
return $default(_that.baseUrl,_that.authToken,_that.authData,_that.loginTime,_that.autoSyncSubscribe,_that.enableHA,_that.haResolvedUrl,_that.haResolvedTime,_that.haConfigVersion,_that.cachedUiConfig,_that.lastShownAnnouncementVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardConfig implements XboardConfig {
  const _XboardConfig({this.baseUrl, this.authToken, this.authData, this.loginTime, this.autoSyncSubscribe = true, this.enableHA = true, this.haResolvedUrl, this.haResolvedTime, this.haConfigVersion, this.cachedUiConfig, this.lastShownAnnouncementVersion});
  factory _XboardConfig.fromJson(Map<String, dynamic> json) => _$XboardConfigFromJson(json);

/// 面板地址（实际使用的地址）
@override final  String? baseUrl;
/// 认证 Token
@override final  String? authToken;
/// 认证数据
@override final  String? authData;
/// 登录时间戳
@override final  int? loginTime;
/// 是否自动同步订阅
@override@JsonKey() final  bool autoSyncSubscribe;
/// 是否启用高可用模式
@override@JsonKey() final  bool enableHA;
/// 高可用解析到的真实地址（缓存）
@override final  String? haResolvedUrl;
/// 高可用解析时间戳
@override final  int? haResolvedTime;
/// 高可用配置版本号（用于检测更新）
@override final  int? haConfigVersion;
/// 缓存的 UI 配置（JSON 格式）
@override final  String? cachedUiConfig;
/// 上次显示公告的配置版本号（用于避免重复弹窗）
@override final  int? lastShownAnnouncementVersion;

/// Create a copy of XboardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardConfigCopyWith<_XboardConfig> get copyWith => __$XboardConfigCopyWithImpl<_XboardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.loginTime, loginTime) || other.loginTime == loginTime)&&(identical(other.autoSyncSubscribe, autoSyncSubscribe) || other.autoSyncSubscribe == autoSyncSubscribe)&&(identical(other.enableHA, enableHA) || other.enableHA == enableHA)&&(identical(other.haResolvedUrl, haResolvedUrl) || other.haResolvedUrl == haResolvedUrl)&&(identical(other.haResolvedTime, haResolvedTime) || other.haResolvedTime == haResolvedTime)&&(identical(other.haConfigVersion, haConfigVersion) || other.haConfigVersion == haConfigVersion)&&(identical(other.cachedUiConfig, cachedUiConfig) || other.cachedUiConfig == cachedUiConfig)&&(identical(other.lastShownAnnouncementVersion, lastShownAnnouncementVersion) || other.lastShownAnnouncementVersion == lastShownAnnouncementVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,authToken,authData,loginTime,autoSyncSubscribe,enableHA,haResolvedUrl,haResolvedTime,haConfigVersion,cachedUiConfig,lastShownAnnouncementVersion);

@override
String toString() {
  return 'XboardConfig(baseUrl: $baseUrl, authToken: $authToken, authData: $authData, loginTime: $loginTime, autoSyncSubscribe: $autoSyncSubscribe, enableHA: $enableHA, haResolvedUrl: $haResolvedUrl, haResolvedTime: $haResolvedTime, haConfigVersion: $haConfigVersion, cachedUiConfig: $cachedUiConfig, lastShownAnnouncementVersion: $lastShownAnnouncementVersion)';
}


}

/// @nodoc
abstract mixin class _$XboardConfigCopyWith<$Res> implements $XboardConfigCopyWith<$Res> {
  factory _$XboardConfigCopyWith(_XboardConfig value, $Res Function(_XboardConfig) _then) = __$XboardConfigCopyWithImpl;
@override @useResult
$Res call({
 String? baseUrl, String? authToken, String? authData, int? loginTime, bool autoSyncSubscribe, bool enableHA, String? haResolvedUrl, int? haResolvedTime, int? haConfigVersion, String? cachedUiConfig, int? lastShownAnnouncementVersion
});




}
/// @nodoc
class __$XboardConfigCopyWithImpl<$Res>
    implements _$XboardConfigCopyWith<$Res> {
  __$XboardConfigCopyWithImpl(this._self, this._then);

  final _XboardConfig _self;
  final $Res Function(_XboardConfig) _then;

/// Create a copy of XboardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = freezed,Object? authToken = freezed,Object? authData = freezed,Object? loginTime = freezed,Object? autoSyncSubscribe = null,Object? enableHA = null,Object? haResolvedUrl = freezed,Object? haResolvedTime = freezed,Object? haConfigVersion = freezed,Object? cachedUiConfig = freezed,Object? lastShownAnnouncementVersion = freezed,}) {
  return _then(_XboardConfig(
baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,authData: freezed == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as String?,loginTime: freezed == loginTime ? _self.loginTime : loginTime // ignore: cast_nullable_to_non_nullable
as int?,autoSyncSubscribe: null == autoSyncSubscribe ? _self.autoSyncSubscribe : autoSyncSubscribe // ignore: cast_nullable_to_non_nullable
as bool,enableHA: null == enableHA ? _self.enableHA : enableHA // ignore: cast_nullable_to_non_nullable
as bool,haResolvedUrl: freezed == haResolvedUrl ? _self.haResolvedUrl : haResolvedUrl // ignore: cast_nullable_to_non_nullable
as String?,haResolvedTime: freezed == haResolvedTime ? _self.haResolvedTime : haResolvedTime // ignore: cast_nullable_to_non_nullable
as int?,haConfigVersion: freezed == haConfigVersion ? _self.haConfigVersion : haConfigVersion // ignore: cast_nullable_to_non_nullable
as int?,cachedUiConfig: freezed == cachedUiConfig ? _self.cachedUiConfig : cachedUiConfig // ignore: cast_nullable_to_non_nullable
as String?,lastShownAnnouncementVersion: freezed == lastShownAnnouncementVersion ? _self.lastShownAnnouncementVersion : lastShownAnnouncementVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$XboardState {

 bool get isLoggedIn; bool get isLoading; XboardUser? get user; XboardSubscribe? get subscribe; List<XboardNotice> get notices; String? get error;
/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardStateCopyWith<XboardState> get copyWith => _$XboardStateCopyWithImpl<XboardState>(this as XboardState, _$identity);

  /// Serializes this XboardState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.subscribe, subscribe) || other.subscribe == subscribe)&&const DeepCollectionEquality().equals(other.notices, notices)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoggedIn,isLoading,user,subscribe,const DeepCollectionEquality().hash(notices),error);

@override
String toString() {
  return 'XboardState(isLoggedIn: $isLoggedIn, isLoading: $isLoading, user: $user, subscribe: $subscribe, notices: $notices, error: $error)';
}


}

/// @nodoc
abstract mixin class $XboardStateCopyWith<$Res>  {
  factory $XboardStateCopyWith(XboardState value, $Res Function(XboardState) _then) = _$XboardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoggedIn, bool isLoading, XboardUser? user, XboardSubscribe? subscribe, List<XboardNotice> notices, String? error
});


$XboardUserCopyWith<$Res>? get user;$XboardSubscribeCopyWith<$Res>? get subscribe;

}
/// @nodoc
class _$XboardStateCopyWithImpl<$Res>
    implements $XboardStateCopyWith<$Res> {
  _$XboardStateCopyWithImpl(this._self, this._then);

  final XboardState _self;
  final $Res Function(XboardState) _then;

/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoggedIn = null,Object? isLoading = null,Object? user = freezed,Object? subscribe = freezed,Object? notices = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as XboardUser?,subscribe: freezed == subscribe ? _self.subscribe : subscribe // ignore: cast_nullable_to_non_nullable
as XboardSubscribe?,notices: null == notices ? _self.notices : notices // ignore: cast_nullable_to_non_nullable
as List<XboardNotice>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $XboardUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardSubscribeCopyWith<$Res>? get subscribe {
    if (_self.subscribe == null) {
    return null;
  }

  return $XboardSubscribeCopyWith<$Res>(_self.subscribe!, (value) {
    return _then(_self.copyWith(subscribe: value));
  });
}
}


/// Adds pattern-matching-related methods to [XboardState].
extension XboardStatePatterns on XboardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardState value)  $default,){
final _that = this;
switch (_that) {
case _XboardState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardState value)?  $default,){
final _that = this;
switch (_that) {
case _XboardState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoggedIn,  bool isLoading,  XboardUser? user,  XboardSubscribe? subscribe,  List<XboardNotice> notices,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardState() when $default != null:
return $default(_that.isLoggedIn,_that.isLoading,_that.user,_that.subscribe,_that.notices,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoggedIn,  bool isLoading,  XboardUser? user,  XboardSubscribe? subscribe,  List<XboardNotice> notices,  String? error)  $default,) {final _that = this;
switch (_that) {
case _XboardState():
return $default(_that.isLoggedIn,_that.isLoading,_that.user,_that.subscribe,_that.notices,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoggedIn,  bool isLoading,  XboardUser? user,  XboardSubscribe? subscribe,  List<XboardNotice> notices,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _XboardState() when $default != null:
return $default(_that.isLoggedIn,_that.isLoading,_that.user,_that.subscribe,_that.notices,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardState implements XboardState {
  const _XboardState({this.isLoggedIn = false, this.isLoading = false, this.user, this.subscribe, final  List<XboardNotice> notices = const [], this.error}): _notices = notices;
  factory _XboardState.fromJson(Map<String, dynamic> json) => _$XboardStateFromJson(json);

@override@JsonKey() final  bool isLoggedIn;
@override@JsonKey() final  bool isLoading;
@override final  XboardUser? user;
@override final  XboardSubscribe? subscribe;
 final  List<XboardNotice> _notices;
@override@JsonKey() List<XboardNotice> get notices {
  if (_notices is EqualUnmodifiableListView) return _notices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notices);
}

@override final  String? error;

/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardStateCopyWith<_XboardState> get copyWith => __$XboardStateCopyWithImpl<_XboardState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.subscribe, subscribe) || other.subscribe == subscribe)&&const DeepCollectionEquality().equals(other._notices, _notices)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoggedIn,isLoading,user,subscribe,const DeepCollectionEquality().hash(_notices),error);

@override
String toString() {
  return 'XboardState(isLoggedIn: $isLoggedIn, isLoading: $isLoading, user: $user, subscribe: $subscribe, notices: $notices, error: $error)';
}


}

/// @nodoc
abstract mixin class _$XboardStateCopyWith<$Res> implements $XboardStateCopyWith<$Res> {
  factory _$XboardStateCopyWith(_XboardState value, $Res Function(_XboardState) _then) = __$XboardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoggedIn, bool isLoading, XboardUser? user, XboardSubscribe? subscribe, List<XboardNotice> notices, String? error
});


@override $XboardUserCopyWith<$Res>? get user;@override $XboardSubscribeCopyWith<$Res>? get subscribe;

}
/// @nodoc
class __$XboardStateCopyWithImpl<$Res>
    implements _$XboardStateCopyWith<$Res> {
  __$XboardStateCopyWithImpl(this._self, this._then);

  final _XboardState _self;
  final $Res Function(_XboardState) _then;

/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoggedIn = null,Object? isLoading = null,Object? user = freezed,Object? subscribe = freezed,Object? notices = null,Object? error = freezed,}) {
  return _then(_XboardState(
isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as XboardUser?,subscribe: freezed == subscribe ? _self.subscribe : subscribe // ignore: cast_nullable_to_non_nullable
as XboardSubscribe?,notices: null == notices ? _self._notices : notices // ignore: cast_nullable_to_non_nullable
as List<XboardNotice>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $XboardUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of XboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardSubscribeCopyWith<$Res>? get subscribe {
    if (_self.subscribe == null) {
    return null;
  }

  return $XboardSubscribeCopyWith<$Res>(_self.subscribe!, (value) {
    return _then(_self.copyWith(subscribe: value));
  });
}
}


/// @nodoc
mixin _$XboardInviteInfo {

/// 邀请码列表
@JsonKey(name: 'codes') List<XboardInviteCode> get codes;/// 邀请数据统计
@JsonKey(name: 'stat') XboardInviteStat? get stat;
/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardInviteInfoCopyWith<XboardInviteInfo> get copyWith => _$XboardInviteInfoCopyWithImpl<XboardInviteInfo>(this as XboardInviteInfo, _$identity);

  /// Serializes this XboardInviteInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardInviteInfo&&const DeepCollectionEquality().equals(other.codes, codes)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(codes),stat);

@override
String toString() {
  return 'XboardInviteInfo(codes: $codes, stat: $stat)';
}


}

/// @nodoc
abstract mixin class $XboardInviteInfoCopyWith<$Res>  {
  factory $XboardInviteInfoCopyWith(XboardInviteInfo value, $Res Function(XboardInviteInfo) _then) = _$XboardInviteInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'codes') List<XboardInviteCode> codes,@JsonKey(name: 'stat') XboardInviteStat? stat
});


$XboardInviteStatCopyWith<$Res>? get stat;

}
/// @nodoc
class _$XboardInviteInfoCopyWithImpl<$Res>
    implements $XboardInviteInfoCopyWith<$Res> {
  _$XboardInviteInfoCopyWithImpl(this._self, this._then);

  final XboardInviteInfo _self;
  final $Res Function(XboardInviteInfo) _then;

/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codes = null,Object? stat = freezed,}) {
  return _then(_self.copyWith(
codes: null == codes ? _self.codes : codes // ignore: cast_nullable_to_non_nullable
as List<XboardInviteCode>,stat: freezed == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as XboardInviteStat?,
  ));
}
/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardInviteStatCopyWith<$Res>? get stat {
    if (_self.stat == null) {
    return null;
  }

  return $XboardInviteStatCopyWith<$Res>(_self.stat!, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// Adds pattern-matching-related methods to [XboardInviteInfo].
extension XboardInviteInfoPatterns on XboardInviteInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardInviteInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardInviteInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardInviteInfo value)  $default,){
final _that = this;
switch (_that) {
case _XboardInviteInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardInviteInfo value)?  $default,){
final _that = this;
switch (_that) {
case _XboardInviteInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'codes')  List<XboardInviteCode> codes, @JsonKey(name: 'stat')  XboardInviteStat? stat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardInviteInfo() when $default != null:
return $default(_that.codes,_that.stat);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'codes')  List<XboardInviteCode> codes, @JsonKey(name: 'stat')  XboardInviteStat? stat)  $default,) {final _that = this;
switch (_that) {
case _XboardInviteInfo():
return $default(_that.codes,_that.stat);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'codes')  List<XboardInviteCode> codes, @JsonKey(name: 'stat')  XboardInviteStat? stat)?  $default,) {final _that = this;
switch (_that) {
case _XboardInviteInfo() when $default != null:
return $default(_that.codes,_that.stat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardInviteInfo implements XboardInviteInfo {
  const _XboardInviteInfo({@JsonKey(name: 'codes') final  List<XboardInviteCode> codes = const [], @JsonKey(name: 'stat') this.stat}): _codes = codes;
  factory _XboardInviteInfo.fromJson(Map<String, dynamic> json) => _$XboardInviteInfoFromJson(json);

/// 邀请码列表
 final  List<XboardInviteCode> _codes;
/// 邀请码列表
@override@JsonKey(name: 'codes') List<XboardInviteCode> get codes {
  if (_codes is EqualUnmodifiableListView) return _codes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codes);
}

/// 邀请数据统计
@override@JsonKey(name: 'stat') final  XboardInviteStat? stat;

/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardInviteInfoCopyWith<_XboardInviteInfo> get copyWith => __$XboardInviteInfoCopyWithImpl<_XboardInviteInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardInviteInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardInviteInfo&&const DeepCollectionEquality().equals(other._codes, _codes)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_codes),stat);

@override
String toString() {
  return 'XboardInviteInfo(codes: $codes, stat: $stat)';
}


}

/// @nodoc
abstract mixin class _$XboardInviteInfoCopyWith<$Res> implements $XboardInviteInfoCopyWith<$Res> {
  factory _$XboardInviteInfoCopyWith(_XboardInviteInfo value, $Res Function(_XboardInviteInfo) _then) = __$XboardInviteInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'codes') List<XboardInviteCode> codes,@JsonKey(name: 'stat') XboardInviteStat? stat
});


@override $XboardInviteStatCopyWith<$Res>? get stat;

}
/// @nodoc
class __$XboardInviteInfoCopyWithImpl<$Res>
    implements _$XboardInviteInfoCopyWith<$Res> {
  __$XboardInviteInfoCopyWithImpl(this._self, this._then);

  final _XboardInviteInfo _self;
  final $Res Function(_XboardInviteInfo) _then;

/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codes = null,Object? stat = freezed,}) {
  return _then(_XboardInviteInfo(
codes: null == codes ? _self._codes : codes // ignore: cast_nullable_to_non_nullable
as List<XboardInviteCode>,stat: freezed == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as XboardInviteStat?,
  ));
}

/// Create a copy of XboardInviteInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$XboardInviteStatCopyWith<$Res>? get stat {
    if (_self.stat == null) {
    return null;
  }

  return $XboardInviteStatCopyWith<$Res>(_self.stat!, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// @nodoc
mixin _$XboardInviteCode {

/// 邀请码 ID
@JsonKey(fromJson: _safeInt) int get id;/// 用户 ID
@JsonKey(name: 'user_id') int? get userId;/// 邀请码
 String get code;/// 邀请人数限制 (null 表示无限)
 int? get limit;/// 使用次数
@JsonKey(name: 'pv', fromJson: _safeInt) int get pv;/// 创建时间
@JsonKey(name: 'created_at') int? get createdAt;/// 更新时间
@JsonKey(name: 'updated_at') int? get updatedAt;
/// Create a copy of XboardInviteCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardInviteCodeCopyWith<XboardInviteCode> get copyWith => _$XboardInviteCodeCopyWithImpl<XboardInviteCode>(this as XboardInviteCode, _$identity);

  /// Serializes this XboardInviteCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardInviteCode&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.code, code) || other.code == code)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pv, pv) || other.pv == pv)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,code,limit,pv,createdAt,updatedAt);

@override
String toString() {
  return 'XboardInviteCode(id: $id, userId: $userId, code: $code, limit: $limit, pv: $pv, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $XboardInviteCodeCopyWith<$Res>  {
  factory $XboardInviteCodeCopyWith(XboardInviteCode value, $Res Function(XboardInviteCode) _then) = _$XboardInviteCodeCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _safeInt) int id,@JsonKey(name: 'user_id') int? userId, String code, int? limit,@JsonKey(name: 'pv', fromJson: _safeInt) int pv,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class _$XboardInviteCodeCopyWithImpl<$Res>
    implements $XboardInviteCodeCopyWith<$Res> {
  _$XboardInviteCodeCopyWithImpl(this._self, this._then);

  final XboardInviteCode _self;
  final $Res Function(XboardInviteCode) _then;

/// Create a copy of XboardInviteCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? code = null,Object? limit = freezed,Object? pv = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,pv: null == pv ? _self.pv : pv // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardInviteCode].
extension XboardInviteCodePatterns on XboardInviteCode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardInviteCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardInviteCode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardInviteCode value)  $default,){
final _that = this;
switch (_that) {
case _XboardInviteCode():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardInviteCode value)?  $default,){
final _that = this;
switch (_that) {
case _XboardInviteCode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeInt)  int id, @JsonKey(name: 'user_id')  int? userId,  String code,  int? limit, @JsonKey(name: 'pv', fromJson: _safeInt)  int pv, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardInviteCode() when $default != null:
return $default(_that.id,_that.userId,_that.code,_that.limit,_that.pv,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeInt)  int id, @JsonKey(name: 'user_id')  int? userId,  String code,  int? limit, @JsonKey(name: 'pv', fromJson: _safeInt)  int pv, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _XboardInviteCode():
return $default(_that.id,_that.userId,_that.code,_that.limit,_that.pv,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeInt)  int id, @JsonKey(name: 'user_id')  int? userId,  String code,  int? limit, @JsonKey(name: 'pv', fromJson: _safeInt)  int pv, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _XboardInviteCode() when $default != null:
return $default(_that.id,_that.userId,_that.code,_that.limit,_that.pv,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardInviteCode implements XboardInviteCode {
  const _XboardInviteCode({@JsonKey(fromJson: _safeInt) this.id = 0, @JsonKey(name: 'user_id') this.userId, this.code = '', this.limit, @JsonKey(name: 'pv', fromJson: _safeInt) this.pv = 0, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _XboardInviteCode.fromJson(Map<String, dynamic> json) => _$XboardInviteCodeFromJson(json);

/// 邀请码 ID
@override@JsonKey(fromJson: _safeInt) final  int id;
/// 用户 ID
@override@JsonKey(name: 'user_id') final  int? userId;
/// 邀请码
@override@JsonKey() final  String code;
/// 邀请人数限制 (null 表示无限)
@override final  int? limit;
/// 使用次数
@override@JsonKey(name: 'pv', fromJson: _safeInt) final  int pv;
/// 创建时间
@override@JsonKey(name: 'created_at') final  int? createdAt;
/// 更新时间
@override@JsonKey(name: 'updated_at') final  int? updatedAt;

/// Create a copy of XboardInviteCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardInviteCodeCopyWith<_XboardInviteCode> get copyWith => __$XboardInviteCodeCopyWithImpl<_XboardInviteCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardInviteCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardInviteCode&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.code, code) || other.code == code)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pv, pv) || other.pv == pv)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,code,limit,pv,createdAt,updatedAt);

@override
String toString() {
  return 'XboardInviteCode(id: $id, userId: $userId, code: $code, limit: $limit, pv: $pv, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$XboardInviteCodeCopyWith<$Res> implements $XboardInviteCodeCopyWith<$Res> {
  factory _$XboardInviteCodeCopyWith(_XboardInviteCode value, $Res Function(_XboardInviteCode) _then) = __$XboardInviteCodeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _safeInt) int id,@JsonKey(name: 'user_id') int? userId, String code, int? limit,@JsonKey(name: 'pv', fromJson: _safeInt) int pv,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class __$XboardInviteCodeCopyWithImpl<$Res>
    implements _$XboardInviteCodeCopyWith<$Res> {
  __$XboardInviteCodeCopyWithImpl(this._self, this._then);

  final _XboardInviteCode _self;
  final $Res Function(_XboardInviteCode) _then;

/// Create a copy of XboardInviteCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? code = null,Object? limit = freezed,Object? pv = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_XboardInviteCode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,pv: null == pv ? _self.pv : pv // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$XboardInviteStat {

/// 已注册用户数
@JsonKey(name: 'registered_count', fromJson: _safeInt) int get registeredCount;/// 佣金比例 (如 10 表示 10%)
@JsonKey(name: 'commission_rate', fromJson: _safeInt) int get commissionRate;/// 待确认佣金（分）
@JsonKey(name: 'pending_commission', fromJson: _safeInt) int get pendingCommission;/// 已确认佣金（分）
@JsonKey(name: 'commission_balance', fromJson: _safeInt) int get commissionBalance;
/// Create a copy of XboardInviteStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardInviteStatCopyWith<XboardInviteStat> get copyWith => _$XboardInviteStatCopyWithImpl<XboardInviteStat>(this as XboardInviteStat, _$identity);

  /// Serializes this XboardInviteStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardInviteStat&&(identical(other.registeredCount, registeredCount) || other.registeredCount == registeredCount)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.pendingCommission, pendingCommission) || other.pendingCommission == pendingCommission)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registeredCount,commissionRate,pendingCommission,commissionBalance);

@override
String toString() {
  return 'XboardInviteStat(registeredCount: $registeredCount, commissionRate: $commissionRate, pendingCommission: $pendingCommission, commissionBalance: $commissionBalance)';
}


}

/// @nodoc
abstract mixin class $XboardInviteStatCopyWith<$Res>  {
  factory $XboardInviteStatCopyWith(XboardInviteStat value, $Res Function(XboardInviteStat) _then) = _$XboardInviteStatCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'registered_count', fromJson: _safeInt) int registeredCount,@JsonKey(name: 'commission_rate', fromJson: _safeInt) int commissionRate,@JsonKey(name: 'pending_commission', fromJson: _safeInt) int pendingCommission,@JsonKey(name: 'commission_balance', fromJson: _safeInt) int commissionBalance
});




}
/// @nodoc
class _$XboardInviteStatCopyWithImpl<$Res>
    implements $XboardInviteStatCopyWith<$Res> {
  _$XboardInviteStatCopyWithImpl(this._self, this._then);

  final XboardInviteStat _self;
  final $Res Function(XboardInviteStat) _then;

/// Create a copy of XboardInviteStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registeredCount = null,Object? commissionRate = null,Object? pendingCommission = null,Object? commissionBalance = null,}) {
  return _then(_self.copyWith(
registeredCount: null == registeredCount ? _self.registeredCount : registeredCount // ignore: cast_nullable_to_non_nullable
as int,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int,pendingCommission: null == pendingCommission ? _self.pendingCommission : pendingCommission // ignore: cast_nullable_to_non_nullable
as int,commissionBalance: null == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardInviteStat].
extension XboardInviteStatPatterns on XboardInviteStat {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardInviteStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardInviteStat() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardInviteStat value)  $default,){
final _that = this;
switch (_that) {
case _XboardInviteStat():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardInviteStat value)?  $default,){
final _that = this;
switch (_that) {
case _XboardInviteStat() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'registered_count', fromJson: _safeInt)  int registeredCount, @JsonKey(name: 'commission_rate', fromJson: _safeInt)  int commissionRate, @JsonKey(name: 'pending_commission', fromJson: _safeInt)  int pendingCommission, @JsonKey(name: 'commission_balance', fromJson: _safeInt)  int commissionBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardInviteStat() when $default != null:
return $default(_that.registeredCount,_that.commissionRate,_that.pendingCommission,_that.commissionBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'registered_count', fromJson: _safeInt)  int registeredCount, @JsonKey(name: 'commission_rate', fromJson: _safeInt)  int commissionRate, @JsonKey(name: 'pending_commission', fromJson: _safeInt)  int pendingCommission, @JsonKey(name: 'commission_balance', fromJson: _safeInt)  int commissionBalance)  $default,) {final _that = this;
switch (_that) {
case _XboardInviteStat():
return $default(_that.registeredCount,_that.commissionRate,_that.pendingCommission,_that.commissionBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'registered_count', fromJson: _safeInt)  int registeredCount, @JsonKey(name: 'commission_rate', fromJson: _safeInt)  int commissionRate, @JsonKey(name: 'pending_commission', fromJson: _safeInt)  int pendingCommission, @JsonKey(name: 'commission_balance', fromJson: _safeInt)  int commissionBalance)?  $default,) {final _that = this;
switch (_that) {
case _XboardInviteStat() when $default != null:
return $default(_that.registeredCount,_that.commissionRate,_that.pendingCommission,_that.commissionBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardInviteStat implements XboardInviteStat {
  const _XboardInviteStat({@JsonKey(name: 'registered_count', fromJson: _safeInt) this.registeredCount = 0, @JsonKey(name: 'commission_rate', fromJson: _safeInt) this.commissionRate = 0, @JsonKey(name: 'pending_commission', fromJson: _safeInt) this.pendingCommission = 0, @JsonKey(name: 'commission_balance', fromJson: _safeInt) this.commissionBalance = 0});
  factory _XboardInviteStat.fromJson(Map<String, dynamic> json) => _$XboardInviteStatFromJson(json);

/// 已注册用户数
@override@JsonKey(name: 'registered_count', fromJson: _safeInt) final  int registeredCount;
/// 佣金比例 (如 10 表示 10%)
@override@JsonKey(name: 'commission_rate', fromJson: _safeInt) final  int commissionRate;
/// 待确认佣金（分）
@override@JsonKey(name: 'pending_commission', fromJson: _safeInt) final  int pendingCommission;
/// 已确认佣金（分）
@override@JsonKey(name: 'commission_balance', fromJson: _safeInt) final  int commissionBalance;

/// Create a copy of XboardInviteStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardInviteStatCopyWith<_XboardInviteStat> get copyWith => __$XboardInviteStatCopyWithImpl<_XboardInviteStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardInviteStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardInviteStat&&(identical(other.registeredCount, registeredCount) || other.registeredCount == registeredCount)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.pendingCommission, pendingCommission) || other.pendingCommission == pendingCommission)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registeredCount,commissionRate,pendingCommission,commissionBalance);

@override
String toString() {
  return 'XboardInviteStat(registeredCount: $registeredCount, commissionRate: $commissionRate, pendingCommission: $pendingCommission, commissionBalance: $commissionBalance)';
}


}

/// @nodoc
abstract mixin class _$XboardInviteStatCopyWith<$Res> implements $XboardInviteStatCopyWith<$Res> {
  factory _$XboardInviteStatCopyWith(_XboardInviteStat value, $Res Function(_XboardInviteStat) _then) = __$XboardInviteStatCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'registered_count', fromJson: _safeInt) int registeredCount,@JsonKey(name: 'commission_rate', fromJson: _safeInt) int commissionRate,@JsonKey(name: 'pending_commission', fromJson: _safeInt) int pendingCommission,@JsonKey(name: 'commission_balance', fromJson: _safeInt) int commissionBalance
});




}
/// @nodoc
class __$XboardInviteStatCopyWithImpl<$Res>
    implements _$XboardInviteStatCopyWith<$Res> {
  __$XboardInviteStatCopyWithImpl(this._self, this._then);

  final _XboardInviteStat _self;
  final $Res Function(_XboardInviteStat) _then;

/// Create a copy of XboardInviteStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registeredCount = null,Object? commissionRate = null,Object? pendingCommission = null,Object? commissionBalance = null,}) {
  return _then(_XboardInviteStat(
registeredCount: null == registeredCount ? _self.registeredCount : registeredCount // ignore: cast_nullable_to_non_nullable
as int,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as int,pendingCommission: null == pendingCommission ? _self.pendingCommission : pendingCommission // ignore: cast_nullable_to_non_nullable
as int,commissionBalance: null == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$XboardCheckinStatus {

/// 今日是否已签到
@JsonKey(name: 'is_checked_in') bool get isCheckedIn;/// 上次签到时间（时间戳）
@JsonKey(name: 'last_checkin_at') int? get lastCheckinAt;/// 连续签到天数
@JsonKey(name: 'continuous_days') int get continuousDays;/// 本月签到天数
@JsonKey(name: 'month_checkin_days') int get monthCheckinDays;
/// Create a copy of XboardCheckinStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardCheckinStatusCopyWith<XboardCheckinStatus> get copyWith => _$XboardCheckinStatusCopyWithImpl<XboardCheckinStatus>(this as XboardCheckinStatus, _$identity);

  /// Serializes this XboardCheckinStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardCheckinStatus&&(identical(other.isCheckedIn, isCheckedIn) || other.isCheckedIn == isCheckedIn)&&(identical(other.lastCheckinAt, lastCheckinAt) || other.lastCheckinAt == lastCheckinAt)&&(identical(other.continuousDays, continuousDays) || other.continuousDays == continuousDays)&&(identical(other.monthCheckinDays, monthCheckinDays) || other.monthCheckinDays == monthCheckinDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCheckedIn,lastCheckinAt,continuousDays,monthCheckinDays);

@override
String toString() {
  return 'XboardCheckinStatus(isCheckedIn: $isCheckedIn, lastCheckinAt: $lastCheckinAt, continuousDays: $continuousDays, monthCheckinDays: $monthCheckinDays)';
}


}

/// @nodoc
abstract mixin class $XboardCheckinStatusCopyWith<$Res>  {
  factory $XboardCheckinStatusCopyWith(XboardCheckinStatus value, $Res Function(XboardCheckinStatus) _then) = _$XboardCheckinStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_checked_in') bool isCheckedIn,@JsonKey(name: 'last_checkin_at') int? lastCheckinAt,@JsonKey(name: 'continuous_days') int continuousDays,@JsonKey(name: 'month_checkin_days') int monthCheckinDays
});




}
/// @nodoc
class _$XboardCheckinStatusCopyWithImpl<$Res>
    implements $XboardCheckinStatusCopyWith<$Res> {
  _$XboardCheckinStatusCopyWithImpl(this._self, this._then);

  final XboardCheckinStatus _self;
  final $Res Function(XboardCheckinStatus) _then;

/// Create a copy of XboardCheckinStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCheckedIn = null,Object? lastCheckinAt = freezed,Object? continuousDays = null,Object? monthCheckinDays = null,}) {
  return _then(_self.copyWith(
isCheckedIn: null == isCheckedIn ? _self.isCheckedIn : isCheckedIn // ignore: cast_nullable_to_non_nullable
as bool,lastCheckinAt: freezed == lastCheckinAt ? _self.lastCheckinAt : lastCheckinAt // ignore: cast_nullable_to_non_nullable
as int?,continuousDays: null == continuousDays ? _self.continuousDays : continuousDays // ignore: cast_nullable_to_non_nullable
as int,monthCheckinDays: null == monthCheckinDays ? _self.monthCheckinDays : monthCheckinDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardCheckinStatus].
extension XboardCheckinStatusPatterns on XboardCheckinStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardCheckinStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardCheckinStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardCheckinStatus value)  $default,){
final _that = this;
switch (_that) {
case _XboardCheckinStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardCheckinStatus value)?  $default,){
final _that = this;
switch (_that) {
case _XboardCheckinStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_checked_in')  bool isCheckedIn, @JsonKey(name: 'last_checkin_at')  int? lastCheckinAt, @JsonKey(name: 'continuous_days')  int continuousDays, @JsonKey(name: 'month_checkin_days')  int monthCheckinDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardCheckinStatus() when $default != null:
return $default(_that.isCheckedIn,_that.lastCheckinAt,_that.continuousDays,_that.monthCheckinDays);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_checked_in')  bool isCheckedIn, @JsonKey(name: 'last_checkin_at')  int? lastCheckinAt, @JsonKey(name: 'continuous_days')  int continuousDays, @JsonKey(name: 'month_checkin_days')  int monthCheckinDays)  $default,) {final _that = this;
switch (_that) {
case _XboardCheckinStatus():
return $default(_that.isCheckedIn,_that.lastCheckinAt,_that.continuousDays,_that.monthCheckinDays);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_checked_in')  bool isCheckedIn, @JsonKey(name: 'last_checkin_at')  int? lastCheckinAt, @JsonKey(name: 'continuous_days')  int continuousDays, @JsonKey(name: 'month_checkin_days')  int monthCheckinDays)?  $default,) {final _that = this;
switch (_that) {
case _XboardCheckinStatus() when $default != null:
return $default(_that.isCheckedIn,_that.lastCheckinAt,_that.continuousDays,_that.monthCheckinDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardCheckinStatus implements XboardCheckinStatus {
  const _XboardCheckinStatus({@JsonKey(name: 'is_checked_in') this.isCheckedIn = false, @JsonKey(name: 'last_checkin_at') this.lastCheckinAt, @JsonKey(name: 'continuous_days') this.continuousDays = 0, @JsonKey(name: 'month_checkin_days') this.monthCheckinDays = 0});
  factory _XboardCheckinStatus.fromJson(Map<String, dynamic> json) => _$XboardCheckinStatusFromJson(json);

/// 今日是否已签到
@override@JsonKey(name: 'is_checked_in') final  bool isCheckedIn;
/// 上次签到时间（时间戳）
@override@JsonKey(name: 'last_checkin_at') final  int? lastCheckinAt;
/// 连续签到天数
@override@JsonKey(name: 'continuous_days') final  int continuousDays;
/// 本月签到天数
@override@JsonKey(name: 'month_checkin_days') final  int monthCheckinDays;

/// Create a copy of XboardCheckinStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardCheckinStatusCopyWith<_XboardCheckinStatus> get copyWith => __$XboardCheckinStatusCopyWithImpl<_XboardCheckinStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardCheckinStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardCheckinStatus&&(identical(other.isCheckedIn, isCheckedIn) || other.isCheckedIn == isCheckedIn)&&(identical(other.lastCheckinAt, lastCheckinAt) || other.lastCheckinAt == lastCheckinAt)&&(identical(other.continuousDays, continuousDays) || other.continuousDays == continuousDays)&&(identical(other.monthCheckinDays, monthCheckinDays) || other.monthCheckinDays == monthCheckinDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCheckedIn,lastCheckinAt,continuousDays,monthCheckinDays);

@override
String toString() {
  return 'XboardCheckinStatus(isCheckedIn: $isCheckedIn, lastCheckinAt: $lastCheckinAt, continuousDays: $continuousDays, monthCheckinDays: $monthCheckinDays)';
}


}

/// @nodoc
abstract mixin class _$XboardCheckinStatusCopyWith<$Res> implements $XboardCheckinStatusCopyWith<$Res> {
  factory _$XboardCheckinStatusCopyWith(_XboardCheckinStatus value, $Res Function(_XboardCheckinStatus) _then) = __$XboardCheckinStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_checked_in') bool isCheckedIn,@JsonKey(name: 'last_checkin_at') int? lastCheckinAt,@JsonKey(name: 'continuous_days') int continuousDays,@JsonKey(name: 'month_checkin_days') int monthCheckinDays
});




}
/// @nodoc
class __$XboardCheckinStatusCopyWithImpl<$Res>
    implements _$XboardCheckinStatusCopyWith<$Res> {
  __$XboardCheckinStatusCopyWithImpl(this._self, this._then);

  final _XboardCheckinStatus _self;
  final $Res Function(_XboardCheckinStatus) _then;

/// Create a copy of XboardCheckinStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCheckedIn = null,Object? lastCheckinAt = freezed,Object? continuousDays = null,Object? monthCheckinDays = null,}) {
  return _then(_XboardCheckinStatus(
isCheckedIn: null == isCheckedIn ? _self.isCheckedIn : isCheckedIn // ignore: cast_nullable_to_non_nullable
as bool,lastCheckinAt: freezed == lastCheckinAt ? _self.lastCheckinAt : lastCheckinAt // ignore: cast_nullable_to_non_nullable
as int?,continuousDays: null == continuousDays ? _self.continuousDays : continuousDays // ignore: cast_nullable_to_non_nullable
as int,monthCheckinDays: null == monthCheckinDays ? _self.monthCheckinDays : monthCheckinDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$XboardCheckinResult {

/// 是否签到成功
 bool get success;/// 获得的流量（字节）
@JsonKey(name: 'traffic') int get traffic;/// 提示消息
 String? get message;
/// Create a copy of XboardCheckinResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XboardCheckinResultCopyWith<XboardCheckinResult> get copyWith => _$XboardCheckinResultCopyWithImpl<XboardCheckinResult>(this as XboardCheckinResult, _$identity);

  /// Serializes this XboardCheckinResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XboardCheckinResult&&(identical(other.success, success) || other.success == success)&&(identical(other.traffic, traffic) || other.traffic == traffic)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,traffic,message);

@override
String toString() {
  return 'XboardCheckinResult(success: $success, traffic: $traffic, message: $message)';
}


}

/// @nodoc
abstract mixin class $XboardCheckinResultCopyWith<$Res>  {
  factory $XboardCheckinResultCopyWith(XboardCheckinResult value, $Res Function(XboardCheckinResult) _then) = _$XboardCheckinResultCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'traffic') int traffic, String? message
});




}
/// @nodoc
class _$XboardCheckinResultCopyWithImpl<$Res>
    implements $XboardCheckinResultCopyWith<$Res> {
  _$XboardCheckinResultCopyWithImpl(this._self, this._then);

  final XboardCheckinResult _self;
  final $Res Function(XboardCheckinResult) _then;

/// Create a copy of XboardCheckinResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? traffic = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,traffic: null == traffic ? _self.traffic : traffic // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XboardCheckinResult].
extension XboardCheckinResultPatterns on XboardCheckinResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XboardCheckinResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XboardCheckinResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XboardCheckinResult value)  $default,){
final _that = this;
switch (_that) {
case _XboardCheckinResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XboardCheckinResult value)?  $default,){
final _that = this;
switch (_that) {
case _XboardCheckinResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'traffic')  int traffic,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XboardCheckinResult() when $default != null:
return $default(_that.success,_that.traffic,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'traffic')  int traffic,  String? message)  $default,) {final _that = this;
switch (_that) {
case _XboardCheckinResult():
return $default(_that.success,_that.traffic,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'traffic')  int traffic,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _XboardCheckinResult() when $default != null:
return $default(_that.success,_that.traffic,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _XboardCheckinResult implements XboardCheckinResult {
  const _XboardCheckinResult({this.success = false, @JsonKey(name: 'traffic') this.traffic = 0, this.message});
  factory _XboardCheckinResult.fromJson(Map<String, dynamic> json) => _$XboardCheckinResultFromJson(json);

/// 是否签到成功
@override@JsonKey() final  bool success;
/// 获得的流量（字节）
@override@JsonKey(name: 'traffic') final  int traffic;
/// 提示消息
@override final  String? message;

/// Create a copy of XboardCheckinResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XboardCheckinResultCopyWith<_XboardCheckinResult> get copyWith => __$XboardCheckinResultCopyWithImpl<_XboardCheckinResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XboardCheckinResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XboardCheckinResult&&(identical(other.success, success) || other.success == success)&&(identical(other.traffic, traffic) || other.traffic == traffic)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,traffic,message);

@override
String toString() {
  return 'XboardCheckinResult(success: $success, traffic: $traffic, message: $message)';
}


}

/// @nodoc
abstract mixin class _$XboardCheckinResultCopyWith<$Res> implements $XboardCheckinResultCopyWith<$Res> {
  factory _$XboardCheckinResultCopyWith(_XboardCheckinResult value, $Res Function(_XboardCheckinResult) _then) = __$XboardCheckinResultCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'traffic') int traffic, String? message
});




}
/// @nodoc
class __$XboardCheckinResultCopyWithImpl<$Res>
    implements _$XboardCheckinResultCopyWith<$Res> {
  __$XboardCheckinResultCopyWithImpl(this._self, this._then);

  final _XboardCheckinResult _self;
  final $Res Function(_XboardCheckinResult) _then;

/// Create a copy of XboardCheckinResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? traffic = null,Object? message = freezed,}) {
  return _then(_XboardCheckinResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,traffic: null == traffic ? _self.traffic : traffic // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
