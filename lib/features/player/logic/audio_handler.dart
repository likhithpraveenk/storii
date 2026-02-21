import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';

class AppAudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();
  late final ProviderContainer _container;

  AppAudioHandler(ProviderContainer container) {
    _container = container;
    _player.playbackEventStream.listen(_broadcastState);

    _player.sequenceStateStream.listen((sequenceState) {
      final currentItem = sequenceState.currentSource?.tag as MediaItem?;
      if (currentItem != null) {
        mediaItem.add(currentItem);
      }
    });

    _initAudioSession();
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = _player.playing;
    final queueIndex = _player.currentIndex ?? 0;
    final items = queue.value;
    if (items.isEmpty || queueIndex >= items.length) return;

    final currentTrackItem = items[queueIndex];
    final startOffset = Duration(
      milliseconds: currentTrackItem.extras?['startOffset'] ?? 0,
    );

    playbackState.add(
      playbackState.value.copyWith(
        controls: [.rewind, playing ? .pause : .play, .fastForward],
        systemActions: const {.seek, .seekForward, .seekBackward},
        androidCompactActionIndices: const [0, 1, 2],
        processingState: switch (_player.processingState) {
          .idle => .idle,
          .loading => .loading,
          .buffering => .buffering,
          .ready => .ready,
          .completed => .completed,
        },
        playing: playing,
        updatePosition: _player.position + startOffset,
        bufferedPosition: _player.bufferedPosition + startOffset,
        speed: _container.read(speedProvider),
        queueIndex: queueIndex,
      ),
    );

    if (mediaItem.value != currentTrackItem) {
      mediaItem.add(currentTrackItem);
    }
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
    await _player.setAudioSources(
      sources,
      initialIndex: initialIndex,
      initialPosition: initialPosition,
    );
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
    final newPosition = _player.position + jump;
    await seek(newPosition);
    // final currentPos = _player.position;
    // final trackDuration = _player.duration ?? Duration.zero;

    // if (currentPos + jump <= trackDuration) {
    //   return _player.seek(currentPos + jump);
    // } else {
    //   final index = _player.currentIndex;
    //   final items = queue.value;

    //   if (index != null && index < items.length - 1) {
    //     final overflow = jump - (trackDuration - currentPos);
    //     return _player.seek(overflow, index: index + 1);
    //   } else {
    //     return _player.seek(trackDuration);
    //   }
    // }
  }

  @override
  Future<void> rewind() async {
    final jump = _container.read(rewindProvider);
    final newPosition = _player.position - jump;
    await seek(newPosition);
    // final currentPos = _player.position;

    // if (currentPos >= jump) {
    //   return _player.seek(currentPos - jump);
    // } else {
    //   final index = _player.currentIndex;
    //   if (index != null && index > 0) {
    //     final previousTrackDuration =
    //         queue.value[index - 1].duration ?? Duration.zero;
    //     final remainingJump = jump - currentPos;

    //     return _player.seek(
    //       previousTrackDuration - remainingJump,
    //       index: index - 1,
    //     );
    //   } else {
    //     return _player.seek(Duration.zero);
    //   }
    // }
  }

  @override
  Future<void> seek(Duration position) async {
    final items = queue.value;
    var accumulated = Duration.zero;

    for (var i = 0; i < items.length; i++) {
      final trackDuration = Duration(
        milliseconds: items[i].extras?['trackDuration'] ?? 0,
      );
      if (position < accumulated + trackDuration) {
        final localOffset = position - accumulated;
        return _player.seek(localOffset, index: i);
      }
      accumulated += trackDuration;
    }
  }

  @override
  Future<void> stop() async {
    mediaItem.add(null);
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: .idle,
        controls: [],
      ),
    );
    await _player.stop();
    await super.stop();
  }

  @override
  Future<void> onNotificationDeleted() async {
    await stop();
  }
}
