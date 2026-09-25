import 'package:fl_clash/features/account/account_view.dart';
import 'package:fl_clash/features/account/panel_account_provider.dart';
import 'package:fl_clash/features/account/panel_api.dart';
import 'package:fl_clash/features/account/panel_models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/test_app.dart';
import '../../helpers/test_panel.dart';
import '../../helpers/test_profiles.dart';

void main() {
  late FakePanelSessionStore store;
  late FakePanelApi api;
  late TestProfilesAction profiles;

  List<Override> overrides() => [
    panelSessionStoreProvider.overrideWithValue(store),
    panelApiFactoryProvider.overrideWithValue((_) => api),
    profilesProvider.overrideWith(TestProfiles.new),
    profilesActionProvider.overrideWith(() => profiles),
  ];

  setUp(() {
    store = FakePanelSessionStore();
    api = FakePanelApi(account: testPanelAccount());
    profiles = TestProfilesAction();
  });

  Future<void> pumpAccount(WidgetTester tester) async {
    await tester.pumpWidget(
      TestApp(overrides: overrides(), child: const AccountView()),
    );
    await tester.pumpAndSettle();
  }

  Future<void> signIn(WidgetTester tester) async {
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
    );
    await pumpAccount(tester);
  }

  testWidgets('a signed-out account offers the sign-in form', (tester) async {
    await pumpAccount(tester);

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Panel address'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Subscription active'), findsNothing);
  });

  testWidgets('an empty form reports every required field', (tester) async {
    await pumpAccount(tester);

    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('This field is required'), findsNWidgets(3));
    expect(api.calls, isEmpty);
  });

  testWidgets('a stored session renders the account summary', (tester) async {
    await signIn(tester);

    expect(find.text('client@example.com'), findsOneWidget);
    expect(find.text('Monthly'), findsOneWidget);
    expect(find.text('Subscription active'), findsOneWidget);
    expect(find.textContaining('3 B'), findsOneWidget);
    expect(find.text('Sync'), findsOneWidget);
    expect(find.text('Sign out'), findsOneWidget);
    expect(profiles.synced, hasLength(1));
  });

  testWidgets('a failed sync keeps the summary and shows the error', (
    tester,
  ) async {
    await signIn(tester);
    api.failure = const PanelApiException('Network error');

    await tester.tap(find.text('Sync'));
    await tester.pumpAndSettle();

    expect(find.text('Network error'), findsOneWidget);
    expect(find.text('client@example.com'), findsOneWidget);
    expect(find.text('Sign in'), findsNothing);
    expect(store.session?.authorization, 'Bearer stored');
  });

  testWidgets('signing out revokes the session and clears the profile', (
    tester,
  ) async {
    await signIn(tester);
    final managedProfileId = store.session?.managedProfileId;

    await tester.tap(find.text('Sign out'));
    await tester.pumpAndSettle();

    expect(api.calls.last, 'logout');
    expect(store.session, isNull);
    expect(profiles.deleted, [managedProfileId]);
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Subscription active'), findsNothing);
  });

  testWidgets('an expired subscription reports its state', (tester) async {
    api.account = testPanelAccount(expiresAt: 1000);
    store.session = const PanelSession(
      baseUrl: panelBaseUrl,
      authorization: 'Bearer stored',
      managedProfileId: 5,
    );

    await pumpAccount(tester);

    expect(find.text('Subscription expired'), findsOneWidget);
    expect(profiles.deleted, [5]);
    expect(profiles.synced, isEmpty);
  });
}
