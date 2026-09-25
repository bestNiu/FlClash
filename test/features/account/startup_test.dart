import 'package:fl_clash/features/account/panel_api.dart';
import 'package:fl_clash/features/account/startup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final logged = <String>[];

  setUp(() {
    logged.clear();
    debugPrint = (message, {wrapWidth}) => logged.add(message ?? '');
  });

  tearDown(() => debugPrint = debugPrintThrottled);

  test('a successful restore reports nothing', () async {
    var restored = false;

    await restorePanelAccount(() async {
      restored = true;
      return null;
    });

    expect(restored, isTrue);
    expect(logged, isEmpty);
  });

  test('a failed restore is reported without the request details', () async {
    await restorePanelAccount(
      () async => throw const PanelApiException(
        'https://panel.example/s/subscription-token',
      ),
    );

    expect(logged, ['[APP] Panel account restore failed']);
    expect(logged.single, isNot(contains('subscription-token')));
  });

  test('a non-panel failure cannot break startup either', () async {
    await restorePanelAccount(() async => throw StateError('boom'));

    expect(logged, ['[APP] Panel account restore failed']);
    expect(logged.single, isNot(contains('boom')));
  });
}
