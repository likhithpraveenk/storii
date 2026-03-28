import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/chapter.dart';

extension PlaybackSessionX on PlaybackSession {
  String get mediaItemIdKey =>
      episodeId != null ? '$libraryItemId$episodeId' : libraryItemId;

  List<AudioSource> toAudioSources(Uri serverUrl, String? token) {
    final coverUri = serverUrl
        .resolve(ApiRoutes.itemCover(libraryItemId))
        .replace(queryParameters: {'raw': '1'});
    Duration accumulated = Duration.zero;
    final sources = <AudioSource>[];

    List<Map<String, dynamic>> jsonChapters;
    if (chapters.isNotEmpty) {
      jsonChapters = chapters
          .map(
            (c) => Chapter(
              displayIndex: c.id + 1,
              start: c.start,
              end: c.end,
              title: c.title,
              subtitle: displayTitle,
            ).toJson(),
          )
          .toList();
    } else {
      jsonChapters =
          audioTracks
              ?.map(
                (t) => Chapter(
                  displayIndex: t.index + 1,
                  start: t.startOffset,
                  end: t.startOffset + t.duration,
                  title: displayTitle,
                  subtitle: displayAuthor,
                ).toJson(),
              )
              .toList() ??
          [];
    }

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
              if (index == 0) 'chapters': jsonChapters,
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

  (int, Duration) getIndexAndOffset([Duration? position]) {
    final target = position ?? currentTime;
    var accumulated = Duration.zero;
    final tracks = audioTracks ?? [];
    for (var i = 0; i < tracks.length; i++) {
      final trackLen = tracks[i].duration;
      if (target < accumulated + trackLen) {
        return (i, target - accumulated);
      }
      accumulated += trackLen;
    }
    return (0, Duration.zero);
  }

  (int, Duration) chapterToTrackOffset(BookChapter chapter) {
    var accumulated = Duration.zero;
    final tracks = audioTracks ?? [];
    for (var i = 0; i < tracks.length; i++) {
      final trackLen = tracks[i].duration;
      if (chapter.start < accumulated + trackLen) {
        return (i, chapter.start - accumulated);
      }
      accumulated += trackLen;
    }
    return (0, Duration.zero);
  }
}
