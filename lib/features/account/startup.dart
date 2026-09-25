import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';

import 'panel_models.dart';

typedef PanelAccountRestore = Future<PanelAccount?> Function();

Future<void> restorePanelAccount(PanelAccountRestore restore) async {
  try {
    await restore();
  } catch (_) {
    commonPrint.log('Panel account restore failed', logLevel: LogLevel.warning);
  }
}
