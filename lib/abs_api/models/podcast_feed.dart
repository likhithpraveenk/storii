import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/podcast_feed_episode.dart';
import 'package:storii/abs_api/models/podcast_feed_metadata.dart';

part 'podcast_feed.freezed.dart';
part 'podcast_feed.g.dart';

@freezed
sealed class PodcastFeed with _$PodcastFeed {
  const factory PodcastFeed({
    required PodcastFeedMetadata metadata,
    List<PodcastFeedEpisode>? episodes,
  }) = _PodcastFeed;

  factory PodcastFeed.fromJson(Map<String, dynamic> json) =>
      _$PodcastFeedFromJson(json);
}
