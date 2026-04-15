import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/l10n/l10n.dart';

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
    @Default(0) int bytesReceived,
    @Default(DownloadStatus.queued) DownloadStatus status,
  }) = _DownloadTrack;

  int get bytesTotal => audioTrack.metadata.size;

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
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadItemFromJson(json);

  double get progress {
    if (totalBytes == 0) return 0;
    return (receivedBytes / totalBytes).clamp(0.0, 1.0);
  }

  bool get isComplete => status == .completed;
  bool get isFailed => status == .failed;
  bool get isActive => status == .downloading || status == .queued;
}

extension DownloadStatusX on DownloadStatus {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .queued => l.queued,
      .paused => l.paused,
      .downloading => l.downloading,
      .failed => l.failed,
      .completed => l.completed,
      .cancelled => l.cancelled,
    };
  }
}
