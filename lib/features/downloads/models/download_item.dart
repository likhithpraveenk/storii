import 'package:abs_api/abs_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/init.dart';

part 'download_item.freezed.dart';
part 'download_item.g.dart';

enum DownloadStatus {
  queued,
  downloading,
  completed,
  failed,
  paused,
  cancelled,
}

@freezed
sealed class DownloadTrack with _$DownloadTrack {
  const DownloadTrack._();

  const factory DownloadTrack({
    required AudioTrack audioTrack,
    required String localPath,
    required String? ino,
    @Default(0) int bytesReceived,
    @Default(DownloadStatus.queued) DownloadStatus status,
  }) = _DownloadTrack;

  int get bytesTotal => audioTrack.metadata?.size ?? 0;

  factory DownloadTrack.fromJson(Map<String, dynamic> json) =>
      _$DownloadTrackFromJson(json);
}

@freezed
sealed class DownloadItem with _$DownloadItem {
  const DownloadItem._();

  const factory DownloadItem({
    required Uri serverUrl,
    required String libraryItemId,
    required String userId,
    required LibraryItem libraryItem,
    required String title,
    required String author,
    required List<DownloadTrack> tracks,
    @Default(DownloadStatus.queued) DownloadStatus status,
    @Default(0) int totalBytes,
    @Default(0) int receivedBytes,
    DateTime? startedAt,
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadItemFromJson(json);

  double get progress {
    if (totalBytes == 0) return 0;
    return (receivedBytes / totalBytes).clamp(0.0, 1.0);
  }

  bool get isComplete => status == .completed;
  bool get isFailed => status == .failed;
  bool get isActive => status == .downloading;

  bool get isStuck =>
      status == .queued &&
      startedAt != null &&
      DateTime.now().difference(startedAt!).inMinutes > 5;

  int get computedTotalBytes => tracks.fold(0, (s, t) => s + t.bytesTotal);
}

extension DownloadStatusX on DownloadStatus {
  String get label {
    return switch (this) {
      .queued => l10n.queued,
      .paused => l10n.paused,
      .downloading => l10n.downloading,
      .failed => l10n.failed,
      .completed => l10n.completed,
      .cancelled => l10n.cancelled,
    };
  }
}
