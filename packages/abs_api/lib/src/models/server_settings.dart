import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_settings.freezed.dart';
part 'server_settings.g.dart';

@freezed
sealed class ServerSettings with _$ServerSettings {
  const factory ServerSettings({
    String? id,
    bool? scannerFindCovers,
    bool? scannerParseSubtitle,
    bool? scannerPreferMatchedMetadata,
    bool? scannerDisableWatcher,
    bool? storeCoverWithItem,
    bool? storeMetadataWithItem,
    String? metadataFileFormat,
    int? rateLimitLoginRequests,
    @DurationMsConverter() Duration? rateLimitLoginWindow,
    int? backupsToKeep,
    int? maxBackupSize,
    int? loggerDailyLogsToKeep,
    int? loggerScannerLogsToKeep,
    @BoolBinaryConverter() bool? homeBookshelfView,
    @BoolBinaryConverter() bool? bookshelfView,
    bool? sortingIgnorePrefix,
    List<String>? sortingPrefixes,
    bool? chromecastEnabled,
    String? dateFormat,
    String? language,
    ServerLogLevel? logLevel,
    String? version,
  }) = _ServerSettings;

  factory ServerSettings.fromJson(Map<String, dynamic> json) =>
      _$ServerSettingsFromJson(json);
}
