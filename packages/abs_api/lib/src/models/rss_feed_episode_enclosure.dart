import 'package:freezed_annotation/freezed_annotation.dart';

part 'rss_feed_episode_enclosure.freezed.dart';
part 'rss_feed_episode_enclosure.g.dart';

@freezed
sealed class RssFeedEpisodeEnclosure with _$RssFeedEpisodeEnclosure {
  const factory RssFeedEpisodeEnclosure({
    required Uri url,
    required String type,
    required int size,
  }) = _RssFeedEpisodeEnclosure;

  factory RssFeedEpisodeEnclosure.fromJson(Map<String, dynamic> json) =>
      _$RssFeedEpisodeEnclosureFromJson(json);
}
