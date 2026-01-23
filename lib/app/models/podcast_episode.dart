import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/audio_track.dart';

part 'podcast_episode.freezed.dart';
part 'podcast_episode.g.dart';

@freezed
sealed class PodcastEpisodeDomain with _$PodcastEpisodeDomain {
  const factory PodcastEpisodeDomain({
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
    String? pubDate,
    required DateTime publishedAt,
    required DateTime addedAt,
    required DateTime updatedAt,
    required AudioTrackDomain audioTrack,
    required Duration duration,
    int? size,
  }) = _PodcastEpisodeDomain;

  factory PodcastEpisodeDomain.fromJson(Map<String, dynamic> json) =>
      _$PodcastEpisodeDomainFromJson(json);
}
