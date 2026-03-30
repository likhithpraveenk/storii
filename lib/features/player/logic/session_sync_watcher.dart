import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/local_position_provider.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'session_sync_watcher.g.dart';

class ListenTimeAccumulator {
  DateTime? _playStartedAt;
  Duration _unsynced = Duration.zero;

  void start() {
    _playStartedAt ??= DateTime.now();
  }

  void pause() {
    if (_playStartedAt == null) return;
    _unsynced += DateTime.now().difference(_playStartedAt!);
    _playStartedAt = null;
  }

  Duration snapshotAndReset({required bool keepRunning}) {
    final now = DateTime.now();
    final live = _playStartedAt != null
        ? now.difference(_playStartedAt!)
        : Duration.zero;

    final total = _unsynced + live;
    _unsynced = Duration.zero;
    _playStartedAt = keepRunning ? now : null;
    return total;
  }

  void reset() {
    _playStartedAt = null;
    _unsynced = Duration.zero;
  }

  void rollback(Duration unsynced) => _unsynced = unsynced;
}

@Riverpod(keepAlive: true)
void sessionSyncWatcher(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) return;

  final interval = ref.watch(syncIntervalProvider);
  final accumulator = ListenTimeAccumulator();

  final history = ref.read(
    playbackHistoryProvider(
      mediaItemIdKey(session.libraryItemId, session.episodeId),
    ).notifier,
  );

  Future<void> sync(PlaybackEventKind kind, {required bool keepRunning}) async {
    final position = ref.read(localPositionProvider(session.id));
    if (position == null) {
      log('no position to sync');
      return;
    }

    final listened = accumulator.snapshotAndReset(keepRunning: keepRunning);
    if (listened.inMilliseconds < 500) {
      await history.addEvent(
        session.id,
        PlaybackEvent(
          timestamp: DateTime.now(),
          position: position,
          kind: kind,
        ),
        position: position,
      );
      return;
    }

    try {
      await ref.read(sessionProvider.notifier).sync(listened, position);
      await history.addEvent(
        session.id,
        PlaybackEvent(
          timestamp: DateTime.now(),
          position: position,
          kind: kind,
          syncAttempt: true,
          syncSuccess: true,
        ),
        position: position,
      );
    } catch (_) {
      accumulator.rollback(listened);
      await history.addEvent(
        session.id,
        PlaybackEvent(
          timestamp: DateTime.now(),
          position: position,
          kind: kind,
          syncAttempt: true,
          syncSuccess: false,
        ),
        position: position,
      );
    }
  }

  Future<void> stop({bool didComplete = false}) async {
    try {
      await sync(didComplete ? .complete : .stop, keepRunning: false);
      await ref.read(sessionProvider.notifier).close(didComplete: didComplete);
    } finally {
      accumulator.reset();
    }
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
        await stop(didComplete: true);

      case .error:
        final position = ref.read(localPositionProvider(session.id));
        if (position == null) return;
        await history.addEvent(
          session.id,
          PlaybackEvent(
            timestamp: DateTime.now(),
            position: position,
            kind: .stop,
            errorMessage: 'playback error',
          ),
          position: position,
        );
        await stop();
    }
  });

  final timer = Timer.periodic(interval, (_) async {
    if (!ref.read(isPlayingProvider)) return;
    await sync(.sync, keepRunning: true);
  });

  ref.onDispose(timer.cancel);
}
