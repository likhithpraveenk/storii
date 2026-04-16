import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:uuid/uuid.dart';

extension PlaybackSessionX on PlaybackSession {
  String get mediaItemIdKey =>
      episodeId != null ? '$libraryItemId$episodeId' : libraryItemId;

  List<ProgressiveAudioSource> toAudioSources(
    Uri serverUrl,
    String? token, {
    Map<int, String> localPaths = const {},
  }) {
    final coverUri = serverUrl
        .resolve(ApiRoutes.itemCover(libraryItemId))
        .replace(queryParameters: {'raw': '1'});
    Duration accumulated = Duration.zero;
    final sources = <ProgressiveAudioSource>[];

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

      final localPath = localPaths[track.index];
      final isLocal = localPath != null;

      final uri = isLocal
          ? Uri.file(localPath)
          : serverUrl.resolve(track.contentUrl);

      final tag = MediaItem(
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
          'isLocal': isLocal,
        },
      );

      sources.add(
        ProgressiveAudioSource(
          uri,
          headers: isLocal ? null : {'Authorization': 'Bearer $token'},
          tag: tag,
        ),
      );
    }
    return sources;
  }

  Future<Map<int, String>> resolveLocalPaths() async {
    final tracks = audioTracks;
    if (tracks == null || tracks.isEmpty) return {};

    final result = <int, String>{};
    for (final track in tracks) {
      final local = await DownloadsFilesystemHelper().trackPathIfExists(
        filename: track.metadata.filename,
        itemTitle: libraryItem?.title ?? libraryItemId,
      );
      if (local != null) result[track.index] = local;
    }
    return result;
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

extension ToPlaybackSession on LibraryItem {
  PlaybackSession toPlaybackSession(
    String userId, {
    ClientDeviceInfo? deviceInfo,
    String? episodeId,
  }) {
    final now = DateTime.now();
    final today = DayOfTheWeek.byValue[now.weekday % 7]!.name;
    return PlaybackSession(
      id: const Uuid().v4(),
      userId: userId,
      libraryId: libraryId,
      libraryItemId: id,
      mediaType: mediaType,
      mediaMetadata: media.metadata,
      chapters: chapters,
      displayTitle: title ?? 'No Title',
      displayAuthor: authorName ?? 'No Author',
      duration: duration,
      playMethod: .local,
      mediaPlayer: '$appName just_audio',
      date: now.fString(format: 'yyyy-mm-dd'), //! use server format
      dayOfWeek: today,
      timeListening: Duration.zero,
      startTime: currentOffset,
      currentTime: currentOffset,
      startedAt: now,
      updatedAt: now,
      audioTracks: tracks,
      libraryItem: this,
      deviceInfo: deviceInfo?.toDeviceInfo(),
      episodeId: episodeId,
    );
  }
}
