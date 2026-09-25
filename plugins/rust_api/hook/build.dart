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

const _androidTriples = {
  Architecture.arm64: 'aarch64-linux-android',
  Architecture.arm: 'armv7-linux-androideabi',
  Architecture.x64: 'x86_64-linux-android',
  Architecture.ia32: 'i686-linux-android',
};

// bindgen reads the generic BINDGEN_EXTRA_CLANG_ARGS only when no target scoped
// one exists, and native_toolchain_rust always sets the target scoped one.
Map<String, String> _targetClangArgs(BuildInput input, Directory llvmRoot) {
  final architecture = input.config.code.targetArchitecture;
  final triple = _androidTriples[architecture];
  final sep = Platform.pathSeparator;
  final sysroot = '${llvmRoot.path}${sep}sysroot';
  if (triple == null || !Directory(sysroot).existsSync()) return const {};
  final abiInclude = _abiIncludeDirectory(sysroot, architecture);
  final includes = <String>[
    ?abiInclude,
    for (final name in const ['lib', 'lib64'])
      for (final version in _subDirectories(
        '${llvmRoot.path}$sep$name${sep}clang',
      ))
        '${version.path}${sep}include',
  ].where((path) => Directory(path).existsSync()).toList();
  if (includes.isEmpty) return const {};
  final args = [
    '--sysroot=$sysroot',
    for (final include in includes) '-I$include',
  ].join(' ');
  return {
    'BINDGEN_EXTRA_CLANG_ARGS_$triple': args,
    'BINDGEN_EXTRA_CLANG_ARGS_${triple.replaceAll('-', '_')}': args,
  };
}

/// The NDK names per-ABI headers after the clang triple, not the Rust one.
String? _abiIncludeDirectory(String sysroot, Architecture architecture) {
  final prefix = switch (architecture) {
    Architecture.arm64 => 'aarch64',
    Architecture.arm => 'arm-',
    Architecture.x64 => 'x86_64',
    Architecture.ia32 => 'i686',
    _ => null,
  };
  if (prefix == null) return null;
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
