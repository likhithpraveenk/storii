import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/player/logic/position_resolver.dart';
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
  final _player = AudioPlayer();
  PositionResolver resolver = PositionResolver.empty;

  final _eventController = StreamController<AudioHandlerEvent>.broadcast();

  final Duration Function() getSkipForward;
  final Duration Function() getSkipBackward;

  ProcessingState? _lastProcessingState;

  AppAudioHandler({
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
    _player.playbackEventStream.listen((event) {
      if (event.processingState == .completed) _eventController.add(.complete);
      if (event.processingState == .buffering) _eventController.add(.buffering);
      if (_lastProcessingState == .buffering &&
          event.processingState == .ready &&
          _player.playing) {
        _eventController.add(.bufferingComplete);
      }

      _lastProcessingState = event.processingState;

      _updatePlaybackState();
    }, onError: logError);
    setSpeed(speed);
    _initAudioSession();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  void _updatePlaybackState() {
    if (_player.processingState == .idle ||
        _player.processingState == .loading) {
      return;
    }

    final resolved = resolver.resolveChapterFromTrack(
      _player.currentIndex,
      _player.position,
    );
    if (resolved == null) return;

    mediaItem.add(queue.value.elementAtOrNull(resolved.chapterIndex));

    final resolvedBuffered = resolver.resolveChapterFromTrack(
      _player.currentIndex,
      _player.bufferedPosition,
    );

    final oldPlaybackState = playbackState.value;
    playbackState.add(
      playbackState.value.copyWith(
        processingState: switch (_player.processingState) {
          .idle => .idle,
          .loading => .loading,
          .buffering => .buffering,
          .ready => .ready,
          .completed => .completed,
        },
        playing: _player.playing,
        updatePosition: resolved.chapterPosition,
        bufferedPosition:
            resolvedBuffered?.chapterPosition ??
            oldPlaybackState.bufferedPosition,
        speed: _player.speed,
        queueIndex: resolved.chapterIndex,
      ),
    );
  }

  void logError(Object e, StackTrace st) {
    log('Error from player stream: $e');
    if (e is PlayerException) {
      playbackState.add(
        playbackState.value.copyWith(
          processingState: .error,
          errorMessage: e.message,
        ),
      );
    }
    _eventController.add(.error);
  }

  Stream<ProcessingState> get processingStateStream =>
      _player.processingStateStream;

  Stream<AudioHandlerEvent> get events => _eventController.stream;

  // position for sync operations
  Duration get currentPosition =>
      resolver.globalPositionFromTrack(_player.currentIndex, _player.position);

  Stream<Duration> get positionStream => Rx.combineLatest2(
    _player.currentIndexStream.startWith(_player.currentIndex),
    _player.positionStream,
    (index, position) => resolver.globalPositionFromTrack(index, position),
  ).throttleTime(const Duration(milliseconds: 200));

  Stream<Duration> get chapterPositionStream => Rx.combineLatest2(
    _player.currentIndexStream.startWith(_player.currentIndex),
    _player.positionStream,
    (index, position) => resolver.chapterPositionFromTrack(index, position),
  ).throttleTime(const Duration(milliseconds: 200));

  Stream<Chapter?> get currentChapterStream => Rx.combineLatest2(
    _player.currentIndexStream.startWith(_player.currentIndex),
    _player.positionStream,
    (index, position) => resolver.chapterFromTrack(index, position),
  ).distinct();

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  double get volume => _player.volume;

  Stream<double> get volumeStream => _player.volumeStream;

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume.clamp(0.0, 1.0));
  }

  Future<void> setSources(
    List<UriAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final trackItems = sources.map((s) => s.tag as MediaItem).toList();

    resolver = PositionResolver.from(trackItems);
    final chapterItems = resolver.chapters
        .map((c) => c.toMediaItem(trackItems.first))
        .toList();

    queue.add(chapterItems);

    try {
      await _player.setAudioSources(
        sources,
        initialIndex: initialIndex,
        initialPosition: initialPosition,
      );
    } on PlayerException catch (e) {
      LogService.log(
        'Error code: ${e.code}; message: ${e.message}',
        level: .error,
      );
    } on PlayerInterruptedException catch (e) {
      LogService.log('Connection interrupted: ${e.message}', level: .error);
    } catch (e) {
      LogService.log('An unknown error occurred: $e', level: .error);
    }
  }

  Future<void> togglePlay() async {
    if (_player.playing) {
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
    final next = (playbackState.value.queueIndex ?? 0) + 1;
    if (next < queue.value.length) await skipToQueueItem(next);
  }

  @override
  Future<void> skipToPrevious() async {
    final chapterIndex = playbackState.value.queueIndex ?? 0;
    final chapterPosition = resolver.chapterPositionFromGlobal(currentPosition);
    if (chapterPosition.inSeconds > 5 || chapterIndex == 0) {
      await skipToQueueItem(0);
    } else {
      await skipToQueueItem(chapterIndex - 1);
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
}
