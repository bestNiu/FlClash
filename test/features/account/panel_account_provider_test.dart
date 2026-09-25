import 'package:fl_clash/features/account/panel_account_provider.dart';
import 'package:fl_clash/features/account/panel_api.dart';
import 'package:fl_clash/features/account/panel_models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_panel.dart';
import '../../helpers/test_profiles.dart';

void main() {
  late FakePanelSessionStore store;
  late FakePanelApi api;
  late TestProfilesAction profiles;
  late ProviderContainer container;

  ProviderContainer build() {
    final container = ProviderContainer(
      overrides: [
        panelSessionStoreProvider.overrideWithValue(store),
        panelApiFactoryProvider.overrideWithValue((_) => api),
        profilesProvider.overrideWith(TestProfiles.new),
        profilesActionProvider.overrideWith(() => profiles),
      ],
    );
    return container;
  }

  setUp(() {
    store = FakePanelSessionStore();
    api = FakePanelApi(account: testPanelAccount());
    profiles = TestProfilesAction();
    container = build();
    addTearDown(container.dispose);
  });

  Future<PanelAccount?> restore() =>
      container.read(panelAccountProvider.future);

  test('without a session the account stays signed out', () async {
    expect(await restore(), isNull);
    expect(api.calls, isEmpty);
  });

  test(
    'a stored session loads the account and syncs the managed profile',
    () async {
      store.session = const PanelSession(
        baseUrl: panelBaseUrl,
        authorization: 'Bearer stored',
      );

      final restored = await restore();

      expect(restored?.email, 'client@example.com');
      expect(profiles.synced, ['fly001|$panelAccountId|11|null']);
      expect(store.session?.managedProfileId, profiles.nextId);
      expect(api.calls, ['account', 'subscription']);
    },
  );

  test('an unreachable panel keeps the session', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
    );
    api.failure = const PanelApiException('Network error');

    await container.read(panelAccountProvider.notifier).refresh();

    expect(container.read(panelAccountProvider).hasError, isTrue);
    expect(store.session?.authorization, 'Bearer stored');
    expect(store.clears, 0);
  });

  test('a rejected session is dropped', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
    );
    api.unauthorized = true;

    expect(await restore(), isNull);
    expect(store.clears, 1);
  });

  test('an unusable subscription drops the managed profile', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
      managedProfileId: 5,
    );
    api.account = testPanelAccount(expiresAt: 1000);

    final restored = await restore();

    expect(restored?.statusAt(DateTime.now()), PanelAccountStatus.expired);
    expect(profiles.deleted, [5]);
    expect(profiles.synced, isEmpty);
    expect(store.session?.managedProfileId, isNull);
    expect(api.calls, ['account']);
  });

  test('login stores the session before loading the account', () async {
    await container
        .read(panelAccountProvider.notifier)
        .login(
          baseUrl: panelBaseUrl,
          email: 'client@example.com',
          password: 'pw',
        );

    expect(store.session?.authorization, 'Bearer next');
    expect(store.session?.baseUrl, panelBaseUrl);
    expect(
      container.read(panelAccountProvider).value?.accountId,
      panelAccountId,
    );
    expect(api.calls, ['login', 'account', 'subscription']);
  });

  test('a rejected login stores nothing', () async {
    api.failure = const PanelApiException('Bad credentials', statusCode: 403);

    await container
        .read(panelAccountProvider.notifier)
        .login(
          baseUrl: panelBaseUrl,
          email: 'client@example.com',
          password: 'pw',
        );

    expect(store.session, isNull);
    expect(store.writes, 0);
    expect(container.read(panelAccountProvider).hasError, isTrue);
  });

  test('an invalid panel address never reaches the network', () async {
    await container
        .read(panelAccountProvider.notifier)
        .login(baseUrl: 'http://panel.example', email: 'a@b.c', password: 'pw');

    expect(api.calls, isEmpty);
    expect(store.session, isNull);
  });

  test('a failed refresh keeps the last known account', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
    );
    await restore();
    api.failure = const PanelApiException('Network error');

    await container.read(panelAccountProvider.notifier).refresh();

    final state = container.read(panelAccountProvider);
    expect(state.hasError, isTrue);
    expect(
      container.read(panelAccountProvider.notifier).lastKnown?.email,
      'client@example.com',
    );
    expect(store.session?.authorization, 'Bearer stored');
  });

  test('logout revokes the session and removes the managed profile', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
      managedProfileId: 5,
    );
    await restore();

    await container.read(panelAccountProvider.notifier).logout();

    expect(api.calls.last, 'logout');
    expect(profiles.deleted, [profiles.nextId]);
    expect(store.session, isNull);
    expect(container.read(panelAccountProvider).value, isNull);
    expect(container.read(panelAccountProvider.notifier).lastKnown, isNull);
  });

  test('logout still clears locally when the panel is unreachable', () async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
      managedProfileId: 5,
    );
    api.failure = const PanelApiException('Network error');

    await container.read(panelAccountProvider.notifier).logout();

    expect(store.session, isNull);
    expect(profiles.deleted, [5]);
  });
}
