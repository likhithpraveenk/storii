import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

enum LogLevel { http, debug, info, warning, error }

@freezed
sealed class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required String message,
    required LogLevel level,
    String? source,
    String? stackTrace,
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
}
