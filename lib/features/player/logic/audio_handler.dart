import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/player/logic/position_resolver.dart';

enum AudioHandlerEvent { play, pause, seek, stop, complete, buffering, error }

class AppAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _player = AudioPlayer();
  PositionResolver _resolver = PositionResolver.empty;

  final _eventController = StreamController<AudioHandlerEvent>.broadcast();

  final Duration Function() getSkipForward;
  final Duration Function() getSkipBackward;

  AppAudioHandler({
    required double speed,
    required this.getSkipForward,
    required this.getSkipBackward,
  }) {
    _player.playbackEventStream.listen(_broadcastState, onError: logError);
    _player.processingStateStream.listen((state) {
      if (state == .completed) _eventController.add(.complete);
      if (state == .buffering) _eventController.add(.buffering);
    });
    setSpeed(speed);
    _initAudioSession();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = _player.playing;
    final trackIndex = event.currentIndex ?? 0;

    final resolved = _resolver.resolveChapter(trackIndex, event.updatePosition);
    final resolvedBuffered = _resolver.resolveChapter(
      trackIndex,
      event.bufferedPosition,
    );
    final chapterIndex = resolved?.chapterIndex ?? trackIndex;
    final chapterPosition = resolved?.chapterPosition ?? event.updatePosition;
    final chapterBuffered =
        resolvedBuffered?.chapterPosition ?? event.bufferedPosition;

    mediaItem.add(queue.value.elementAtOrNull(chapterIndex));

    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          .rewind,
          playing ? .pause : .play,
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
        processingState: switch (event.processingState) {
          .idle => .idle,
          .loading => .loading,
          .buffering => .buffering,
          .ready => .ready,
          .completed => .completed,
        },
        playing: playing,
        updatePosition: chapterPosition,
        bufferedPosition: chapterBuffered,
        speed: _player.speed,
        queueIndex: chapterIndex,
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

  Stream<Duration> get positionStream => Rx.combineLatest2(
    _player.currentIndexStream.startWith(_player.currentIndex ?? 0),
    _player.positionStream,
    (index, position) => _resolver.globalPositionFromTrack(index, position),
  );

  Stream<Duration> get chapterPositionStream => Rx.combineLatest2(
    _player.currentIndexStream.startWith(_player.currentIndex ?? 0),
    _player.positionStream,
    (index, position) => _resolver.chapterPositionFromTrack(index, position),
  );

  Stream<Chapter?> get currentChapterStream => playbackState.map(
    (state) => state.queueIndex == null
        ? null
        : _resolver.chapterAt(state.queueIndex!),
  );

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  Future<void> setSources(
    List<ProgressiveAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final trackItems = sources.map((s) => s.tag as MediaItem).toList();

    _resolver = PositionResolver.from(trackItems);
    final chapterItems = _resolver.chapters
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
    if (playbackState.value.playing) {
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
    final currentPosition = playbackState.value.position;
    await seek(currentPosition + offset);
  }

  @override
  Future<void> seek(Duration position) async {
    if (queue.value.isEmpty) return;

    final chapterIndex = playbackState.value.queueIndex ?? 0;
    final target = _resolver.resolveSeek(chapterIndex, position);

    if (target != null) {
      _eventController.add(.seek);
      await _player.seek(target.trackPosition, index: target.trackIndex);
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
    final position = playbackState.value.position;
    if (position.inSeconds > 5 || chapterIndex == 0) {
      await seek(Duration.zero);
    } else {
      await skipToQueueItem(chapterIndex - 1);
    }
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    final target = _resolver.resolveSeek(index, Duration.zero);
    if (target != null) {
      _eventController.add(.seek);
      await _player.seek(target.trackPosition, index: target.trackIndex);
    }
  }

  @override
  Future<void> stop() async {
    _eventController.add(.stop);
    await _player.stop();
    queue.add([]);
    mediaItem.add(null);
    _resolver = PositionResolver.empty;
    await super.stop();
  }

  @override
  Future<void> onNotificationDeleted() => stop();

  @override
  Future<void> onTaskRemoved() => stop();
}
