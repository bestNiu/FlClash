import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

final class Brand {
  final String key;
  final String displayName;
  final String artifactPrefix;
  final String publisher;
  final String maintainerName;
  final String maintainerEmail;
  final String macosCopyright;
  final String windowsCopyright;
  final String repository;
  final String publisherUrl;
  final String supportUrl;
  final String bundleId;
  final String debugSuffix;
  final bool published;
  final String publishedBundleId;
  final Map<String, Object?> frozen;

  const Brand({
    required this.key,
    required this.displayName,
    required this.artifactPrefix,
    required this.publisher,
    required this.maintainerName,
    required this.maintainerEmail,
    required this.macosCopyright,
    required this.windowsCopyright,
    required this.repository,
    required this.publisherUrl,
    required this.supportUrl,
    required this.bundleId,
    required this.debugSuffix,
    required this.published,
    required this.publishedBundleId,
    required this.frozen,
  });

  static final _namePattern = RegExp(r'^[A-Za-z0-9][A-Za-z0-9._+-]*$');

  factory Brand.fromYaml(Map<Object?, Object?> yaml, {String? key}) {
    final brandKey = (yaml['key'] ?? key)?.toString() ?? '';
    final displayName = _require(yaml, 'display_name', brandKey);
    if (!_namePattern.hasMatch(displayName)) {
      throw FormatException(
        'display_name "$displayName" must stay free of spaces and shell '
        'metacharacters: it becomes a product and file name',
      );
    }
    final links = _map(yaml['links']);
    final identity = _map(yaml['identity']);
    final bundleId = _require(identity, 'bundle_id', brandKey);
    if (!RegExp(
      r'^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z0-9_-]+)+$',
    ).hasMatch(bundleId)) {
      throw FormatException(
        'identity.bundle_id "$bundleId" is not a reverse-DNS identifier',
      );
    }
    return Brand(
      key: brandKey,
      displayName: displayName,
      artifactPrefix: (yaml['artifact_prefix'] ?? displayName).toString(),
      publisher: (yaml['publisher'] ?? displayName).toString(),
      maintainerName: _require(_map(yaml['maintainer']), 'name', brandKey),
      maintainerEmail: _require(_map(yaml['maintainer']), 'email', brandKey),
      macosCopyright: _require(_map(yaml['copyright']), 'macos', brandKey),
      windowsCopyright: _require(_map(yaml['copyright']), 'windows', brandKey),
      repository: _require(links, 'repository', brandKey),
      publisherUrl: _require(links, 'publisher_url', brandKey),
      supportUrl: _require(links, 'support_url', brandKey),
      bundleId: bundleId,
      debugSuffix: (identity['debug_suffix'] ?? '.dev').toString(),
      published: identity['published'] == true,
      publishedBundleId: (identity['published_bundle_id'] ?? '').toString(),
      frozen: Map<String, Object?>.from(yaml['frozen'] as Map? ?? const {}),
    );
  }

  static Map<Object?, Object?> _map(Object? value) {
    if (value is Map) return Map<Object?, Object?>.from(value);
    return const {};
  }

  static String _require(
    Map<Object?, Object?> source,
    String key,
    String brand,
  ) {
    final value = source[key]?.toString() ?? '';
    if (value.isEmpty) {
      throw FormatException('brand "$brand" is missing "$key"');
    }
    return value;
  }

  static Directory brandsDirectory(Directory root) =>
      Directory(p.join(root.path, 'brands'));

  static List<String> availableKeys(Directory root) {
    final directory = brandsDirectory(root);
    if (!directory.existsSync()) return const [];
    return directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.yaml'))
        .map((file) => p.basenameWithoutExtension(file.path))
        .toList()
      ..sort();
  }

  static Brand load(Directory root, String key) {
    final file = File(p.join(brandsDirectory(root).path, '$key.yaml'));
    if (!file.existsSync()) {
      throw StateError('no brand profile at ${file.path}');
    }
    final parsed = loadYaml(file.readAsStringSync());
    if (parsed is! Map) {
      throw FormatException('${file.path} must contain a mapping');
    }
    return Brand.fromYaml(Map<Object?, Object?>.from(parsed), key: key);
  }

  /// Picks the brand named by `--brand`, `FLCLASH_BRAND`, or the single profile
  /// in `brands/`.
  static String resolveKey(Directory root, {String? requested}) {
    final keys = availableKeys(root);
    final fromEnvironment = Platform.environment['FLCLASH_BRAND'];
    final key =
        requested ??
        (fromEnvironment?.isNotEmpty == true ? fromEnvironment : null);
    if (key != null) {
      if (!keys.contains(key)) {
        throw StateError('unknown brand "$key"; available: ${keys.join(', ')}');
      }
      return key;
    }
    if (keys.length != 1) {
      throw StateError(
        keys.isEmpty
            ? 'no brand profiles under brands/'
            : 'pass --brand; available: ${keys.join(', ')}',
      );
    }
    return keys.single;
  }

  String get appBundleName => '$displayName.app';

  String get debugBundleId => '$bundleId$debugSuffix';

  String get windowsExecutable =>
      frozen['windows_executable']?.toString() ?? '';

  List<String> get protocolSchemes =>
      (frozen['protocol_schemes'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
      const [];
}

final class BrandEdit {
  final String path;
  final RegExp pattern;
  final String Function(Match match, Brand brand) replacement;
  final bool all;

  BrandEdit(this.path, String pattern, this.replacement, {this.all = false})
    : pattern = _compile(pattern);

  static RegExp _compile(String source) => RegExp(source, multiLine: true);

  String applyTo(String content, Brand brand) {
    String replace(Match match) => replacement(match, brand);
    return all
        ? content.replaceAllMapped(pattern, replace)
        : content.replaceFirstMapped(pattern, replace);
  }
}

final List<BrandEdit> brandEdits = [
  BrandEdit(
    'lib/common/constant.dart',
    r"(const appName = String\.fromEnvironment\(\s*'FLY001_APP_NAME',\s*defaultValue: ')[^']*(')",
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'lib/common/constant.dart',
    r"(const repository = String\.fromEnvironment\(\s*'FLY001_REPOSITORY',\s*defaultValue: ')[^']*(')",
    (m, b) => '${m[1]}${b.repository}${m[2]}',
  ),
  BrandEdit(
    'lib/common/constant.dart',
    r"(const supportUrl = String\.fromEnvironment\(\s*'FLY001_SUPPORT_URL',\s*defaultValue: ')[^']*(')",
    (m, b) => '${m[1]}${b.supportUrl}${m[2]}',
  ),
  BrandEdit(
    'android/common/src/main/res/values/strings.xml',
    r'(<string name="app_name">)[^<]*(</string>)',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/common/src/main/res/values/strings.xml',
    r'(<string name="service_channel_name">)[^<]*(</string>)',
    (m, b) => '${m[1]}${b.displayName} Service${m[2]}',
  ),
  BrandEdit(
    'android/service/src/main/java/com/follow/clash/service/models/NotificationParams.kt',
    r'(val title: String = ")[^"]*(")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/service/src/main/java/com/follow/clash/service/modules/NotificationModule.kt',
    r'(setContentTitle\(")[^"]*("\))',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/app/src/main/kotlin/com/follow/clash/models/State.kt',
    r'(val currentProfileName: String = ")[^"]*(")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/app/src/debug/AndroidManifest.xml',
    r'(android:label=")[^"]*( Debug")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
    all: true,
  ),
  BrandEdit(
    'android/tests/service/ServiceConfigTest.kt',
    r'(assertEquals\(")[^"]*(", defaults\.title\))',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/tests/app/SharedStateTest.kt',
    r'(assertEquals\(")[^"]*(", defaults\.currentProfileName\))',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  // The other `state.currentProfileName` assertions check deserialized values,
  // so this one is anchored on the line above it.
  BrandEdit(
    'android/tests/app/SharedStateTest.kt',
    r'(assertEquals\("Starting VPN\.\.\.", state\.startTip\)\n        assertEquals\(")[^"]*(", state\.currentProfileName\))',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'android/app/build.gradle.kts',
    r'(applicationId = ")[^"]*(")',
    (m, b) => '${m[1]}${b.bundleId}${m[2]}',
  ),
  BrandEdit(
    'android/app/build.gradle.kts',
    r'(applicationIdSuffix = ")[^"]*(")',
    (m, b) => '${m[1]}${b.debugSuffix}${m[2]}',
    all: true,
  ),
  BrandEdit(
    'linux/CMakeLists.txt',
    r'(set\(APPLICATION_ID ")[^"]*("\))',
    (m, b) => '${m[1]}${b.bundleId}${m[2]}',
  ),
  BrandEdit(
    'macos/Runner/Configs/AppInfo.xcconfig',
    r'^(PRODUCT_BUNDLE_IDENTIFIER = ).*$',
    (m, b) => '${m[1]}${b.bundleId}',
  ),
  BrandEdit(
    'macos/Runner.xcodeproj/project.pbxproj',
    r'(PRODUCT_BUNDLE_IDENTIFIER = )(?!.*RunnerTests)[\w.-]+;',
    (m, b) => '${m[1]}${b.debugBundleId};',
  ),
  BrandEdit(
    'macos/Runner.xcodeproj/project.pbxproj',
    r'(INFOPLIST_KEY_CFBundleDisplayName = ).*;',
    (m, b) => '${m[1]}${b.displayName};',
    all: true,
  ),
  BrandEdit(
    'macos/Runner/Configs/AppInfo.xcconfig',
    r'^(PRODUCT_NAME = ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'macos/Runner/Configs/AppInfo.xcconfig',
    r'^(PRODUCT_COPYRIGHT = ).*$',
    (m, b) => '${m[1]}${b.macosCopyright}',
  ),
  BrandEdit(
    'macos/Runner.xcodeproj/project.pbxproj',
    r'(/\* )[\w.+-]+\.app( \*/)',
    (m, b) => '${m[1]}${b.appBundleName}${m[2]}',
    all: true,
  ),
  BrandEdit(
    'macos/Runner.xcodeproj/project.pbxproj',
    r'(path = )[\w.+-]+\.app;',
    (m, b) => '${m[1]}${b.appBundleName};',
    all: true,
  ),
  BrandEdit(
    'macos/packaging/dmg/make_config.yaml',
    r'^(title: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'macos/packaging/dmg/make_config.yaml',
    r'(    path: )\S*\.app$',
    (m, b) => '${m[1]}${b.appBundleName}',
  ),
  BrandEdit(
    'windows/runner/Runner.rc',
    r'(VALUE "CompanyName", ")[^"]*(")',
    (m, b) => '${m[1]}${b.publisher}${m[2]}',
  ),
  BrandEdit(
    'windows/runner/Runner.rc',
    r'(VALUE "FileDescription", ")[^"]*(")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'windows/runner/Runner.rc',
    r'(VALUE "ProductName", ")[^"]*(")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'windows/runner/Runner.rc',
    r'(VALUE "LegalCopyright", ")[^"]*(")',
    (m, b) => '${m[1]}${b.windowsCopyright}${m[2]}',
  ),
  BrandEdit(
    'windows/runner/main.cpp',
    r'(window\.Create\(L")[^"]*(")',
    (m, b) => '${m[1]}${b.displayName}${m[2]}',
  ),
  BrandEdit(
    'windows/packaging/exe/make_config.yaml',
    r'^(app_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'windows/packaging/exe/make_config.yaml',
    r'^(display_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'windows/packaging/exe/make_config.yaml',
    r'^(publisher: ).*$',
    (m, b) => '${m[1]}${b.publisher}',
  ),
  BrandEdit(
    'windows/packaging/exe/make_config.yaml',
    r'^(publisher_url: ).*$',
    (m, b) => '${m[1]}${b.publisherUrl}',
  ),
  BrandEdit(
    'linux/packaging/deb/make_config.yaml',
    r'^(display_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/deb/make_config.yaml',
    r'^(package_name: ).*$',
    (m, b) => '${m[1]}${b.displayName.toLowerCase()}',
  ),
  BrandEdit(
    'linux/packaging/deb/make_config.yaml',
    r'^(generic_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/deb/make_config.yaml',
    r'(maintainer:\n  name: ).*(\n  email: ).*',
    (m, b) => '${m[1]}${b.maintainerName}${m[2]}${b.maintainerEmail}',
  ),
  BrandEdit(
    'linux/packaging/deb/make_config.yaml',
    r'(keywords:\n  - )\S+',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/rpm/make_config.yaml',
    r'^(display_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/rpm/make_config.yaml',
    r'(keywords:\n  - )\S+',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/rpm/make_config.yaml',
    r'^(packager: ).*$',
    (m, b) => '${m[1]}${b.maintainerName}',
  ),
  BrandEdit(
    'linux/packaging/rpm/make_config.yaml',
    r'^(packagerEmail: ).*$',
    (m, b) => '${m[1]}${b.maintainerEmail}',
  ),
  BrandEdit(
    'linux/packaging/rpm/make_config.yaml',
    r'^(generic_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/appimage/make_config.yaml',
    r'^(display_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/appimage/make_config.yaml',
    r'^(generic_name: ).*$',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'linux/packaging/appimage/make_config.yaml',
    r'(keywords:\n  - )\S+',
    (m, b) => '${m[1]}${b.displayName}',
  ),
  BrandEdit(
    'distribute_options.yaml',
    r"^(app_name: ')[^']*(')",
    (m, b) => '${m[1]}${b.artifactPrefix}${m[2]}',
  ),
  BrandEdit(
    '.github/release_template.md',
    r'github\.com/[\w.-]+/[\w.-]+/',
    (m, b) => 'github.com/${b.repository}/',
    all: true,
  ),
  BrandEdit(
    '.github/release_template.md',
    r'github/downloads/[\w.-]+/[\w.-]+/',
    (m, b) => 'github/downloads/${b.repository}/',
    all: true,
  ),
  BrandEdit(
    '.github/release_template.md',
    r'download/vVERSION/[\w.-]+-VERSION-',
    (m, b) => 'download/vVERSION/${b.artifactPrefix}-VERSION-',
    all: true,
  ),
  BrandEdit(
    'tool/changelog.dart',
    r"(const _repository = ')[^']*(')",
    (m, b) => '${m[1]}${b.repository}${m[2]}',
  ),
  BrandEdit(
    'test/common/protocol_test.dart',
    r"'Name=[^'\\]*",
    (m, b) => "'Name=${b.displayName}",
  ),
];

final class FrozenCheck {
  final String path;
  final String needle;
  final String identifier;

  const FrozenCheck(this.path, this.identifier, this.needle);
}

List<FrozenCheck> frozenChecks(Brand brand) => [
  FrozenCheck(
    'android/app/google-services.json',
    'firebase_client_for_bundle_id',
    '"package_name": "${brand.bundleId}"',
  ),
  FrozenCheck(
    'android/app/google-services.json',
    'firebase_client_for_debug_bundle_id',
    '"package_name": "${brand.debugBundleId}"',
  ),
  FrozenCheck(
    'windows/CMakeLists.txt',
    'windows_executable',
    'set(BINARY_NAME "${_withoutExtension(brand.windowsExecutable)}")',
  ),
  FrozenCheck(
    'linux/CMakeLists.txt',
    'linux_binary',
    'set(BINARY_NAME "${brand.frozen['linux_binary']}")',
  ),
  FrozenCheck(
    'windows/packaging/exe/make_config.yaml',
    'windows_executable',
    'executable_name: ${brand.windowsExecutable}',
  ),
  FrozenCheck(
    'windows/packaging/exe/make_config.yaml',
    'windows_installer_app_id',
    'app_id: ${brand.frozen['windows_installer_app_id']}',
  ),
  FrozenCheck(
    'build_config.yaml',
    'core_name',
    'core_name: ${brand.frozen['core_name']}',
  ),
  FrozenCheck(
    'lib/common/constant.dart',
    'helper_service',
    "const appHelperService = '${brand.frozen['helper_service']}';",
  ),
  FrozenCheck(
    'lib/common/constant.dart',
    'helper_socket',
    "const helperSocketPath = '${brand.frozen['helper_socket']}';",
  ),
  FrozenCheck(
    'lib/common/path.dart',
    'single_instance_lock',
    "'${brand.frozen['single_instance_lock']}'",
  ),
  FrozenCheck(
    'lib/common/protocol.dart',
    'protocol_schemes',
    'const protocolSchemes = [${brand.protocolSchemes.map((s) => "'$s'").join(', ')}];',
  ),
];

String _withoutExtension(String fileName) {
  final index = fileName.lastIndexOf('.');
  return index == -1 ? fileName : fileName.substring(0, index);
}

final class BrandDrift {
  final String path;
  final String detail;

  const BrandDrift(this.path, this.detail);

  @override
  String toString() => '$path: $detail';
}

final class BrandReport {
  final List<BrandDrift> drift;
  final List<BrandDrift> missingEdits;
  final List<BrandDrift> brokenFreezes;

  const BrandReport({
    required this.drift,
    required this.missingEdits,
    required this.brokenFreezes,
  });

  bool get isClean =>
      drift.isEmpty && missingEdits.isEmpty && brokenFreezes.isEmpty;
}

BrandReport inspectBrand(Directory root, Brand brand) {
  final drift = <BrandDrift>[];
  final missing = <BrandDrift>[];
  for (final edit in brandEdits) {
    final file = File(p.join(root.path, edit.path));
    if (!file.existsSync()) {
      missing.add(BrandDrift(edit.path, 'managed file is missing'));
      continue;
    }
    final before = file.readAsStringSync();
    if (!edit.pattern.hasMatch(before)) {
      missing.add(
        BrandDrift(
          edit.path,
          'pattern no longer matches: ${edit.pattern.pattern}',
        ),
      );
      continue;
    }
    final after = edit.applyTo(before, brand);
    if (after != before) {
      drift.add(
        BrandDrift(edit.path, 'value differs from brand "${brand.key}"'),
      );
    }
  }

  final broken = <BrandDrift>[];
  if (brand.published && brand.bundleId != brand.publishedBundleId) {
    broken.add(
      BrandDrift(
        'brands/${brand.key}.yaml',
        'bundle_id ${brand.bundleId} differs from the published '
            '${brand.publishedBundleId}; a shipped application id cannot change',
      ),
    );
  }
  for (final check in frozenChecks(brand)) {
    final file = File(p.join(root.path, check.path));
    if (!file.existsSync()) {
      broken.add(
        BrandDrift(check.path, 'file holding ${check.identifier} is missing'),
      );
      continue;
    }
    if (!file.readAsStringSync().contains(check.needle)) {
      broken.add(
        BrandDrift(check.path, 'frozen ${check.identifier} changed or moved'),
      );
    }
  }

  return BrandReport(
    drift: drift,
    missingEdits: missing,
    brokenFreezes: broken,
  );
}

int applyBrand(Directory root, Brand brand) {
  var written = 0;
  final byPath = <String, List<BrandEdit>>{};
  for (final edit in brandEdits) {
    byPath.putIfAbsent(edit.path, () => []).add(edit);
  }
  byPath.forEach((relative, edits) {
    final file = File(p.join(root.path, relative));
    if (!file.existsSync()) return;
    var content = file.readAsStringSync();
    final before = content;
    for (final edit in edits) {
      content = edit.applyTo(content, brand);
    }
    if (content != before) {
      file.writeAsStringSync(content);
      written++;
    }
  });
  return written;
}

List<String> buildDefines(Brand brand) => [
  '--dart-define=FLY001_APP_NAME=${brand.displayName}',
  '--dart-define=FLY001_REPOSITORY=${brand.repository}',
  '--dart-define=FLY001_SUPPORT_URL=${brand.supportUrl}',
];
