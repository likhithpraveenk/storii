// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => _LogEntry(
  timestamp: DateTime.parse(json['timestamp'] as String),
  message: json['message'] as String,
  level: $enumDecode(_$LogLevelEnumMap, json['level']),
  source: json['source'] as String?,
  stackTrace: json['stackTrace'] as String?,
);

Map<String, dynamic> _$LogEntryToJson(_LogEntry instance) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'message': instance.message,
  'level': _$LogLevelEnumMap[instance.level]!,
  'source': ?instance.source,
  'stackTrace': ?instance.stackTrace,
};

const _$LogLevelEnumMap = {
  LogLevel.http: 'http',
  LogLevel.debug: 'debug',
  LogLevel.info: 'info',
  LogLevel.warning: 'warning',
  LogLevel.error: 'error',
};
