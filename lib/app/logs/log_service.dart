import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/storage/drift/database.dart';

class LogService {
  static late final AppDatabase _db;
  static final _console = Logger(printer: PrettyPrinter(methodCount: 0));
  static bool enableHttpLogs = false;

  static void init(AppDatabase db) {
    _db = db;
    _setupGlobalHandlers();
  }

  static void log(
    String message, {
    String? source,
    LogLevelDomain level = LogLevelDomain.info,
    StackTrace? stackTrace,
  }) async {
    if (level == .http && !enableHttpLogs) return;

    if (kDebugMode) {
      final label = source != null ? '[$source]' : '[Log]';
      _outputToConsole(level, '$label $message', stackTrace);
    }

    try {
      await _db.managers.appLogs.create(
        (_) => LogEntry(
          timestamp: DateTime.now(),
          message: message,
          source: source,
          level: level,
          stackTrace: stackTrace?.toString(),
        ).toInsertable(),
      );
    } catch (_) {}
  }

  static String _limitLines(String input, {int maxLines = 20}) {
    final lines = input.split('\n');
    if (lines.length <= maxLines) return input;
    return '${lines.take(maxLines).join('\n')}\n... (${lines.length - maxLines} more lines)';
  }

  static void _outputToConsole(
    LogLevelDomain level,
    String msg,
    StackTrace? st,
  ) {
    return switch (level) {
      .error => _console.e(msg, stackTrace: st),
      .warning => _console.w(msg),
      .info => _console.i(msg),
      .debug => _console.d(msg),
      .http => _console.i(_limitLines(msg), stackTrace: st),
    };
  }

  static void _setupGlobalHandlers() {
    FlutterError.onError = (details) => log(
      details.exceptionAsString(),
      level: .error,
      source: 'Flutter',
      stackTrace: details.stack,
    );

    PlatformDispatcher.instance.onError = (e, s) {
      log(e.toString(), level: .error, source: 'Platform', stackTrace: s);
      return true;
    };
  }
}
