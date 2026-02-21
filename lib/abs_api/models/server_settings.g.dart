// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerSettings _$ServerSettingsFromJson(
  Map<String, dynamic> json,
) => _ServerSettings(
  id: json['id'] as String?,
  scannerFindCovers: json['scannerFindCovers'] as bool?,
  scannerParseSubtitle: json['scannerParseSubtitle'] as bool?,
  scannerPreferMatchedMetadata: json['scannerPreferMatchedMetadata'] as bool?,
  scannerDisableWatcher: json['scannerDisableWatcher'] as bool?,
  storeCoverWithItem: json['storeCoverWithItem'] as bool?,
  storeMetadataWithItem: json['storeMetadataWithItem'] as bool?,
  metadataFileFormat: json['metadataFileFormat'] as String?,
  rateLimitLoginRequests: (json['rateLimitLoginRequests'] as num?)?.toInt(),
  rateLimitLoginWindow: _$JsonConverterFromJson<int, Duration>(
    json['rateLimitLoginWindow'],
    const DurationMsConverter().fromJson,
  ),
  backupsToKeep: (json['backupsToKeep'] as num?)?.toInt(),
  maxBackupSize: (json['maxBackupSize'] as num?)?.toInt(),
  loggerDailyLogsToKeep: (json['loggerDailyLogsToKeep'] as num?)?.toInt(),
  loggerScannerLogsToKeep: (json['loggerScannerLogsToKeep'] as num?)?.toInt(),
  homeBookshelfView: _$JsonConverterFromJson<int, bool>(
    json['homeBookshelfView'],
    const BoolBinaryConverter().fromJson,
  ),
  bookshelfView: _$JsonConverterFromJson<int, bool>(
    json['bookshelfView'],
    const BoolBinaryConverter().fromJson,
  ),
  sortingIgnorePrefix: json['sortingIgnorePrefix'] as bool?,
  sortingPrefixes: (json['sortingPrefixes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  chromecastEnabled: json['chromecastEnabled'] as bool?,
  dateFormat: json['dateFormat'] as String?,
  language: json['language'] as String?,
  logLevel: $enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
  version: json['version'] as String?,
);

Map<String, dynamic> _$ServerSettingsToJson(_ServerSettings instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'scannerFindCovers': ?instance.scannerFindCovers,
      'scannerParseSubtitle': ?instance.scannerParseSubtitle,
      'scannerPreferMatchedMetadata': ?instance.scannerPreferMatchedMetadata,
      'scannerDisableWatcher': ?instance.scannerDisableWatcher,
      'storeCoverWithItem': ?instance.storeCoverWithItem,
      'storeMetadataWithItem': ?instance.storeMetadataWithItem,
      'metadataFileFormat': ?instance.metadataFileFormat,
      'rateLimitLoginRequests': ?instance.rateLimitLoginRequests,
      'rateLimitLoginWindow': ?_$JsonConverterToJson<int, Duration>(
        instance.rateLimitLoginWindow,
        const DurationMsConverter().toJson,
      ),
      'backupsToKeep': ?instance.backupsToKeep,
      'maxBackupSize': ?instance.maxBackupSize,
      'loggerDailyLogsToKeep': ?instance.loggerDailyLogsToKeep,
      'loggerScannerLogsToKeep': ?instance.loggerScannerLogsToKeep,
      'homeBookshelfView': ?_$JsonConverterToJson<int, bool>(
        instance.homeBookshelfView,
        const BoolBinaryConverter().toJson,
      ),
      'bookshelfView': ?_$JsonConverterToJson<int, bool>(
        instance.bookshelfView,
        const BoolBinaryConverter().toJson,
      ),
      'sortingIgnorePrefix': ?instance.sortingIgnorePrefix,
      'sortingPrefixes': ?instance.sortingPrefixes,
      'chromecastEnabled': ?instance.chromecastEnabled,
      'dateFormat': ?instance.dateFormat,
      'language': ?instance.language,
      'logLevel': ?_$LogLevelEnumMap[instance.logLevel],
      'version': ?instance.version,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$LogLevelEnumMap = {
  LogLevel.debug: 0,
  LogLevel.info: 1,
  LogLevel.warning: 2,
  LogLevel.error: 3,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
