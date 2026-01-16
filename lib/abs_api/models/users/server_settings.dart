import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

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
    LogLevel? logLevel,
    String? version,
  }) = _ServerSettings;

  factory ServerSettings.fromJson(Map<String, dynamic> json) =>
      _$ServerSettingsFromJson(json);
}
