import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
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
  final accumulator = ListenTimeAccumulator();

  StreamSubscription? _subscription;
  late final Timer _timer;

  PlaybackSyncService({
    required this.session,
    required this.history,
    required Stream<AudioHandlerEvent> audioEvents,
    required this.onSync,
    required this.onClose,
    required this.onMarkComplete,
    required Duration syncInterval,
    required this.getPosition,
    required this.isPlaying,
  }) {
    _subscription = audioEvents.listen((event) async {
      switch (event) {
        case .buffering:
          accumulator.pause();
        case .bufferingComplete:
          accumulator.start();
        default:
          _subscription?.pause();
          try {
            await _handleAudioEvent(event);
          } finally {
            _subscription?.resume();
          }
      }
    });

    _timer = Timer.periodic(syncInterval, (_) async {
      if (!isPlaying()) return;
      await _sync(.sync, keepRunning: true);
    });
  }

  Future<void> _handleAudioEvent(AudioHandlerEvent event) async {
    switch (event) {
      case .play:
        accumulator.start();
        await _sync(.play, keepRunning: true);

      case .pause:
        await _sync(.pause, keepRunning: false);

      case .seek:
        await _sync(.seek, keepRunning: isPlaying());

      case .stop:
        await _sync(.stop, keepRunning: false);
        await onClose();

      case .complete:
        await _sync(.complete, keepRunning: false);
        await onMarkComplete();
        await onClose();

      case .error:
        await _sync(.stop, keepRunning: false, playbackError: true);
      default:
        break;
    }
  }

  Future<void> _sync(
    PlaybackEventKind kind, {
    required bool keepRunning,
    bool playbackError = false,
  }) async {
    final position = getPosition();
    final listened = accumulator.snapshotAndReset(keepRunning: keepRunning);

    if (listened.inMilliseconds < 200) {
      accumulator.rollback(listened);
      return;
    }

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
      accumulator.rollback(listened);
      await history.updateEvent(
        event.copyWith(syncAttempt: true, syncSuccess: false),
      );
    }
  }

  Future<void> dispose() async {
    _timer.cancel();
    await _subscription?.cancel();
    accumulator.reset();
  }
}
