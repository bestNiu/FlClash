import 'dart:io';

import 'package:args/args.dart';

import 'src/brand/brand.dart';

const _usage = '''
Usage: dart run tool/brand.dart <command> [--brand <key>]

Commands:
  list      Print the available brand profiles
  show      Print the resolved values of a brand
  check     Fail when the tree does not match the brand (CI gate)
  apply     Rewrite every managed file to match the brand
  defines   Print the flutter --dart-define arguments for the brand
''';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('brand', abbr: 'b', help: 'Brand key under brands/')
    ..addFlag('help', negatable: false, abbr: 'h');

  if (arguments.isEmpty ||
      arguments.contains('--help') ||
      arguments.contains('-h')) {
    stdout.write(_usage);
    stdout.writeln(parser.usage);
    exit(arguments.isEmpty ? 1 : 0);
  }

  final command = arguments.first;
  final results = parser.parse(arguments.skip(1).toList());
  final root = _repositoryRoot();
  final key = Brand.resolveKey(root, requested: results['brand'] as String?);
  final brand = Brand.load(root, key);

  switch (command) {
    case 'list':
      for (final available in Brand.availableKeys(root)) {
        stdout.writeln(available == key ? '$available (active)' : available);
      }
    case 'show':
      stdout
        ..writeln('key:              ${brand.key}')
        ..writeln('display_name:     ${brand.displayName}')
        ..writeln('artifact_prefix:  ${brand.artifactPrefix}')
        ..writeln('publisher:        ${brand.publisher}')
        ..writeln(
          'maintainer:       ${brand.maintainerName} <${brand.maintainerEmail}>',
        )
        ..writeln('repository:       ${brand.repository}')
        ..writeln('publisher_url:    ${brand.publisherUrl}')
        ..writeln('support_url:      ${brand.supportUrl}')
        ..writeln('bundle id:        ${brand.bundleId}')
        ..writeln('debug bundle id:  ${brand.debugBundleId}')
        ..writeln('published:        ${brand.published}')
        ..writeln('app bundle:       ${brand.appBundleName}')
        ..writeln('windows exe:      ${brand.windowsExecutable}')
        ..writeln('schemes:          ${brand.protocolSchemes.join(', ')}');
    case 'check':
      final report = inspectBrand(root, brand);
      if (report.isClean) {
        stdout.writeln('brand "${brand.key}" matches the tree');
        exit(0);
      }
      stderr.writeln('brand "${brand.key}" does not match the tree:');
      for (final item in report.drift) {
        stderr.writeln('  drift   ${item.path}: ${item.detail}');
      }
      for (final item in report.missingEdits) {
        stderr.writeln('  stale   ${item.path}: ${item.detail}');
      }
      for (final item in report.brokenFreezes) {
        stderr.writeln('  frozen  ${item.path}: ${item.detail}');
      }
      stderr.writeln(
        'run: dart run tool/brand.dart apply --brand ${brand.key}',
      );
      exit(1);
    case 'apply':
      final written = applyBrand(root, brand);
      final report = inspectBrand(root, brand);
      stdout.writeln('applied brand "${brand.key}" to $written file(s)');
      for (final item in [...report.missingEdits, ...report.brokenFreezes]) {
        stderr.writeln('  ${item.path}: ${item.detail}');
      }
      exit(report.missingEdits.isEmpty && report.brokenFreezes.isEmpty ? 0 : 1);
    case 'defines':
      for (final define in buildDefines(brand)) {
        stdout.writeln(define);
      }
    default:
      stderr.writeln('unknown command: $command\n');
      stderr.write(_usage);
      exit(64);
  }
}

Directory _repositoryRoot() {
  var directory = Directory.current;
  while (true) {
    if (Directory('${directory.path}/brands').existsSync()) return directory;
    final parent = directory.parent;
    if (parent.path == directory.path) {
      stderr.writeln(
        'no brands/ directory found above ${Directory.current.path}',
      );
      exit(66);
    }
    directory = parent;
  }
}
