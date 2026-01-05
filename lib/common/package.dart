import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import 'common.dart';

extension PackageInfoExtension on PackageInfo {
  // User-Agent 必须使用 ASCII 字符，不能包含中文
  String get ua => [
        'FlClash/v$version',
        'clash-verge',
        'Platform/${Platform.operatingSystem}',
      ].join(' ');
}
