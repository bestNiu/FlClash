import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'panel_models.dart';

abstract interface class PanelSessionStore {
  Future<PanelSession?> read();

  Future<void> write(PanelSession session);

  Future<void> clear();
}

class SecurePanelSessionStore implements PanelSessionStore {
  static const _baseUrlKey = 'panel.base_url';
  static const _authorizationKey = 'panel.authorization';
  static const _managedProfileIdKey = 'panel.managed_profile_id';

  final FlutterSecureStorage storage;

  const SecurePanelSessionStore({this.storage = const FlutterSecureStorage()});

  @override
  Future<PanelSession?> read() async {
    final values = await storage.readAll();
    final baseUrl = values[_baseUrlKey];
    final authorization = values[_authorizationKey];
    if (baseUrl == null || authorization == null) return null;
    return PanelSession(
      baseUrl: baseUrl,
      authorization: authorization,
      managedProfileId: int.tryParse(values[_managedProfileIdKey] ?? ''),
    );
  }

  @override
  Future<void> write(PanelSession session) async {
    await storage.write(key: _baseUrlKey, value: session.baseUrl);
    await storage.write(key: _authorizationKey, value: session.authorization);
    final profileId = session.managedProfileId;
    if (profileId == null) {
      await storage.delete(key: _managedProfileIdKey);
    } else {
      await storage.write(
        key: _managedProfileIdKey,
        value: profileId.toString(),
      );
    }
  }

  @override
  Future<void> clear() async {
    await storage.delete(key: _baseUrlKey);
    await storage.delete(key: _authorizationKey);
    await storage.delete(key: _managedProfileIdKey);
  }
}
