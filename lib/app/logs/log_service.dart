import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

class LogService {
  static final _console = Logger(printer: PrettyPrinter(methodCount: 0));
  static late final ProviderContainer _container;
  static final _box = Hive.box<LogEntry>(logsBox);

  static void init(ProviderContainer container) {
    _container = container;
  }

  static void log(
    String message, {
    String? source,
    LogLevel level = LogLevel.info,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final label = source != null ? '[$source]' : '[Log]';
      _outputToConsole(level, '$label $message', stackTrace);
    }

    final enableHttp = _container.read(enableHttpLogsProvider);

    if (level == .http && !enableHttp) return;
    _box
        .add(
          LogEntry(
            timestamp: DateTime.now(),
            message: message,
            source: source,
            level: level,
            stackTrace: stackTrace?.toString(),
          ),
        )
        .catchError((e) {
          if (kDebugMode) debugPrint('Failed to save log: $e');
          return 0;
        });
  }

  static String _limitLines(String input, {int maxLines = 5}) {
    final lines = input.split('\n');
    if (lines.length <= maxLines) return input;
    return '${lines.take(maxLines).join('\n')}\n... (${lines.length - maxLines} more lines)';
  }

  static void _outputToConsole(LogLevel level, String msg, StackTrace? st) {
    return switch (level) {
      .error => _console.e(msg, stackTrace: st),
      .warning => _console.w(msg),
      .info => _console.i(msg),
      .debug => _console.d(msg),
      .http => _console.i(_limitLines(msg), stackTrace: st),
    };
  }
}
