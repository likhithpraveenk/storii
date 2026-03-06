import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/abs_api/abs_api.dart';

extension PlaybackSessionX on PlaybackSession {
  List<AudioSource> toAudioSources(Uri serverUrl, String? token) {
    final coverUri = serverUrl
        .resolve(ApiRoutes.itemCover(libraryItemId))
        .replace(queryParameters: {'raw': '1'});
    Duration accumulated = Duration.zero;
    final sources = <AudioSource>[];

    for (final track in audioTracks ?? []) {
      final startOffset = accumulated;
      accumulated += track.duration;
      sources.add(
        AudioSource.uri(
          serverUrl.resolve(track.contentUrl),
          headers: {'Authorization': 'Bearer $token'},
          tag: MediaItem(
            id: track.contentUrl,
            title: displayTitle,
            artist: displayAuthor,
            duration: track.duration,
            artUri: coverUri,
            extras: {
              'startOffset': startOffset.inMicroseconds,
              'totalDuration': duration.inMicroseconds,
              'itemId': libraryItemId,
              'trackIndex': '${track.index}',
              if (mediaType == .podcast) 'episodeId': episodeId,
            },
          ),
        ),
      );
    }
    return sources;
  }

  (int, Duration) getIndexAndOffset() {
    var accumulated = Duration.zero;
    final tracks = audioTracks ?? [];
    for (var i = 0; i < tracks.length; i++) {
      final trackLen = tracks[i].duration;
      if (currentTime < accumulated + trackLen) {
        return (i, currentTime - accumulated);
      }
      accumulated += trackLen;
    }
    return (0, Duration.zero);
  }
}
