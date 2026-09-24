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
}

class PanelAccount {
  final String email;
  final String subscriptionUrl;
  final int? planId;
  final String? planName;
  final int expiresAt;
  final int upload;
  final int download;
  final int total;
  final int? deviceLimit;
  final int? speedLimit;

  const PanelAccount({
    required this.email,
    required this.subscriptionUrl,
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

  factory PanelAccount.fromJson(Map<String, Object?> json) {
    final subscription = _objectMap(json['subscription']);
    return PanelAccount(
      email: json['email']?.toString() ?? '',
      subscriptionUrl: subscription['url']?.toString() ?? '',
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
