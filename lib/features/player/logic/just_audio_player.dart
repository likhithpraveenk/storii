import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/player/models/app_audio_player.dart';
import 'package:storii/features/player/models/app_audio_source.dart';
import 'package:storii/features/player/models/app_playback_state.dart';

part 'just_audio_player.g.dart';

@Riverpod(keepAlive: true)
AppAudioPlayer justAudioPlayer(Ref ref) {
  final player = JustAudioPlayer(
    AudioPlayer(
      audioLoadConfiguration: const AudioLoadConfiguration(
        // TODO: settings for audio buffer
        androidLoadControl: AndroidLoadControl(),
      ),
    ),
  );
  ref.onDispose(player.dispose);
  return player;
}

class JustAudioPlayer implements AppAudioPlayer {
  JustAudioPlayer(this._player);

  late final AudioPlayer _player;

  @override
  int? get index => _player.currentIndex;

  @override
  Duration get position => _player.position;

  @override
  bool get isPlaying => _player.playing;

  @override
  AppPlaybackState get state => .new(
    status: _mapState(_player.processingState),
    index: _player.currentIndex,
    position: _player.position,
    bufferedPosition: _player.bufferedPosition,
    isPlaying: _player.playing,
    speed: _player.speed,
    volume: _player.volume,
  );

  @override
  Stream<AppPlaybackState> get stateStream => _player.playbackEventStream.map(
    (event) => .new(
      status: _mapState(event.processingState),
      index: event.currentIndex,
      position: event.updatePosition,
      bufferedPosition: event.bufferedPosition,
      error: event.errorMessage,
      isPlaying: _player.playing,
      speed: _player.speed,
      volume: _player.volume,
    ),
  );

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Stream<double> get volumeStream => _player.volumeStream;

  @override
  Future<void> setSpeed(double speed) => _player.setSpeed(speed);

  @override
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position, {int? index}) =>
      _player.seek(position, index: index);

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> setAudioSources(
    List<AppAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final justAudioSources = sources.map((s) {
      switch (s.type) {
        case .hls:
          return HlsAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
        case .dash:
          return DashAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
        default:
          return ProgressiveAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
      }
    }).toList();

    try {
      await _player.setAudioSources(
        justAudioSources,
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

  AppPlaybackStatus _mapState(ProcessingState state) {
    return switch (state) {
      .idle => .idle,
      .loading => .buffering,
      .buffering => .buffering,
      .ready => .ready,
      .completed => .completed,
    };
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }
}
