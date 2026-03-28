import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
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

  Future<ServerSyncResult> sync({required bool keepRunning}) async {
    final listened = accumulator.snapshotAndReset(keepRunning: keepRunning);
    if (listened.inMilliseconds < 999) {
      return const ServerSyncResult(attempted: false, success: false);
    }
    try {
      await ref.read(sessionProvider.notifier).sync(listened);
      return const ServerSyncResult(attempted: true, success: true);
    } catch (_) {
      accumulator.rollback(listened);
      return const ServerSyncResult(attempted: true, success: false);
    }
  }

  Future<void> stop({bool didComplete = false}) async {
    log('stop called, didComplete: $didComplete');
    ServerSyncResult? result;
    try {
      result = await sync(keepRunning: false);
      await ref.read(sessionProvider.notifier).close(didComplete: didComplete);
    } catch (_) {
    } finally {
      await history.addEvent(
        session.id,
        didComplete ? .complete : .stop,
        syncResult: result,
      );
      accumulator.reset();
    }
  }

  ref.listen(audioHandlerEventsProvider, (_, next) async {
    switch (next.value) {
      case .play:
        accumulator.start();
        await history.addEvent(session.id, .play);

      case .buffering:
        accumulator.pause();

      case .pause:
        final result = await sync(keepRunning: false);
        await history.addEvent(session.id, .pause, syncResult: result);

      case .seek:
        final result = await sync(keepRunning: ref.read(isPlayingProvider));
        await history.addEvent(session.id, .seek, syncResult: result);

      case .stop:
        await stop();

      case .complete:
        await stop(didComplete: true);

      case .error:
        await history.addEvent(
          session.id,
          .stop,
          syncResult: const ServerSyncResult(attempted: false, success: false),
        );
        await stop();

      default:
        break;
    }
  });

  final timer = Timer.periodic(interval, (_) async {
    if (!ref.read(isPlayingProvider)) return;
    final result = await sync(keepRunning: true);
    if (result.attempted) {
      await history.addEvent(session.id, .sync, syncResult: result);
    }
  });

  ref.onDispose(timer.cancel);
}
