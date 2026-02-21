import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/rss_feed_episode_enclosure.dart';

part 'rss_feed_episode.freezed.dart';
part 'rss_feed_episode.g.dart';

@freezed
sealed class RssFeedEpisode with _$RssFeedEpisode {
  @DurationPreciseSecondsConverter()
  const factory RssFeedEpisode({
    required String id,
    required String title,
    required String description,
    required RssFeedEpisodeEnclosure enclosure,
    required String pubDate,
    required Uri link,
    required String author,
    required bool explicit,
    required Duration duration,
    required String libraryItemId,
    String? episodeId,
    required int trackIndex,
    required String fullPath,
  }) = _RssFeedEpisode;

  factory RssFeedEpisode.fromJson(Map<String, dynamic> json) =>
      _$RssFeedEpisodeFromJson(json);
}
