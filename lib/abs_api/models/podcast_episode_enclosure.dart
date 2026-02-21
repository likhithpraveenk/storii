import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_episode_enclosure.freezed.dart';
part 'podcast_episode_enclosure.g.dart';

@freezed
sealed class PodcastEpisodeEnclosure with _$PodcastEpisodeEnclosure {
  const factory PodcastEpisodeEnclosure({
    required Uri url,
    required String type,
    required String length,
  }) = _PodcastEpisodeEnclosure;

  factory PodcastEpisodeEnclosure.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeEnclosureFromJson(json);
}
