import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/abs_api/abs_api.dart';

part 'playable_session.freezed.dart';
part 'playable_session.g.dart';

@freezed
sealed class PlayableSession with _$PlayableSession {
  const PlayableSession._();

  const factory PlayableSession({
    required String libraryId,
    required String id,
    required String itemId,
    required String sessionId,
    required Uri cover,
    required String title,
    required String authorName,
    required List<AudioTrack> queue,
    required List<BookChapter> chapters,
    required MediaType type,
    required Duration duration,
  }) = _PlayableSession;

  factory PlayableSession.fromJson(Map<String, dynamic> json) =>
      _$PlayableSessionFromJson(json);

  MediaItem toMediaItem() {
    return MediaItem(
      id: id,
      title: title,
      artist: authorName,
      duration: duration,
      artUri: cover,
    );
  }

  List<AudioSource> toAudioSources(Uri serverUrl) {
    return queue.map((track) {
      return AudioSource.uri(
        serverUrl.resolve(track.contentUrl),
        tag: toMediaItem().copyWith(
          id: '$id${track.index}',
          extras: {
            'start_offset': track.startOffset.inMilliseconds,
            'track_index': queue.indexOf(track),
          },
        ),
      );
    }).toList();
  }
}
