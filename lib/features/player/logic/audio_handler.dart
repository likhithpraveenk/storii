import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';

class AppAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _player = AudioPlayer();
  late final ProviderContainer _container;

  AppAudioHandler(ProviderContainer container) {
    _container = container;
    _player.playbackEventStream.listen(_broadcastState);

    // // updating mediaItem from sequence
    // _player.sequenceStateStream.listen((sequenceState) {
    //   final currentItem = sequenceState.currentSource?.tag as MediaItem?;
    //   if (currentItem != null) {
    //     mediaItem.add(currentItem);
    //   }
    // });

    _initAudioSession();
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = _player.playing;
    final queueIndex = event.currentIndex ?? 0;
    if (queue.value.isEmpty || queueIndex >= queue.value.length) return;

    final currentTrackItem = queue.value[queueIndex];
    final startOffset =
        (currentTrackItem.extras?['startOffset'] as double? ?? 0.0).toDuration;

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
        speed: _container.read(speedProvider),
        queueIndex: queueIndex,
      ),
    );
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  Future<void> setSources(
    List<AudioSource> sources, {
    int initialIndex = 0,
    Duration initialPosition = Duration.zero,
  }) async {
    final mediaItems = sources
        .whereType<UriAudioSource>()
        .map((source) => source.tag as MediaItem)
        .toList();
    queue.add(mediaItems);

    // setting single media item with global values
    final firstMediaItem = mediaItems.first;
    final totalDuration =
        (firstMediaItem.extras?['totalDuration'] as double? ?? 0.0).toDuration;
    final globalMediaItem = firstMediaItem.copyWith(
      id: 'global_${firstMediaItem.extras?['itemId']}',
      duration: totalDuration,
    );
    mediaItem.add(globalMediaItem);
    // setting single media item with global values

    await _player.setAudioSources(
      sources,
      initialIndex: initialIndex,
      initialPosition: initialPosition,
    );
  }

  Stream<Duration> get positionStream {
    return Rx.combineLatest3<int?, Duration, PlaybackState, Duration>(
      _player.currentIndexStream,
      _player.positionStream,
      playbackState,
      (index, localPosition, state) {
        if (state.processingState == .loading ||
            state.processingState == .idle) {
          return Duration.zero;
        }

        return _currentGlobalPosition(index, localPosition);
      },
    ).distinct();
  }

  Duration _currentGlobalPosition(int? index, Duration position) {
    if (index == null || queue.value.isEmpty || index >= queue.value.length) {
      return Duration.zero;
    }

    final startOffset =
        queue.value[index].extras?['startOffset'] as double? ?? 0.0;
    return startOffset.toDuration + position;
  }

  Future<void> togglePlay() async {
    if (playbackState.value.playing) {
      await pause();
    } else {
      await play();
    }
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> fastForward() async {
    final jump = _container.read(fastForwardProvider);
    await seek(
      _currentGlobalPosition(_player.currentIndex, _player.position) + jump,
    );
  }

  @override
  Future<void> rewind() async {
    final jump = _container.read(rewindProvider);
    await seek(
      _currentGlobalPosition(_player.currentIndex, _player.position) - jump,
    );
  }

  @override
  Future<void> seek(Duration position) async {
    final items = queue.value;
    final targetSeconds = position.inSecondsPrecise;

    final trackIndex = items.lastIndexWhere((item) {
      final offset = item.extras?['startOffset'] as double? ?? 0.0;
      return targetSeconds >= offset;
    });

    if (trackIndex != -1) {
      final startOffset =
          items[trackIndex].extras?['startOffset'] as double? ?? 0.0;
      final localSeconds = targetSeconds - startOffset;

      await _player.seek(localSeconds.toDuration, index: trackIndex);
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    queue.add([]);

    playbackState.add(
      playbackState.value.copyWith(playing: false, processingState: .idle),
    );
    await super.stop();
  }

  @override
  Future<void> onNotificationDeleted() async {
    await stop();
  }

  @override
  Future<void> onTaskRemoved() async {
    await stop();
  }
}
