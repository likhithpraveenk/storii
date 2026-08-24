import 'package:abs_api/src/models/library_item.dart';
import 'package:abs_api/src/models/podcast_episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist_item.freezed.dart';
part 'playlist_item.g.dart';

@freezed
sealed class PlaylistItem with _$PlaylistItem {
  const factory PlaylistItem({
    required String libraryItemId,
    String? episodeId,
    PodcastEpisode? episode,
    LibraryItem? libraryItem,
  }) = _PlaylistItem;

  factory PlaylistItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemFromJson(json);
}
