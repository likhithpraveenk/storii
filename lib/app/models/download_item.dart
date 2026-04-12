import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_item.freezed.dart';
part 'download_item.g.dart';

enum DownloadStatus { queued, downloading, complete, failed, paused }

@freezed
sealed class DownloadTrack with _$DownloadTrack {
  const factory DownloadTrack({
    required int index,
    required String contentUrl,
    required String localPath,
    required String mimeType,
    @Default(0) int bytesReceived,
    @Default(0) int bytesTotal,
    @Default(DownloadStatus.queued) DownloadStatus status,
  }) = _DownloadTrack;

  factory DownloadTrack.fromJson(Map<String, dynamic> json) =>
      _$DownloadTrackFromJson(json);
}

@freezed
sealed class DownloadItem with _$DownloadItem {
  const DownloadItem._();

  const factory DownloadItem({
    required String libraryItemId,
    required String title,
    required String author,
    required List<DownloadTrack> tracks,
    @Default(DownloadStatus.queued) DownloadStatus status,
    @Default(0) int totalBytes,
    @Default(0) int receivedBytes,
    DateTime? startedAt,
    DateTime? completedAt,
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadItemFromJson(json);

  double get progress {
    if (totalBytes == 0) return 0;
    return (receivedBytes / totalBytes).clamp(0.0, 1.0);
  }

  bool get isComplete => status == .complete;
  bool get isFailed => status == .failed;
  bool get isActive => status == .downloading || status == .queued;
}
