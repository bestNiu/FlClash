import 'package:fl_clash/features/account/panel_models.dart';
import 'package:fl_clash/features/account/panel_session_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const session = PanelSession(
    baseUrl: 'https://panel.example',
    authorization: 'Bearer secret',
    managedProfileId: 7,
  );

  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test('reads as signed out before anything is stored', () async {
    expect(await const SecurePanelSessionStore().read(), isNull);
  });

  test('round-trips every session field', () async {
    const store = SecurePanelSessionStore();
    await store.write(session);

    final stored = await store.read();

    expect(stored?.baseUrl, session.baseUrl);
    expect(stored?.authorization, session.authorization);
    expect(stored?.managedProfileId, 7);
  });

  test('updating the managed profile keeps the credentials', () async {
    const store = SecurePanelSessionStore();
    await store.write(session);

    await store.write(session.copyWith(managedProfileId: 42));

    final stored = await store.read();
    expect(stored?.managedProfileId, 42);
    expect(stored?.authorization, session.authorization);
  });

  test('dropping the managed profile keeps the session', () async {
    const store = SecurePanelSessionStore();
    await store.write(session);

    await store.write(session.withoutManagedProfile());

    final stored = await store.read();
    expect(stored?.managedProfileId, isNull);
    expect(stored?.baseUrl, session.baseUrl);
  });

  test('a session without its token reads as signed out', () async {
    const store = SecurePanelSessionStore();
    await store.write(session);

    await const FlutterSecureStorage().delete(key: 'panel.authorization');

    expect(await store.read(), isNull);
  });

  test('clear removes every key', () async {
    const store = SecurePanelSessionStore();
    await store.write(session);

    await store.clear();

    expect(await store.read(), isNull);
    expect(await const FlutterSecureStorage().readAll(), isEmpty);
  });
}
