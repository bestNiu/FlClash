import 'dart:typed_data';

class PanelSession {
  final String baseUrl;
  final String authorization;
  final int? managedProfileId;

  const PanelSession({
    required this.baseUrl,
    required this.authorization,
    this.managedProfileId,
  });

  PanelSession copyWith({int? managedProfileId}) {
    return PanelSession(
      baseUrl: baseUrl,
      authorization: authorization,
      managedProfileId: managedProfileId ?? this.managedProfileId,
    );
  }

  PanelSession withoutManagedProfile() {
    return PanelSession(baseUrl: baseUrl, authorization: authorization);
  }
}

class PanelSubscription {
  final Uint8List bytes;
  final String? disposition;
  final String? userinfo;

  const PanelSubscription({
    required this.bytes,
    this.disposition,
    this.userinfo,
  });
}

enum PanelAccountStatus { noPlan, active, expiring, expired, unavailable }

class PanelAccount {
  final String accountId;
  final String email;
  final bool subscriptionAvailable;
  final int? planId;
  final String? planName;
  final int expiresAt;
  final int upload;
  final int download;
  final int total;
  final int? deviceLimit;
  final int? speedLimit;

  const PanelAccount({
    required this.accountId,
    required this.email,
    required this.subscriptionAvailable,
    required this.expiresAt,
    required this.upload,
    required this.download,
    required this.total,
    this.planId,
    this.planName,
    this.deviceLimit,
    this.speedLimit,
  });

  int get used => upload + download;

  DateTime? get expiration => expiresAt > 0
      ? DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000)
      : null;

  PanelAccountStatus statusAt(DateTime now) {
    if (planId == null) return PanelAccountStatus.noPlan;
    final expires = expiration;
    if (expires != null && !expires.isAfter(now)) {
      return PanelAccountStatus.expired;
    }
    if (!subscriptionAvailable || used >= total) {
      return PanelAccountStatus.unavailable;
    }
    if (expires != null && expires.difference(now) <= const Duration(days: 7)) {
      return PanelAccountStatus.expiring;
    }
    return PanelAccountStatus.active;
  }

  bool get canSync => switch (statusAt(DateTime.now())) {
    PanelAccountStatus.active || PanelAccountStatus.expiring => true,
    _ => false,
  };

  factory PanelAccount.fromJson(Map<String, Object?> json) {
    final subscription = _objectMap(json['subscription']);
    return PanelAccount(
      accountId: json['account_id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      subscriptionAvailable: subscription['available'] == true,
      planId: _nullableInt(subscription['plan_id']),
      planName: subscription['plan_name']?.toString(),
      expiresAt: _nullableInt(subscription['expires_at']) ?? 0,
      upload: _nullableInt(subscription['upload']) ?? 0,
      download: _nullableInt(subscription['download']) ?? 0,
      total: _nullableInt(subscription['total']) ?? 0,
      deviceLimit: _nullableInt(subscription['device_limit']),
      speedLimit: _nullableInt(subscription['speed_limit']),
    );
  }
}

Map<String, Object?> _objectMap(Object? value) {
  if (value is! Map) return const {};
  return value.map((key, value) => MapEntry(key.toString(), value));
}

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value?.toString() ?? '');
}
