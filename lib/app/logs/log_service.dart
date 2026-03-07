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
          ? '[$source] [${level.name.toUpperCase()}]'
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

  static void _outputToConsole(LogLevel level, String msg, StackTrace? st) {
    final int severity = switch (level) {
      .error => 1000,
      .warning => 900,
      .info || .http => 800,
      .debug => 500,
    };

    dev.log(msg, name: 'log', level: severity, stackTrace: st);
  }
}
