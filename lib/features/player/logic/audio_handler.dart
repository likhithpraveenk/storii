import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/player/logic/track_position_resolver.dart';

enum AudioHandlerEvent { play, pause, seek, stop }

class AppAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _player = AudioPlayer();
  TrackPositionResolver _resolver = TrackPositionResolver.empty;

  final Duration Function() getFastForward;
  final Duration Function() getRewind;

  AppAudioHandler({
    required double speed,
    required this.getFastForward,
    required this.getRewind,
  }) {
    _player.playbackEventStream.listen(_broadcastState, onError: logError);
    setSpeed(speed);
    _initAudioSession();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = _player.playing;
    final queueIndex = event.currentIndex ?? 0;

    final startOffset = _resolver.globalPosition(queueIndex, Duration.zero);

    playbackState.add(
      playbackState.value.copyWith(
        controls: [.rewind, playing ? .pause : .play, .fastForward, .stop],
        systemActions: const {
          .seek,
          .seekForward,
          .seekBackward,
          .playPause,
          .rewind,
          .fastForward,
          .stop,
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
        updatePosition: event.updatePosition + startOffset,
        bufferedPosition: event.bufferedPosition + startOffset,
        speed: _player.speed,
        queueIndex: queueIndex,
      ),
    );
  }

  void logError(Object e, StackTrace st) {
    if (e is PlayerException) {
      log('Error from player stream: ${e.message}');
      playbackState.add(
        playbackState.value.copyWith(
          processingState: .error,
          errorMessage: e.message,
        ),
      );
    }
  }

  Stream<AudioHandlerEvent> get events {
    final playPauseEvents = playbackState
        .map((s) => s.playing)
        .distinct()
        .pairwise()
        .map(
          (pair) =>
              pair.last ? AudioHandlerEvent.play : AudioHandlerEvent.pause,
        );

    final stopEvents = playbackState
        .map((s) => s.processingState)
        .distinct()
        .skip(1)
        .where((state) => state == .idle)
        .map((_) => AudioHandlerEvent.stop);

    final seekEvents = _player.positionDiscontinuityStream
        .where((d) => d.reason == .seek)
        .map((_) => AudioHandlerEvent.seek);

    return Rx.merge<AudioHandlerEvent>([
      playPauseEvents,
      stopEvents,
      seekEvents,
    ]);
  }

  Duration get _currentPosition =>
      _resolver.globalPosition(_player.currentIndex, _player.position);

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  Future<void> setSources(
    List<AudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final mediaItems = sources
        .whereType<UriAudioSource>()
        .map((source) => source.tag as MediaItem)
        .toList();
    _resolver = TrackPositionResolver.from(mediaItems);
    queue.add(mediaItems);

    try {
      await _player.setAudioSources(
        sources,
        initialIndex: initialIndex,
        initialPosition: initialPosition,
      );
    } on PlayerException catch (e) {
      log('Error code: ${e.code}; message: ${e.message}');
    } on PlayerInterruptedException catch (e) {
      log('Connection interrupted: ${e.message}');
    } catch (e) {
      log('An unknown error occurred: $e');
    }

    //! setting single media item with global values
    final first = mediaItems.first;
    mediaItem.add(
      first.copyWith(
        id: first.extras!['itemId'] as String,
        duration: Duration(microseconds: first.extras!['totalDuration'] as int),
        artUri: first.artUri,
      ),
    );
  }

  Stream<Duration> get positionStream {
    return Rx.combineLatest2(
      _player.currentIndexStream,
      _player.positionStream,
      (index, pos) => _resolver.globalPosition(index, pos),
    ).where((_) {
      final state = playbackState.value.processingState;
      return state != .loading && state != .idle;
    }).distinct();
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
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> fastForward() => seek(_currentPosition + getFastForward());

  @override
  Future<void> rewind() => seek(
    Duration(
      microseconds: (_currentPosition - getRewind()).inMicroseconds.clamp(
        0,
        double.maxFinite.toInt(),
      ),
    ),
  );

  @override
  Future<void> seek(Duration position) async {
    if (queue.value.isEmpty) return;

    final trackIndex = _resolver.trackIndexFor(position);

    if (trackIndex != -1) {
      await _player.seek(
        _resolver.localSeconds(trackIndex, position),
        index: trackIndex,
      );
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();

    queue.add([]);
    _resolver = TrackPositionResolver.empty;

    await super.stop();
  }

  @override
  Future<void> onNotificationDeleted() => stop();

  @override
  Future<void> onTaskRemoved() => stop();
}
