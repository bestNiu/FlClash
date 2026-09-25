import 'dart:io';

import 'package:code_assets/code_assets.dart';
import 'package:flutter_rust_bridge_hooks/flutter_rust_bridge_hooks.dart';

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (input.userDefines['build_assets'] == false) {
      stdout.writeln('Skipping the Rust build: user-define build_assets=false');
      return;
    }
    await FlutterRustBridgeNativeAssetsBuilder(
      cratePath: 'rust',
      extraCargoEnvironmentVariables: _bindgenEnvironment(input),
    ).run(input: input, output: output);
  });
}

// rquickjs runs bindgen on Android, which must load the NDK's libclang; Linux
// NDKs before r26 keep it under lib64, later ones and every macOS NDK under lib.
Map<String, String> _bindgenEnvironment(BuildInput input) {
  if (!input.config.buildCodeAssets ||
      input.config.code.targetOS != OS.android) {
    return const {};
  }
  final compiler = input.config.code.cCompiler?.compiler;
  if (compiler == null) {
    return const {};
  }
  final llvmRoot = File.fromUri(compiler).parent.parent;
  for (final name in const ['lib', 'lib64']) {
    final directory = Directory(
      '${llvmRoot.path}${Platform.pathSeparator}$name',
    );
    if (directory.existsSync() && directory.listSync().any(_isLibclang)) {
      return {
        'LIBCLANG_PATH': directory.path,
        'CLANG_PATH': File.fromUri(compiler).path,
        ..._targetClangArgs(input, llvmRoot),
      };
    }
  }
  throw StateError(
    'No libclang under ${llvmRoot.path} (lib or lib64); the NDK Flutter '
    'passed cannot run bindgen for rquickjs',
  );
}

bool _isLibclang(FileSystemEntity entity) {
  return entity.path.split(Platform.pathSeparator).last.startsWith('libclang.');
}

/// Rust and clang spell the 32-bit arm Android triple differently, and clang
/// needs an API level before the NDK headers expose the fixed-width integers.
const _androidTargets = {
  Architecture.arm64: _AndroidTarget(
    rust: 'aarch64-linux-android',
    clang: 'aarch64-linux-android',
    includePrefix: 'aarch64',
  ),
  Architecture.arm: _AndroidTarget(
    rust: 'armv7-linux-androideabi',
    clang: 'armv7a-linux-androideabi',
    includePrefix: 'arm-',
  ),
  Architecture.x64: _AndroidTarget(
    rust: 'x86_64-linux-android',
    clang: 'x86_64-linux-android',
    includePrefix: 'x86_64',
  ),
  Architecture.ia32: _AndroidTarget(
    rust: 'i686-linux-android',
    clang: 'i686-linux-android',
    includePrefix: 'i686',
  ),
};

class _AndroidTarget {
  final String rust;
  final String clang;
  final String includePrefix;

  const _AndroidTarget({
    required this.rust,
    required this.clang,
    required this.includePrefix,
  });
}

// bindgen reads the generic BINDGEN_EXTRA_CLANG_ARGS only when no target scoped
// one exists, and native_toolchain_rust always sets the target scoped one.
Map<String, String> _targetClangArgs(BuildInput input, Directory llvmRoot) {
  final target = _androidTargets[input.config.code.targetArchitecture];
  final sep = Platform.pathSeparator;
  final sysroot = '${llvmRoot.path}${sep}sysroot';
  if (target == null || !Directory(sysroot).existsSync()) return const {};
  final api = input.config.code.android.targetNdkApi;
  final includes = <String>[
    ?_abiIncludeDirectory(sysroot, target.includePrefix),
    for (final name in const ['lib', 'lib64'])
      for (final version in _subDirectories(
        '${llvmRoot.path}$sep$name${sep}clang',
      ))
        '${version.path}${sep}include',
  ].where((path) => Directory(path).existsSync()).toList();
  if (includes.isEmpty) return const {};
  final args = [
    '--target=${target.clang}$api',
    '--sysroot=$sysroot',
    for (final include in includes) '-I$include',
  ].join(' ');
  return {
    'BINDGEN_EXTRA_CLANG_ARGS_${target.rust}': args,
    'BINDGEN_EXTRA_CLANG_ARGS_${target.rust.replaceAll('-', '_')}': args,
  };
}

String? _abiIncludeDirectory(String sysroot, String prefix) {
  final sep = Platform.pathSeparator;
  for (final entry in _subDirectories('$sysroot${sep}usr${sep}include')) {
    if (entry.path.split(sep).last.startsWith(prefix)) return entry.path;
  }
  return null;
}

List<Directory> _subDirectories(String path) {
  final directory = Directory(path);
  if (!directory.existsSync()) return const [];
  return directory.listSync().whereType<Directory>().toList();
}
