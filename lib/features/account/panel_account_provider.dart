import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'panel_api.dart';
import 'panel_models.dart';
import 'panel_session_store.dart';

typedef PanelApiFactory = PanelApi Function(String baseUrl);

final panelSessionStoreProvider = Provider<PanelSessionStore>(
  (_) => const SecurePanelSessionStore(),
);

final panelApiFactoryProvider = Provider<PanelApiFactory>((_) => PanelApi.new);

final panelAccountProvider =
    AsyncNotifierProvider<PanelAccountController, PanelAccount?>(
      PanelAccountController.new,
    );

class PanelAccountController extends AsyncNotifier<PanelAccount?> {
  PanelSessionStore get _store => ref.read(panelSessionStoreProvider);

  PanelApi _api(String baseUrl) {
    return ref.read(panelApiFactoryProvider)(baseUrl);
  }

  @override
  Future<PanelAccount?> build() async {
    final session = await _store.read();
    if (session == null) return null;
    try {
      return await _loadSession(session);
    } on PanelApiException catch (error) {
      if (error.isUnauthorized) {
        await _store.clear();
        return null;
      }
      rethrow;
    }
  }

  Future<void> login({
    required String baseUrl,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final normalizedUrl = normalizePanelUrl(baseUrl);
      final api = _api(normalizedUrl);
      final authorization = await api.login(email: email, password: password);
      final previous = await _store.read();
      final session = PanelSession(
        baseUrl: normalizedUrl,
        authorization: authorization,
        managedProfileId: previous?.managedProfileId,
      );
      await _store.write(session);
      return _loadSession(session);
    });
  }

  Future<void> refresh() async {
    final session = await _store.read();
    if (session == null) {
      state = const AsyncData(null);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadSession(session));
  }

  Future<void> logout() async {
    final session = await _store.read();
    state = const AsyncLoading();
    if (session != null) {
      try {
        await _api(session.baseUrl).logout(session.authorization);
      } catch (_) {}
      final profileId = session.managedProfileId;
      if (profileId != null) {
        await ref
            .read(profilesActionProvider.notifier)
            .deleteManagedProfile(profileId);
      }
    }
    await _store.clear();
    state = const AsyncData(null);
  }

  Future<PanelAccount> _loadSession(PanelSession session) async {
    try {
      return await _loadAndSync(session);
    } on PanelApiException catch (error) {
      if (error.isUnauthorized) await _store.clear();
      rethrow;
    }
  }

  Future<PanelAccount> _loadAndSync(PanelSession session) async {
    final account = await _api(
      session.baseUrl,
    ).getAccount(session.authorization);
    if (!account.canSync || account.accountId.isEmpty) {
      final profileId = session.managedProfileId;
      if (profileId != null) {
        await ref.read(profilesStreamProvider.future);
        await ref
            .read(profilesActionProvider.notifier)
            .deleteManagedProfile(profileId);
        await _store.write(session.withoutManagedProfile());
      }
      return account;
    }
    final PanelSubscription subscription;
    try {
      subscription = await _api(
        session.baseUrl,
      ).getSubscription(session.authorization);
    } on PanelApiException {
      rethrow;
    } catch (_) {
      throw const PanelApiException('Subscription download failed');
    }
    await ref.read(profilesStreamProvider.future);
    final int profileId;
    try {
      profileId = await ref
          .read(profilesActionProvider.notifier)
          .syncManagedProfile(
            bytes: subscription.bytes,
            label: appName,
            profileId: session.managedProfileId,
            remoteAccountId: account.accountId,
            disposition: subscription.disposition,
            userinfo: subscription.userinfo,
          );
    } catch (_) {
      throw const PanelApiException('Subscription sync failed');
    }
    if (profileId != session.managedProfileId) {
      await _store.write(session.copyWith(managedProfileId: profileId));
    }
    return account;
  }
}
