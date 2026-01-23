import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  MyAudioHandler() {
    _player.playbackEventStream.listen(_broadcastState);

    _player.currentIndexStream.listen((index) {
      if (index != null && index < _player.sequence.length) {
        final source = _player.sequence[index];
        if (source.tag is MediaItem) {
          mediaItem.add(source.tag as MediaItem);
        }
      }
    });

    _initAudioSession();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  Future<void> loadBook({
    required List<MediaItem> items,
    required int initialIndex,
    required Duration initialPosition,
    required Uri serverUrl,
    required String? token,
  }) async {
    await _player.setAudioSources(
      items
          .map(
            (item) => AudioSource.uri(
              serverUrl.resolve(item.id),
              headers: {'Authorization': 'Bearer $token'},
              tag: item,
            ),
          )
          .toList(),
      initialIndex: initialIndex,
      initialPosition: initialPosition,
    );

    queue.add(items);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> fastForward() =>
      seek(_player.position + const Duration(seconds: 10));

  @override
  Future<void> rewind() => seek(_player.position - const Duration(seconds: 10));

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
        processingState: switch (_player.processingState) {
          .idle => .idle,
          .loading => .loading,
          .buffering => .buffering,
          .completed => .completed,
          .ready => .ready,
        },
        playing: _player.playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ),
    );
  }
}
