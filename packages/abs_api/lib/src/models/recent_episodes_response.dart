import 'package:abs_api/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_episodes_response.freezed.dart';
part 'recent_episodes_response.g.dart';

@freezed
sealed class RecentEpisodesResponse with _$RecentEpisodesResponse {
  const factory RecentEpisodesResponse({
    required List<PodcastEpisode> episodes,
    required int limit,
    required int page,
  }) = _RecentEpisodesResponse;

  factory RecentEpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentEpisodesResponseFromJson(json);
}
