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
  static const _boxKey = 'logs_list';
  static const _logsCutOff = Duration(days: 1);

  @override
  List<LogEntry> build() {
    final raw = logsBox.get(_boxKey);
    if (raw == null) return [];
    final cutoff = DateTime.now().subtract(_logsCutOff);
    try {
      final decoded = jsonDecode(raw) as List;
      final list =
          decoded
              .map(_parseLog)
              .whereType<LogEntry>()
              .where((e) => e.timestamp.isAfter(cutoff))
              .toList()
            ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

      if (list.length != decoded.length) {
        Future.microtask(_persist);
      }
      return list;
    } catch (_) {
      return [];
    }
  }

  LogEntry? _parseLog(dynamic e) {
    try {
      return LogEntry.fromJson(e as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  void add(LogEntry entry) {
    state = [entry, ...state];
    unawaited(_persist());
  }

  Future<void> _persist() async {
    final encoded = jsonEncode(state.map((e) => e.toJson()).toList());
    await logsBox.put(_boxKey, encoded);
  }

  Future<void> clear() async {
    state = [];
    await logsBox.delete(_boxKey);
  }
}

final logFilterProvider = StateProvider<Set<LogLevel>>((ref) {
  return LogLevel.values.toSet();
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
