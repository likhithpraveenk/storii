import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/audio/audio_file.dart';
import 'package:storii/api/models/audio/audio_track.dart';
import 'package:storii/api/models/podcasts/podcast_episode_enclosure.dart';
import 'package:storii/api/models/utils/json_converters.dart';

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
    AudioTrack? audioTrack,
    Duration? duration,
    int? size,
  }) = _PodcastEpisode;

  factory PodcastEpisode.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeFromJson(json);
}
