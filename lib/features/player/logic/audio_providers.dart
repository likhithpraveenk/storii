import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/local_position_provider.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'audio_providers.g.dart';

late final AppAudioHandler audioHandler;

@riverpod
Stream<AudioHandlerEvent> audioHandlerEvents(Ref ref) {
  return audioHandler.events.map((e) {
    log('audio handler event: $e');
    return e;
  });
}

@riverpod
Stream<PlaybackState> playbackState(Ref ref) {
  return audioHandler.playbackState;
}

@riverpod
AudioProcessingState processingState(Ref ref) {
  return ref.watch(
    playbackStateProvider.select((s) => s.value?.processingState ?? .idle),
  );
}

@riverpod
bool isPlaying(Ref ref) {
  return ref.watch(
    playbackStateProvider.select((s) => s.value?.playing == true),
  );
}

@riverpod
Stream<Duration> globalPosition(Ref ref) {
  return audioHandler.positionStream;
}

@riverpod
Stream<Duration> chapterPosition(Ref ref) {
  return audioHandler.chapterPositionStream;
}

@riverpod
Stream<Chapter?> currentChapter(Ref ref) {
  return audioHandler.currentChapterStream;
}

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
      final user = await ref.read(authenticatedUserProvider.future);
      final token = await ref.read(tokenProvider).getAccessToken(user.id);

      final oldSession = ref.read(sessionProvider);
      if (oldSession != null) {
        await audioHandler.stop();
      }

      final session = await ref
          .read(sessionProvider.notifier)
          .create(itemId: itemId, episodeId: episodeId);

      await ref
          .read(localPositionProvider(session.id).notifier)
          .save(initialPosition ?? chapter?.start ?? session.currentTime);

      final int index;
      final Duration position;

      if (chapter != null) {
        (index, position) = session.chapterToTrackOffset(chapter);
      } else {
        (index, position) = session.getIndexAndOffset(initialPosition);
      }

      final sources = session.toAudioSources(user.serverUrl, token);
      await audioHandler.setSources(
        sources,
        initialIndex: index,
        initialPosition: position,
      );

      state = const AudioPlayerState();
      await audioHandler.play();
    } catch (e) {
      final error = AppError.resolve(e);
      LogService.log(
        'playing failed: $error',
        source: 'AudioPlayerNotifier',
        level: .error,
      );
      state = const AudioPlayerState();
      throw error;
    }
  }
}

@riverpod
void playerStateWatcher(Ref ref) {
  ref.listen(playbackStateProvider, (previous, next) {
    final prev = previous?.value;
    final curr = next.value;
    if (curr == null) return;

    // if initial loading then expand
    if (curr.processingState == .loading) {
      ref.read(playerModeProvider.notifier).toFull();
      return;
    }

    final stopped = !curr.playing && curr.processingState == .idle;
    final wasStopped =
        prev == null || (!prev.playing && prev.processingState == .idle);

    // if just stopped then hide
    if (stopped && !wasStopped) {
      ref.read(playerHeightProvider.notifier).snapTo(.hidden);
      return;
    }

    final playerVisible = ref.read(playerViewStateProvider) != .hidden;
    // if play started off-screen then mini
    if (curr.playing && !playerVisible) {
      ref.read(playerModeProvider.notifier).toMini();
      return;
    }
  });

  ref.listen(sessionProvider, (_, next) {
    final playerVisible = ref.read(playerViewStateProvider) != .hidden;

    // if session ended then hide
    if (next == null && playerVisible) {
      ref.read(playerModeProvider.notifier).toHidden();
      return;
    }
  });
}

@riverpod
void audioSettingsWatcher(Ref ref) {
  ref.listen(speedProvider, (_, next) {
    audioHandler.setSpeed(next);
  });
}
