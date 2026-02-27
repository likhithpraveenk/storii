import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';

class LogService {
  static late final ProviderContainer _container;

  static void init(ProviderContainer container) {
    _container = container;
  }

  static void log(
    String message, {
    String? source,
    LogLevel level = LogLevel.debug,
    StackTrace? stackTrace,
  }) {
    final enableHttp = _container.read(enableHttpLogsProvider);
    if (level == .http && !enableHttp) return;
    if (level == .debug && !kDebugMode) return;

    if (kDebugMode) {
      final label = source != null
          ? '[$source]'
          : '[${level.name.toUpperCase()}]';
      _outputToConsole(level, '$label $message', stackTrace);
    }

    _container
        .read(logsProvider.notifier)
        .add(
          LogEntry(
            timestamp: DateTime.now(),
            message: message,
            source: source,
            level: level,
            stackTrace: stackTrace?.toString(),
          ),
        );
  }

  static String _limitLines(String input, {int maxLines = 2}) {
    final lines = input.split('\n');
    if (lines.length <= maxLines) return input;
    return '${lines.take(maxLines).join('\n')}\n... (${lines.length - maxLines} more lines)';
  }

  static void _outputToConsole(LogLevel level, String msg, StackTrace? st) {
    final int severity = switch (level) {
      LogLevel.error => 1000,
      LogLevel.warning => 900,
      LogLevel.info || LogLevel.http => 800,
      LogLevel.debug => 500,
    };

    dev.log(
      level == LogLevel.http ? _limitLines(msg) : msg,
      name: level.name.toUpperCase(),
      level: severity,
      stackTrace: st,
    );
  }
}
