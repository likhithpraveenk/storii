import 'package:abs_api/abs_api.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/audio_mime_helper.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:uuid/uuid.dart';

extension PlaybackSessionX on PlaybackSession {
  String get mediaItemIdKey =>
      episodeId != null ? '$libraryItemId$episodeId' : libraryItemId;

  List<UriAudioSource> toAudioSources(
    Uri? serverUrl,
    String? token, {
    String? coverPath,
    Map<int, String> localPaths = const {},
  }) {
    final coverUri = coverPath != null
        ? Uri.file(coverPath)
        : serverUrl
              ?.resolve(ApiRoutes.itemCover(libraryItemId))
              .replace(queryParameters: {'raw': '1'});
    Duration accumulated = Duration.zero;
    final sources = <UriAudioSource>[];

    List<Map<String, dynamic>> jsonChapters;
    if (chapters.isNotEmpty) {
      jsonChapters = chapters
          .map(
            (c) => Chapter(
              displayIndex: c.id + 1,
              start: c.start,
              end: c.end,
              title: c.title,
              subtitle: displayTitle ?? l10n.noTitle,
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
                  title: displayTitle ?? l10n.noTitle,
                  subtitle: displayAuthor ?? l10n.noAuthor,
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
          : serverUrl!.resolve(track.contentUrl);
      //! either we get local path or server url

      final tag = MediaItem(
        id: track.contentUrl,
        title: displayTitle ?? l10n.noTitle,
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

      final mimeType = AudioMimeHelper.resolve(
        track.mimeType,
        track.contentUrl,
      );
      final capability = AudioMimeHelper.getPlaybackCapability(mimeType);

      if (capability == .unsupported) {
        throw FormatException('Unsupported audio format ${mimeType.name}');
      }

      final headers = isLocal
          ? <String, String>{}
          : {'Authorization': 'Bearer $token'};
      final UriAudioSource source;

      switch (mimeType) {
        case .hls:
          source = HlsAudioSource(
            uri,
            headers: headers,
            tag: tag,
            duration: duration,
          );
        case .dash:
          source = DashAudioSource(
            uri,
            headers: headers,
            tag: tag,
            duration: duration,
          );
        default:
          source = ProgressiveAudioSource(
            uri,
            headers: headers,
            tag: tag,
            duration: duration,
          );
      }

      sources.add(source);
    }
    return sources;
  }

  Future<(Map<int, String>, String?)> resolveLocalPaths() async {
    final tracks = audioTracks;
    final trackPaths = <int, String>{};
    if (tracks == null || tracks.isEmpty) return (trackPaths, null);

    final coverPath = await DownloadsFilesystemHelper().coverPathIfExists(
      displayTitle ?? l10n.noTitle,
    );
    for (final track in tracks) {
      final local = await DownloadsFilesystemHelper().trackPathIfExists(
        filename: track.metadata?.filename ?? track.index.toString(),
        itemTitle: libraryItem?.title ?? libraryItemId,
      );
      if (local != null) trackPaths[track.index] = local;
    }

    return (trackPaths, coverPath);
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
