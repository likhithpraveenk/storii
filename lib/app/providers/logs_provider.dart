import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/drift/database.dart';

part 'logs_provider.g.dart';

final consoleLogger = Logger();

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<List<LogEntry>> build() {
    ref.listen<Duration>(logRetentionProvider, (prev, next) {
      if (prev != next) _pruneOldLogs(next);
    });

    final retention = ref.read(logRetentionProvider);
    Future.microtask(() => _pruneOldLogs(retention));

    return _db.managers.appLogs.orderBy((o) => o.timestamp.desc()).watch();
  }

  Future<void> _pruneOldLogs(Duration retention) async {
    final cutoff = DateTime.now().subtract(retention);

    await _db.managers.appLogs
        .filter((f) => f.timestamp.isBefore(cutoff))
        .delete();
  }

  Future<void> log(
    String message, {
    String? source,
    LogLevel level = .info,
    String? stackTrace,
  }) async {
    try {
      await _db.managers.appLogs.create(
        (_) => LogEntry(
          timestamp: DateTime.now(),
          message: message,
          source: source,
          level: level,
          stackTrace: stackTrace,
        ).toInsertable(),
      );
    } catch (_) {}
  }

  Future<int> clear() => _db.managers.appLogs.delete();

  void initGlobalErrorHandling() {
    try {
      FlutterError.onError = (details) {
        log(
          details.exceptionAsString(),
          level: .error,
          source: 'FlutterError',
          stackTrace: details.stack?.toLimitedString(),
        );
        if (kDebugMode) {
          consoleLogger.f(
            'Flutter Error',
            error: details.exception,
            stackTrace: details.stack,
          );
        }
      };

      PlatformDispatcher.instance.onError = (e, s) {
        log(
          e.toString(),
          level: .error,
          stackTrace: s.toLimitedString(),
          source: 'PlatformDispatcher',
        );
        if (kDebugMode) {
          consoleLogger.f('PlatformDispatcher', error: e, stackTrace: s);
        }
        return true;
      };
    } catch (_) {}
  }
}
