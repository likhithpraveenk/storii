import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/gen/l10n.dart';

class FakeLogs extends LogsNotifier {
  int logsAdded = 0;

  @override
  Future<void> add(LogEntry entry) async {
    logsAdded++;
  }

  @override
  void clear() {
    logsAdded = 0;
  }
}

late ProviderContainer _logContainer;
bool _initialized = false;

Future<void> initGlobals() async {
  if (_initialized) return;
  _initialized = true;

  l10n = await AppLocalizations.delegate.load(const Locale('en'));

  _logContainer = ProviderContainer(
    overrides: [
      enableHttpLogsProvider.overrideWithValue(false),
      logsProvider.overrideWith(FakeLogs.new),
    ],
  );
  LogService.init(_logContainer);
}

void disposeGlobals() {
  if (!_initialized) return;
  _logContainer.dispose();
  _initialized = false;
}
