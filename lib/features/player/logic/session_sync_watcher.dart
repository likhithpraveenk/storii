import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/listen_time_accumulator.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';
import 'package:storii/features/player/logic/sync_interval_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'session_sync_watcher.g.dart';

@Riverpod(keepAlive: true)
void sessionSyncWatcher(Ref ref) {
  final session = ref.watch(sessionProvider);

  ref.listen(socketStatusProvider, (prev, next) async {
    final prevConnected = prev?.value ?? false;
    final nextConnected = next.value ?? false;
    if (!prevConnected && nextConnected) {
      await ref
          .read(authenticatedUserProvider.future)
          .then((user) {
            ref.read(sessionsCleanupProvider.notifier).syncLocalSessions(user);
          })
          .catchError((e) {
            log('reconnect sync skipped: $e');
          });
    }
  });

  if (session == null) return;

  final interval = ref.watch(networkAwareSyncIntervalProvider);
  final accumulator = ListenTimeAccumulator();

  final history = ref.read(
    playbackHistoryProvider(
      mediaItemIdKey(session.libraryItemId, session.episodeId),
    ).notifier,
  );

  Future<void> sync(
    PlaybackEventKind kind, {
    required bool keepRunning,
    bool playbackError = false,
  }) async {
    final position = audioHandler.currentPosition;

    final event = PlaybackEvent(
      timestamp: DateTime.now(),
      position: position,
      kind: kind,
      playbackError: playbackError,
    );
    await history.addEvent(session.id, event, position: position);

    final listened = accumulator.snapshotAndReset(keepRunning: keepRunning);
    if (listened.inMilliseconds < 500) return;

    try {
      await ref.read(sessionProvider.notifier).sync(listened, position);
      await history.updateEvent(
        event.copyWith(syncAttempt: true, syncSuccess: true),
      );
    } catch (_) {
      accumulator.rollback(listened);
      await history.updateEvent(
        event.copyWith(syncAttempt: true, syncSuccess: false),
      );
    }
  }

  Future<void> stop() async {
    await sync(.stop, keepRunning: false);
    await ref.read(sessionProvider.notifier).close();
    accumulator.reset();
  }

  ref.listen(audioHandlerEventsProvider, (_, next) async {
    final event = next.value;
    if (event == null) return;
    switch (event) {
      case .play:
        accumulator.start();
        await sync(.play, keepRunning: true);

      case .buffering:
        accumulator.pause();

      case .pause:
        await sync(.pause, keepRunning: false);

      case .seek:
        await sync(.seek, keepRunning: ref.read(isPlayingProvider));

      case .stop:
        await stop();

      case .complete:
        await sync(.complete, keepRunning: false);
        await ref
            .read(
              mediaProgressProvider(
                session.libraryItemId,
                session.episodeId,
              ).notifier,
            )
            .markComplete();
        accumulator.reset();

      case .error:
        await sync(.stop, keepRunning: false, playbackError: true);
    }
  });

  final timer = Timer.periodic(interval, (_) async {
    if (!ref.read(isPlayingProvider)) return;
    await sync(.sync, keepRunning: true);
  });

  ref.onDispose(timer.cancel);
}
