import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler with SeekHandler {
  final player = AudioPlayer();

  MyAudioHandler() {
    player.playbackEventStream.listen(_broadcastState);

    player.currentIndexStream.listen((index) {
      if (index != null && index < player.sequence.length) {
        final source = player.sequence[index];
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

  @override
  Future<void> prepareFromUri(Uri uri, [Map<String, dynamic>? extras]) async {
    final List<MediaItem> items = extras?['items'] ?? [];
    final index = extras?['initialIndex'] ?? 0;
    final position = Duration(milliseconds: extras?['initialPositionMs'] ?? 0);
    final token = extras?['token'];

    final sources = items
        .map(
          (item) => AudioSource.uri(
            uri.resolve(item.id),
            headers: token != null ? {'Authorization': 'Bearer $token'} : null,
            tag: item,
          ),
        )
        .toList();

    queue.add(items);
    await player.setAudioSources(
      sources,
      initialIndex: index,
      initialPosition: position,
    );
  }

  @override
  Future<void> fastForward() async {
    const jump = Duration(seconds: 10);
    final currentPos = player.position;
    final trackDuration = player.duration ?? Duration.zero;

    if (currentPos + jump <= trackDuration) {
      return player.seek(currentPos + jump);
    } else {
      final index = player.currentIndex;
      final items = queue.value;

      if (index != null && index < items.length - 1) {
        final overflow = jump - (trackDuration - currentPos);
        return player.seek(overflow, index: index + 1);
      } else {
        return player.seek(trackDuration);
      }
    }
  }

  @override
  Future<void> rewind() async {
    const jump = Duration(seconds: 10);
    final currentPos = player.position;

    if (currentPos >= jump) {
      return player.seek(currentPos - jump);
    } else {
      final index = player.currentIndex;
      if (index != null && index > 0) {
        final previousTrackDuration =
            queue.value[index - 1].duration ?? Duration.zero;
        final remainingJump = jump - currentPos;

        return player.seek(
          previousTrackDuration - remainingJump,
          index: index - 1,
        );
      } else {
        return player.seek(Duration.zero);
      }
    }
  }

  @override
  Future<void> seek(Duration position) async {
    final items = queue.value;
    Duration accumulated = Duration.zero;

    for (int i = 0; i < items.length; i++) {
      final trackLen = items[i].duration ?? Duration.zero;
      if (position < accumulated + trackLen) {
        return player.seek(position - accumulated, index: i);
      }
      accumulated += trackLen;
    }

    if (items.isNotEmpty) {
      return player.seek(items.last.duration, index: items.length - 1);
    }
  }

  @override
  Future<void> stop() async {
    await player.stop();
    await super.stop();
  }

  void _broadcastState(PlaybackEvent event) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          .rewind,
          .skipToPrevious,
          player.playing ? .pause : .play,
          .stop,
          .skipToNext,
          .fastForward,
        ],
        systemActions: const {.seek, .seekForward, .seekBackward},
        androidCompactActionIndices: const [0, 1, 2],
        processingState: switch (player.processingState) {
          .idle => .idle,
          .loading => .loading,
          .buffering => .buffering,
          .completed => .completed,
          .ready => .ready,
        },
        playing: player.playing,
        updatePosition: player.position,
        bufferedPosition: player.bufferedPosition,
        speed: player.speed,
        queueIndex: event.currentIndex,
      ),
    );
  }
}
