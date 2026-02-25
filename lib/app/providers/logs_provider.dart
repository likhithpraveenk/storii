import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'logs_provider.g.dart';

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  final _box = Hive.box<LogEntry>(logsBox);

  @override
  Stream<List<LogEntry>> build() {
    return _box
        .watch()
        .map((_) => _box.values.toList())
        .startWith(_box.values.toList());
  }

  Future<void> add(LogEntry entry) async {
    await _box.add(entry);
    await _pruneOldest();
  }

  Future<void> _pruneOldest() async {
    final maxLogs = ref.read(maxLogsProvider);
    if (_box.length > maxLogs) {
      if (_box.length == maxLogs + 1) {
        await _box.deleteAt(0);
      } else {
        await _trimToMax(maxLogs);
      }
    }
  }

  Future<void> setMaxLogs(int newMax) async {
    await ref.read(appSettingsProvider.notifier).setMaxLogs(newMax);
    await _trimToMax(newMax);
  }

  Future<void> _trimToMax(int maxLogs) async {
    final currentLength = _box.length;
    if (currentLength > maxLogs) {
      final deleteCount = currentLength - maxLogs;
      final keysToDelete = _box.keys.take(deleteCount).toList();
      await _box.deleteAll(keysToDelete);
    }
  }

  Future<void> deleteAll() async => await _box.clear();
}

final logFilterProvider = StateProvider<Set<LogLevel>>((ref) {
  return LogLevel.values.toSet();
});

final filteredLogsProvider = Provider<List<LogEntry>>((ref) {
  final allLogs = ref.watch(logsProvider).value ?? [];
  final activeFilters = ref.watch(logFilterProvider);

  return allLogs.where((entry) => activeFilters.contains(entry.level)).toList();
});
