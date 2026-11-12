import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'logs_provider.g.dart';

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  static const _boxKey = 'logs_list';
  static const _logsCutOff = Duration(days: 1);

  LazyBox<String> get _box => Hive.lazyBox(logsBoxName);

  @override
  Future<List<LogEntry>> build() async {
    final raw = await _box.get(_boxKey);
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
        unawaited(_persist(list));
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

  Future<void> add(LogEntry entry) async {
    final current = await future;
    final next = [entry, ...current];
    state = AsyncData(next);
    unawaited(_persist(next));
  }

  Future<void> _persist(List<LogEntry> logs) {
    final encoded = jsonEncode(logs.map((e) => e.toJson()).toList());
    return _box.put(_boxKey, encoded);
  }

  Future<void> clear() async {
    state = const AsyncData([]);
    await _box.delete(_boxKey);
  }
}

final logFilterProvider = StateProvider<Set<LogLevel>>((ref) {
  return LogLevel.values.toSet();
}, name: 'logFilterProvider');

@riverpod
Future<List<LogEntry>> filteredLogs(Ref ref) async {
  final allLogs = await ref.watch(logsProvider.future);
  final activeFilters = ref.watch(logFilterProvider);

  return allLogs.where((entry) => activeFilters.contains(entry.level)).toList();
}
