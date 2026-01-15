import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  AudioHandler() {
    _player.playbackEventStream.listen(_broadcastState);

    _player.currentIndexStream.listen((index) {
      if (index != null && index < _player.sequence.length) {
        final source = _player.sequence[index];
        if (source.tag is MediaItem) {
          mediaItem.add(source.tag as MediaItem);
        }
      }
    });
  }

  Future<void> loadBook(
    List<MediaItem> items,
    int initialIndex,
    Duration initialPos,
  ) async {
    await _player.setAudioSources(
      items
          .map((item) => AudioSource.uri(Uri.parse(item.id), tag: item))
          .toList(),
      initialIndex: initialIndex,
      initialPosition: initialPos,
    );

    queue.add(items);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToQueueItem(int index) =>
      _player.seek(Duration.zero, index: index);

  @override
  Future<void> skipToNext() => _player.seekToNext();

  @override
  Future<void> skipToPrevious() => _player.seekToPrevious();

  @override
  Future<void> setSpeed(double speed) => _player.setSpeed(speed);

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }

  void _broadcastState(PlaybackEvent event) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          .rewind,
          .skipToPrevious,
          _player.playing ? .pause : .play,
          .stop,
          .skipToNext,
          .fastForward,
        ],
        systemActions: const {.seek, .seekForward, .seekBackward},
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: _player.playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ),
    );
  }
}
