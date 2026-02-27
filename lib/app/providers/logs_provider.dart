import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/log_entry.dart';

part 'logs_provider.g.dart';

@Riverpod(keepAlive: true)
class LogsNotifier extends _$LogsNotifier {
  final List<LogEntry> _logs = [];
  static const int _maxLogs = 1000;

  @override
  List<LogEntry> build() {
    return [];
  }

  void add(LogEntry entry) {
    _logs.insert(0, entry);

    if (_logs.length > _maxLogs) {
      _logs.removeLast();
    }

    state = List.from(_logs);
  }

  void clear() {
    _logs.clear();
    state = [];
  }
}

final logFilterProvider = StateProvider<Set<LogLevel>>((ref) {
  return LogLevel.values.toSet();
});

final filteredLogsProvider = Provider<List<LogEntry>>((ref) {
  final allLogs = ref.watch(logsProvider);
  final activeFilters = ref.watch(logFilterProvider);

  return allLogs.where((entry) => activeFilters.contains(entry.level)).toList();
});
