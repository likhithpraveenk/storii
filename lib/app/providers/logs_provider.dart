import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'logs_provider.g.dart';

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  static const int _maxLogs = 500;

  @override
  List<LogEntry> build() {
    final entries = <LogEntry>[];
    for (final value in logsBox.values) {
      try {
        entries.add(LogEntry.fromJson(jsonDecode(value)));
      } catch (_) {}
    }
    entries.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return entries;
  }

  void add(LogEntry entry) {
    final updated = [entry, ...state];
    if (updated.length > _maxLogs) {
      updated.removeRange(_maxLogs, updated.length);
    }
    state = updated;
    unawaited(_persist(updated));
  }

  Future<void> _persist(List<LogEntry> entries) async {
    await logsBox.clear();
    for (final entry in entries) {
      await logsBox.put(
        entry.timestamp.millisecondsSinceEpoch.toString(),
        jsonEncode(entry),
      );
    }
  }

  void clear() {
    state = [];
    unawaited(logsBox.clear());
  }
}

final logFilterProvider = StateProvider<Set<LogLevel>>((ref) {
  return LogLevel.values.toSet()..remove(LogLevel.debug);
}, name: 'logFilterProvider');

final filteredLogsProvider = Provider<List<LogEntry>>((ref) {
  final allLogs = ref.watch(logsProvider);
  final activeFilters = ref.watch(logFilterProvider);

  return allLogs.where((entry) => activeFilters.contains(entry.level)).toList();
}, name: 'filteredLogsProvider');

final errorLogsProvider = Provider<List<LogEntry>>((ref) {
  final allLogs = ref.watch(logsProvider);
  return allLogs.where((entry) => entry.level == .error).toList();
}, name: 'errorLogsProvider');
