import 'package:abs_api/src/models/audio_file.dart';
import 'package:abs_api/src/models/audio_track.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/podcast_episode_enclosure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_episode.freezed.dart';
part 'podcast_episode.g.dart';

@freezed
sealed class PodcastEpisode with _$PodcastEpisode {
  @DateTimeEpochConverter()
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
    required DateTime publishedAt,
    required DateTime addedAt,
    required DateTime updatedAt,
    required AudioTrack audioTrack,
    required Duration duration,
    int? size,
  }) = _PodcastEpisode;

  factory PodcastEpisode.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeFromJson(json);
}
