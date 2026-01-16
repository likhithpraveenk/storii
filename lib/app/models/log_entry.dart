import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';

enum LogLevelDomain { info, warning, error }

@freezed
sealed class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required String message,
    required LogLevelDomain level,
    String? source,
    String? stackTrace,
  }) = _LogEntry;
}
