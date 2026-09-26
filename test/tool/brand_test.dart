import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../../tool/src/brand/brand.dart';

void main() {
  final root = Directory.current;
  final activeKey = Brand.resolveKey(root);
  final active = Brand.load(root, activeKey);

  String applyEdits(String content, String relative, Brand brand) {
    for (final edit in brandEdits.where((edit) => edit.path == relative)) {
      content = edit.applyTo(content, brand);
    }
    return content;
  }

  String rewrite(String relative, Brand brand) => applyEdits(
    File(p.join(root.path, relative)).readAsStringSync(),
    relative,
    brand,
  );

  Brand whiteLabel() => Brand(
    key: 'acme',
    displayName: 'acme01',
    artifactPrefix: 'acme01',
    publisher: 'ACME',
    maintainerName: 'ACME Ops',
    maintainerEmail: 'ops@acme.example',
    macosCopyright: 'Copyright 2026 ACME.',
    windowsCopyright: 'Copyright (C) 2026 ACME.',
    repository: 'acme/panel-app',
    publisherUrl: 'https://acme.example',
    supportUrl: 'https://acme.example/support',
    bundleId: 'com.acme01.app',
    debugSuffix: '.dev',
    published: false,
    publishedBundleId: '',
    frozen: active.frozen,
  );

  test('the committed tree matches the active brand', () {
    final report = inspectBrand(root, active);
    expect(report.drift, isEmpty);
    expect(report.missingEdits, isEmpty);
    expect(report.brokenFreezes, isEmpty);
  });

  test('every managed file exists', () {
    final missing = brandEdits
        .map((edit) => edit.path)
        .toSet()
        .where((relative) => !File(p.join(root.path, relative)).existsSync())
        .toList();
    expect(missing, isEmpty);
  });

  test('a white-label brand rewrites the user-visible names', () {
    final brand = whiteLabel();
    expect(
      rewrite('macos/Runner/Configs/AppInfo.xcconfig', brand),
      contains('PRODUCT_NAME = acme01'),
    );
    expect(
      rewrite('macos/packaging/dmg/make_config.yaml', brand),
      allOf(contains('title: acme01'), contains('path: acme01.app')),
    );
    expect(
      rewrite('distribute_options.yaml', brand),
      contains("app_name: 'acme01'"),
    );
    expect(
      rewrite('windows/runner/main.cpp', brand),
      contains('window.Create(L"acme01"'),
    );
    expect(
      rewrite('android/common/src/main/res/values/strings.xml', brand),
      allOf(
        contains('<string name="app_name">acme01</string>'),
        contains('<string name="service_channel_name">acme01 Service</string>'),
      ),
    );
    expect(
      rewrite('lib/common/constant.dart', brand),
      allOf(
        contains("defaultValue: 'acme01',"),
        contains("defaultValue: 'acme/panel-app',"),
        contains("defaultValue: 'https://acme.example/support',"),
      ),
    );
    expect(
      rewrite('linux/packaging/deb/make_config.yaml', brand),
      allOf(
        contains('display_name: acme01'),
        contains('package_name: acme01'),
        contains('name: ACME Ops'),
        contains('email: ops@acme.example'),
      ),
    );
    expect(
      rewrite('.github/release_template.md', brand),
      allOf(
        contains('acme/panel-app/releases/download'),
        contains('acme01-VERSION-android-arm64-v8a.apk'),
      ),
    );
  });

  test('no managed edit disturbs a frozen identifier', () {
    for (final check in frozenChecks(active)) {
      expect(
        rewrite(check.path, whiteLabel()),
        contains(check.needle),
        reason: '${check.identifier} in ${check.path}',
      );
    }
  });

  test('a brand that would break file names is rejected', () {
    expect(
      () => Brand.fromYaml({
        'key': 'bad',
        'display_name': 'Bad Name',
        'identity': {'bundle_id': 'com.bad.app'},
        'maintainer': {'name': 'x', 'email': 'x@example'},
        'copyright': {'macos': 'a', 'windows': 'b'},
        'links': {
          'repository': 'a/b',
          'publisher_url': 'https://a',
          'support_url': 'https://a',
        },
      }),
      throwsFormatException,
    );
  });

  test('a profile missing a required link is rejected', () {
    expect(
      () => Brand.fromYaml({
        'key': 'bad',
        'display_name': 'ok01',
        'identity': {'bundle_id': 'com.ok01.app'},
        'maintainer': {'name': 'x', 'email': 'x@example'},
        'copyright': {'macos': 'a', 'windows': 'b'},
        'links': {'repository': 'a/b'},
      }),
      throwsFormatException,
    );
  });

  test('buildDefines hands the brand to flutter', () {
    expect(buildDefines(whiteLabel()), [
      '--dart-define=FLY001_APP_NAME=acme01',
      '--dart-define=FLY001_REPOSITORY=acme/panel-app',
      '--dart-define=FLY001_SUPPORT_URL=https://acme.example/support',
    ]);
  });

  test('switching brands round-trips every managed file', () {
    final other = whiteLabel();
    for (final relative in brandEdits.map((edit) => edit.path).toSet()) {
      final original = File(p.join(root.path, relative)).readAsStringSync();
      final switched = applyEdits(original, relative, other);
      expect(
        applyEdits(switched, relative, active),
        original,
        reason: relative,
      );
    }
  });

  test('a white-label brand moves every application identity', () {
    final brand = whiteLabel();
    expect(
      rewrite('android/app/build.gradle.kts', brand),
      contains('applicationId = "com.acme01.app"'),
    );
    expect(
      rewrite('macos/Runner/Configs/AppInfo.xcconfig', brand),
      contains('PRODUCT_BUNDLE_IDENTIFIER = com.acme01.app'),
    );
    expect(
      rewrite('linux/CMakeLists.txt', brand),
      contains('set(APPLICATION_ID "com.acme01.app")'),
    );
    final project = rewrite('macos/Runner.xcodeproj/project.pbxproj', brand);
    expect(
      project,
      contains('PRODUCT_BUNDLE_IDENTIFIER = com.acme01.app.dev;'),
    );
    expect(project, contains('com.follow.flClash.RunnerTests'));
    expect(project, isNot(contains('RunnerTests = com.acme01')));
  });

  test('an application identity that is not reverse DNS is rejected', () {
    expect(
      () => Brand.fromYaml({
        'key': 'bad',
        'display_name': 'ok01',
        'identity': {'bundle_id': 'fly001'},
        'maintainer': {'name': 'x', 'email': 'x@example'},
        'copyright': {'macos': 'a', 'windows': 'b'},
        'links': {
          'repository': 'a/b',
          'publisher_url': 'https://a',
          'support_url': 'https://a',
        },
      }),
      throwsFormatException,
    );
  });

  test('a published brand refuses to move its application identity', () {
    final shipped = Brand(
      key: active.key,
      displayName: active.displayName,
      artifactPrefix: active.artifactPrefix,
      publisher: active.publisher,
      maintainerName: active.maintainerName,
      maintainerEmail: active.maintainerEmail,
      macosCopyright: active.macosCopyright,
      windowsCopyright: active.windowsCopyright,
      repository: active.repository,
      publisherUrl: active.publisherUrl,
      supportUrl: active.supportUrl,
      bundleId: 'com.moved.app',
      debugSuffix: active.debugSuffix,
      published: true,
      publishedBundleId: active.bundleId,
      frozen: active.frozen,
    );

    final report = inspectBrand(root, shipped);
    expect(report.brokenFreezes, isNotEmpty);
    expect(
      report.brokenFreezes.map((item) => item.detail),
      anyElement(contains('a shipped application id cannot change')),
    );
  });

  test('an unknown brand key is refused', () {
    expect(
      () => Brand.resolveKey(root, requested: 'no-such-brand'),
      throwsStateError,
    );
  });
}
