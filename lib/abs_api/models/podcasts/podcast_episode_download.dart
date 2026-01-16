import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

part 'podcast_episode_download.freezed.dart';
part 'podcast_episode_download.g.dart';

@freezed
sealed class PodcastEpisodeDownload with _$PodcastEpisodeDownload {
  @DateTimeEpochConverter()
  const factory PodcastEpisodeDownload({
    required String id,
    required String episodeDisplayTitle,
    required Uri url,
    required String libraryItemId,
    required bool isDownloading,
    required bool isFinished,
    required bool failed,
    DateTime? startedAt,
    required DateTime createdAt,
    DateTime? finishedAt,
  }) = _PodcastEpisodeDownload;

  factory PodcastEpisodeDownload.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeDownloadFromJson(json);
}
