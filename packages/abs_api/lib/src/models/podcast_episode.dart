import 'package:abs_api/abs_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_episode.freezed.dart';
part 'podcast_episode.g.dart';

@freezed
sealed class PodcastEpisode with _$PodcastEpisode {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory PodcastEpisode({
    required String libraryItemId,
    required String podcastId,
    required String id,
    int? index,
    String? season,
    String? episode,
    String? episodeType,
    String? title,
    String? subtitle,
    String? description,
    PodcastEpisodeEnclosure? enclosure,
    String? pubDate,
    required AudioFile audioFile,
    DateTime? publishedAt,
    required DateTime addedAt,
    required DateTime updatedAt,
    AudioTrack? audioTrack,
    Duration? duration,
    int? size,
    PodcastMedia? podcast,
  }) = _PodcastEpisode;

  factory PodcastEpisode.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeFromJson(json);
}
