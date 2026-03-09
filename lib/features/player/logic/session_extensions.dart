import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/chapter.dart';

extension PlaybackSessionX on PlaybackSession {
  List<AudioSource> toAudioSources(Uri serverUrl, String? token) {
    final coverUri = serverUrl
        .resolve(ApiRoutes.itemCover(libraryItemId))
        .replace(queryParameters: {'raw': '1'});
    Duration accumulated = Duration.zero;
    final sources = <AudioSource>[];

    for (final (index, track) in (audioTracks ?? <AudioTrack>[]).indexed) {
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
            album: mediaMetadata.mapOrNull(book: (b) => b.seriesName),
            artUri: coverUri,
            extras: {
              if (index == 0)
                'chapters': chapters
                    .map(
                      (c) => Chapter(
                        start: c.start,
                        end: c.end,
                        title: c.title,
                      ).toJson(),
                    )
                    .toList(),
              'startOffset': startOffset.inMicroseconds,
              'itemId': libraryItemId,
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
