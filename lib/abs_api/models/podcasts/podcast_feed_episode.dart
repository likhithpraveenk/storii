import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/podcasts/podcast_episode_enclosure.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

part 'podcast_feed_episode.freezed.dart';
part 'podcast_feed_episode.g.dart';

@freezed
sealed class PodcastFeedEpisode with _$PodcastFeedEpisode {
  @DateTimeEpochConverter()
  const factory PodcastFeedEpisode({
    required String title,
    required String subtitle,
    required String description,
    required String descriptionPlain,
    required String pubDate,
    required String episodeType,
    required String season,
    required String episode,
    required String author,
    required String duration,
    required String explicit,
    required DateTime publishedAt,
    required PodcastEpisodeEnclosure enclosure,
  }) = _PodcastFeedEpisode;

  factory PodcastFeedEpisode.fromJson(Map<String, dynamic> json) =>
      _$PodcastFeedEpisodeFromJson(json);
}
