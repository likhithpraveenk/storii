import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/features/player/logic/listen_time_accumulator.dart';
import 'package:storii/features/player/logic/playback_history.dart';

typedef OnSessionClose = Future<void> Function();
typedef OnMarkComplete = Future<void> Function();
typedef OnSync = Future<void> Function(Duration listened, Duration position);

class PlaybackSyncService {
  final PlaybackSession session;
  final OnSync onSync;
  final OnSessionClose onClose;
  final OnMarkComplete onMarkComplete;
  final Duration Function() getPosition;
  final bool Function() isPlaying;
  final PlaybackHistoryNotifier history;
  final _accumulator = ListenTimeAccumulator();

  late final Timer _timer;

  PlaybackSyncService({
    required this.session,
    required this.history,
    required this.onSync,
    required this.onClose,
    required this.onMarkComplete,
    required Duration syncInterval,
    required this.getPosition,
    required this.isPlaying,
  }) {
    _timer = Timer.periodic(syncInterval, (_) async {
      if (!isPlaying()) return;
      await _sync(.sync, keepRunning: true);
    });
  }

  void onBuffering() => _accumulator.pause();

  void onBufferingComplete() {
    if (isPlaying()) _accumulator.resume();
  }

  Future<void> onPlay() async {
    _accumulator.start();
    await _sync(.play, keepRunning: true);
  }

  Future<void> onPause() async {
    await _sync(.pause, keepRunning: false);
  }

  Future<void> onSeek() async {
    await _sync(.seek, keepRunning: isPlaying());
  }

  Future<void> onStop() async {
    await _sync(.stop, keepRunning: false);
    await onClose();
  }

  Future<void> onComplete() async {
    await _sync(.complete, keepRunning: false);
    await onMarkComplete();
    await onClose();
  }

  Future<void> onError() async {
    await _sync(.stop, keepRunning: false, playbackError: true);
  }

  Future<void> _sync(
    PlaybackEventKind kind, {
    required bool keepRunning,
    bool playbackError = false,
  }) async {
    final listened = _accumulator.snapshotAndReset(keepRunning: keepRunning);
    if (listened.inMilliseconds < 200 && kind != .play) {
      _accumulator.rollback(listened);
      return;
    }

    final position = getPosition();
    final event = PlaybackEvent(
      timestamp: DateTime.now(),
      position: position,
      kind: kind,
      playbackError: playbackError,
    );
    await history.addEvent(session.id, event, position: position);

    try {
      await onSync(listened, position);
      await history.updateEvent(
        event.copyWith(syncAttempt: true, syncSuccess: true),
      );
    } catch (e) {
      _accumulator.rollback(listened);
      await history.updateEvent(
        event.copyWith(syncAttempt: true, syncSuccess: false),
      );
    }
  }

  Future<void> dispose() async {
    _timer.cancel();
    _accumulator.reset();
  }
}
