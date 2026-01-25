import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/drift/database.dart';

part 'logs_provider.g.dart';

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<List<LogEntry>> build() {
    final retention = ref.watch(logRetentionProvider);
    _pruneOldLogs(retention);
    final enableHttpLogs = ref.watch(enableHttpLogsProvider);
    LogService.enableHttpLogs = enableHttpLogs;

    return _db.managers.appLogs.orderBy((log) => log.timestamp.desc()).watch();
  }

  Future<void> _pruneOldLogs(Duration retention) async {
    final cutoff = DateTime.now().subtract(retention);

    await _db.managers.appLogs
        .filter((f) => f.timestamp.isBefore(cutoff))
        .delete();
  }

  Future<int> clear() => _db.managers.appLogs.delete();
}

final logFilterProvider = StateProvider<Set<LogLevelDomain>>((ref) {
  return LogLevelDomain.values.toSet();
});
