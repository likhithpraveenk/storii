import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/player/logic/position_resolver.dart';
import 'package:storii/features/player/models/app_audio_player.dart';
import 'package:storii/features/player/models/app_audio_source.dart';
import 'package:storii/features/player/models/app_playback_error.dart';
import 'package:storii/features/player/models/app_playback_state.dart';
import 'package:storii/shared/helpers/extensions.dart';

enum AudioHandlerEvent {
  play,
  pause,
  seek,
  stop,
  complete,
  buffering,
  error,
  bufferingComplete,
}

class AppAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AppAudioPlayer _player;
  PositionResolver resolver = PositionResolver.empty;

  final _eventController = StreamController<AudioHandlerEvent>.broadcast();
  final _errorController = StreamController<AppPlaybackError>.broadcast();

  final Duration Function() getSkipForward;
  final Duration Function() getSkipBackward;

  AppPlaybackStatus? _lastStatus;

  AppAudioHandler({
    required this._player,
    required double speed,
    required this.getSkipForward,
    required this.getSkipBackward,
  }) {
    // initial playback event
    playbackState.add(
      PlaybackState(
        controls: [
          .rewind,
          .pause,
          .play,
          .fastForward,
          .skipToNext,
          .skipToPrevious,
        ],
        systemActions: const {
          .seek,
          .seekForward,
          .seekBackward,
          .playPause,
          .rewind,
          .fastForward,
          .skipToNext,
          .skipToPrevious,
        },
        androidCompactActionIndices: const [0, 1, 2],
        speed: speed,
      ),
    );
    _player.stateStream.listen((state) {
      // log('state stream: $state');
      if (state.status == .completed) _eventController.add(.complete);
      if (state.status == .buffering) _eventController.add(.buffering);
      if (_lastStatus == .buffering && state.status == .ready) {
        _eventController.add(.bufferingComplete);
      }

      _lastStatus = state.status;

      _updatePlaybackState(state);

      if (state.error != null) {
        _handleError(state.error!);
      }
    });

    setSpeed(speed);
    _initAudioSession();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  void _updatePlaybackState(AppPlaybackState state) {
    if (state.status == .idle && state.error == null) return;

    final resolved = resolver.resolveChapterFromTrack(
      state.index,
      state.position,
    );
    if (resolved == null) {
      if (state.error != null) {
        playbackState.add(
          playbackState.value.copyWith(
            processingState: .error,
            errorMessage: state.error!.label,
          ),
        );
      }
      return;
    }

    final resolvedMediaItem = queue.value.elementAtOrNull(
      resolved.chapterIndex,
    );
    mediaItem.add(resolvedMediaItem);

    final resolvedBuffered =
        resolver.resolveChapterFromTrack(state.index, state.bufferedPosition) ??
        resolved;

    playbackState.add(
      playbackState.value.copyWith(
        processingState: switch (state.status) {
          .error => .error,
          _ when state.error != null => .error,
          .idle => .idle,
          .buffering => .buffering,
          .ready => .ready,
          .completed => .completed,
        },
        playing: state.isPlaying,
        updatePosition: resolved.chapterPosition,
        bufferedPosition: resolvedBuffered.chapterPosition,
        speed: state.speed,
        queueIndex: resolved.chapterIndex,
        errorMessage: state.error?.name,
      ),
    );
  }

  void _handleError(AppPlaybackError type) {
    LogService.log(
      'Player error: $type',
      level: .error,
      source: 'AppAudioHandler',
    );

    _errorController.add(type);
    if (_isFatal(type)) _eventController.add(.error);
  }

  bool _isFatal(AppPlaybackError type) => switch (type) {
    .network => false,
    .source || .decoder || .unknown => true,
  };

  Stream<AppPlaybackStatus> get statusStream =>
      _player.stateStream.map((s) => s.status).distinct();

  Stream<AppPlaybackState> get stateStream => _player.stateStream.distinct();

  Stream<AudioHandlerEvent> get events => _eventController.stream;

  Stream<AppPlaybackError> get errors => _errorController.stream;

  // position for sync operations
  Duration get currentPosition =>
      resolver.globalPositionFromTrack(_player.index, _player.position);

  Stream<Duration> get positionStream => _player.positionStream
      .map(
        (position) => resolver.globalPositionFromTrack(_player.index, position),
      )
      .throttleTime(const Duration(milliseconds: 200));

  Stream<Duration> get chapterPositionStream => _player.positionStream
      .map(
        (position) =>
            resolver.chapterPositionFromTrack(_player.index, position),
      )
      .throttleTime(const Duration(milliseconds: 200));

  Stream<Chapter?> get currentChapterStream => _player.positionStream
      .map((position) => resolver.chapterFromTrack(_player.index, position))
      .distinct();

  @override
  Future<void> setSpeed(double speed) => _player.setSpeed(speed);

  double get volume => _player.state.volume;

  Stream<double> get volumeStream => _player.volumeStream;

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume.clamp(0.0, 1.0));
  }

  Future<void> setSources(
    List<AppAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final trackItems = sources.map((s) => s.tag).toList();

    resolver = PositionResolver.from(trackItems);
    final chapterItems = resolver.chapters
        .map((c) => c.toMediaItem(trackItems.first))
        .toList();

    queue.add(chapterItems);

    await _player.setAudioSources(
      sources,
      initialIndex: initialIndex,
      initialPosition: initialPosition,
    );
  }

  Future<void> togglePlay() async {
    if (_player.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  @override
  Future<void> play() async {
    _eventController.add(.play);
    await _player.play();
  }

  @override
  Future<void> pause() async {
    _eventController.add(.pause);
    await _player.pause();
  }

  @override
  Future<void> fastForward() => _seekRelative(getSkipForward());

  @override
  Future<void> rewind() => _seekRelative(-getSkipBackward());

  Future<void> _seekRelative(Duration offset) async {
    await seek(playbackState.value.position + offset);
  }

  Future<void> seekFromGlobalPosition(Duration position) async {
    final result = resolver.chapterPositionFromGlobal(position);
    final target = resolver.resolveSeek(
      result.chapterIndex,
      result.chapterPosition,
    );
    if (target != null) {
      await _player.seek(target.trackPosition, index: target.trackIndex);
      _eventController.add(.seek);
    }
  }

  @override
  Future<void> seek(Duration position) async {
    if (queue.value.isEmpty) return;

    final chapterIndex = playbackState.value.queueIndex ?? 0;
    final chapter = resolver.chapterAt(chapterIndex);

    final clampedPosition = chapter != null
        ? position.clamp(Duration.zero, chapter.duration)
        : position;

    final target = resolver.resolveSeek(chapterIndex, clampedPosition);

    if (target != null) {
      await _player.seek(target.trackPosition, index: target.trackIndex);
      _eventController.add(.seek);
    }
  }

  Future<void> seekToStart() async {
    await _player.seek(Duration.zero, index: 0);
    await play();
  }

  @override
  Future<void> skipToNext() async {
    final result = resolver.chapterPositionFromGlobal(currentPosition);
    final next = result.chapterIndex + 1;

    if (next < queue.value.length) {
      await skipToQueueItem(next);
    }
  }

  static const skipToPreviousBuffer = Duration(seconds: 3);

  @override
  Future<void> skipToPrevious() async {
    final result = resolver.chapterPositionFromGlobal(currentPosition);
    if (result.chapterPosition > skipToPreviousBuffer ||
        result.chapterIndex == 0) {
      await skipToQueueItem(result.chapterIndex);
    } else {
      await skipToQueueItem(result.chapterIndex - 1);
    }
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    final target = resolver.resolveSeek(index, Duration.zero);
    if (target != null) {
      await _player.seek(target.trackPosition, index: target.trackIndex);
      _eventController.add(.seek);
    }
  }

  @override
  Future<void> stop() async {
    _eventController.add(.stop);
    await super.stop();
    await _player.stop();
    queue.add([]);
    mediaItem.add(null);
    resolver = PositionResolver.empty;
  }

  @override
  Future<void> onNotificationDeleted() => stop();

  @override
  Future<void> onTaskRemoved() => stop();

  Future<void> dispose() async {
    await _eventController.close();
    await _errorController.close();
    await _player.dispose();
  }
}
