import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/playback_sync_service.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';
import 'package:storii/features/player/logic/sync_interval_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'session_sync_watcher.g.dart';

@Riverpod(keepAlive: true)
class SessionSyncWatcher extends _$SessionSyncWatcher {
  PlaybackSyncService? _service;

  @override
  void build() {
    ref.onDispose(() async => await _service?.dispose());

    ref.listen(sessionProvider, (prev, session) async {
      final sameSession = prev?.id == session?.id;
      if (sameSession) return;

      await _service?.dispose();
      _service = null;

      if (session == null) return;

      _service = PlaybackSyncService(
        session: session,
        history: ref.read(
          playbackHistoryProvider(
            mediaItemIdKey(session.libraryItemId, session.episodeId),
          ).notifier,
        ),
        getSyncInterval: () => ref.read(networkAwareSyncIntervalProvider),
        getPosition: () => audioHandler.currentPosition,
        isPlaying: () => ref.read(isPlayingProvider),
        onSync: (listened, position) =>
            ref.read(sessionProvider.notifier).sync(listened, position),
        onClose: () => ref.read(sessionProvider.notifier).close(),
        onMarkComplete: () => ref
            .read(
              mediaProgressProvider(
                session.libraryItemId,
                session.episodeId,
              ).notifier,
            )
            .markComplete(),
      );
    });

    ref.listen(audioHandlerEventsProvider, (_, next) {
      switch (next.value) {
        case .buffering:
          _service?.onBuffering();
        case .bufferingComplete:
          _service?.onBufferingComplete();
        case .play:
          _service?.onPlay();
        case .pause:
          _service?.onPause();
        case .seek:
          _service?.onSeek();
        case .stop:
          _service?.onStop();
        case .complete:
          _service?.onComplete();
        case .error:
          _service?.onError();
        default:
      }
    });

    ref.listen(socketStatusProvider, (prev, next) async {
      final wasConnected = prev?.value ?? false;
      final isConnected = next.value ?? false;
      if (!wasConnected && isConnected) {
        try {
          await ref.read(sessionsCleanupProvider.notifier).cleanup();
        } catch (e) {
          LogService.log(
            'reconnect sync skipped',
            originalError: e,
            level: .warning,
            source: 'SessionSyncWatcher',
          );
        }
      }
    });
  }
}
