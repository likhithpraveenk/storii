import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/rss_feed_episode.dart';
import 'package:abs_api/src/models/rss_feed_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rss_feed.freezed.dart';
part 'rss_feed.g.dart';

@freezed
sealed class RssFeed with _$RssFeed {
  @DateTimeEpochConverter()
  const factory RssFeed({
    required String id,
    required String entityId,
    required String entityType,
    required Uri feedUrl,
    String? slug,
    String? userId,
    String? coverPath,
    Uri? serverAddress,
    RssFeedMetadata? meta,
    List<RssFeedEpisode>? episodes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RssFeed;

  factory RssFeed.fromJson(Map<String, dynamic> json) =>
      _$RssFeedFromJson(json);
}
