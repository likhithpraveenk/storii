import 'dart:async';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/is_background_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/models/app_playback_error.dart';
import 'package:storii/features/player/models/app_playback_state.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/speed_store.dart';

part 'audio_providers.g.dart';

late final AppAudioHandler audioHandler;

@riverpod
Stream<AudioHandlerEvent> audioHandlerEvents(Ref ref) {
  return audioHandler.events.map((e) {
    log('audio handler event: ${e.name}');
    return e;
  });
}

@riverpod
Stream<AppPlaybackError> playbackErrors(Ref ref) => audioHandler.errors;

@riverpod
Stream<AppPlaybackState> playbackState(Ref ref) {
  return audioHandler.stateStream;
}

@riverpod
Stream<AppPlaybackStatus> playbackStatus(Ref ref) {
  return audioHandler.stateStream.map((s) => s.status);
}

@riverpod
bool isPlaying(Ref ref) {
  return ref.watch(
    playbackStateProvider.select((s) => s.value?.isPlaying == true),
  );
}

@riverpod
Stream<Duration> globalPosition(Ref ref) {
  final isBackground = ref.watch(isBackgroundProvider);
  if (isBackground) return const Stream.empty();
  return audioHandler.positionStream;
}

@riverpod
Stream<Duration> chapterPosition(Ref ref) {
  final isBackground = ref.watch(isBackgroundProvider);
  if (isBackground) return const Stream.empty();
  return audioHandler.chapterPositionStream;
}

@riverpod
Stream<Chapter?> currentChapter(Ref ref) {
  final isBackground = ref.watch(isBackgroundProvider);
  if (isBackground) return const Stream.empty();
  return audioHandler.currentChapterStream;
}

@riverpod
List<Chapter> chapterList(Ref ref) => audioHandler.resolver.chapters;

@riverpod
Duration totalDuration(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) return Duration.zero;

  return session.duration;
}

class AudioPlayerState {
  final String? loadingItemId;
  final String? loadingEpisodeId;

  const AudioPlayerState({this.loadingItemId, this.loadingEpisodeId});
}

@Riverpod(keepAlive: true)
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  @override
  AudioPlayerState build() => const AudioPlayerState();

  Future<void> play({
    required String itemId,
    String? episodeId,
    BookChapter? chapter,
    Duration? initialPosition,
  }) async {
    state = AudioPlayerState(
      loadingItemId: itemId,
      loadingEpisodeId: episodeId,
    );
    try {
      final download = ref.read(downloadItemProvider(itemId, episodeId));
      final fs = ref.read(downloadsFsHelperProvider);
      final isFullyDownloaded =
          download != null &&
          download.isComplete &&
          await fs.isFullyDownloaded(download);

      final PlaybackSession session;
      Uri? serverUrl;

      if (isFullyDownloaded) {
        final item = await ref.read(itemDetailProvider(itemId).future);
        final user = ref.read(currentUserProvider);
        final isSameUser = download.userId == user?.id;
        session = await ref
            .read(sessionProvider.notifier)
            .createLocal(
              item: item,
              episodeId: episodeId,
              isSameUser: isSameUser,
            );
      } else {
        final user = await ref.read(authenticatedUserProvider.future);
        serverUrl = user.serverUrl;
        session = await ref
            .read(sessionProvider.notifier)
            .create(itemId: itemId, episodeId: episodeId);
      }

      final (index, position) = (chapter != null)
          ? session.chapterToTrackOffset(chapter)
          : session.getIndexAndOffset(initialPosition);

      final (localPaths, coverPath) = await fs.resolveLocalPaths(session);
      final localCount = localPaths.length;
      final totalTracks = session.audioTracks?.length ?? 0;
      if (localCount > 0) {
        log('local playback has $localCount/$totalTracks tracks');
      }

      final sources = session.toAudioSources(
        serverUrl,
        localPaths: localPaths,
        coverPath: coverPath,
      );

      await audioHandler.setSources(
        sources,
        initialIndex: index,
        initialPosition: position,
      );

      await audioHandler.statusStream.firstWhere((s) => s == .ready);
      state = const AudioPlayerState();
      await audioHandler.play();
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'playing failed: ${error.message}',
        source: 'AudioPlayerNotifier',
        level: .error,
        stackTrace: error.stackTrace,
        originalError: error.originalError,
      );
      state = const AudioPlayerState();
      throw error;
    }
  }
}

@riverpod
void playerStateWatcher(Ref ref) {
  ref.listen(sessionProvider, (previous, next) {
    final playerVisible = ref.read(playerViewStateProvider) != .hidden;
    final playerMode = ref.read(playerModeProvider.notifier);

    // if playback started then show player
    if (previous == null && next != null && !playerVisible) {
      // show full during initial loading, mini otherwise
      final isLoading = ref.read(
        audioPlayerProvider.select((s) => s.loadingItemId != null),
      );
      if (isLoading) {
        playerMode.toFull();
      } else {
        playerMode.toMini();
      }
      return;
    }

    // if session ended then hide
    if (next == null && playerVisible) {
      playerMode.toHidden();
      return;
    }
  });
}

@riverpod
Stream<double> volume(Ref ref) => audioHandler.volumeStream;

@riverpod
class VolumeControl extends _$VolumeControl {
  @override
  double build() => audioHandler.volume;

  Future<void> setVolume(double volume) async {
    state = volume;
    await audioHandler.setVolume(volume);
  }
}

@Riverpod(keepAlive: true)
class LocalSpeed extends _$LocalSpeed {
  @override
  double build() {
    final session = ref.watch(sessionProvider);
    if (session == null) return ref.watch(speedProvider);
    final storedSpeed = ref
        .read(speedStoreProvider.notifier)
        .getSpeed(session.libraryItemId);
    return storedSpeed ?? ref.watch(speedProvider);
  }

  Future<void> setSpeed(double speed) async {
    final session = ref.read(sessionProvider);
    if (session != null) {
      await ref
          .read(speedStoreProvider.notifier)
          .saveSpeed(session.libraryItemId, speed);
    }
    state = speed;
  }
}

@riverpod
void audioSettingsWatcher(Ref ref) {
  ref.listen(localSpeedProvider, (_, next) {
    audioHandler.setSpeed(next);
  });
}
