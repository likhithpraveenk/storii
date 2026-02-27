import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';

part 'playable_item.freezed.dart';
part 'playable_item.g.dart';

@freezed
sealed class PlayableItem with _$PlayableItem {
  const PlayableItem._();

  const factory PlayableItem.audiobook({
    required String libraryId,
    required String id,
    required String sessionId,
    required Uri cover,
    String? title,
    String? authorName,
    required List<AudioTrack> tracks,
    required List<BookChapter> chapters,
    required Duration duration,
  }) = AudiobookItem;

  const factory PlayableItem.podcast({
    required String libraryId,
    required String id, // episodeId
    required String podcastId,
    required String sessionId,
    String? title,
    String? authorName,
    String? podcastTitle,
    required Uri cover,
    required List<AudioTrack> tracks,
    required Duration duration,
  }) = PodcastItem;

  factory PlayableItem.fromJson(Map<String, dynamic> json) =>
      _$PlayableItemFromJson(json);
}
