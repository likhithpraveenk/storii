import 'package:just_audio/just_audio.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/player/models/app_audio_player.dart';

class JustAudioPlayer implements AppAudioPlayer {
  JustAudioPlayer() {
    _player = AudioPlayer();
  }

  late final AudioPlayer _player;

  @override
  bool get playing => _player.playing;

  @override
  AppProcessingState get processingState => _mapState(_player.processingState);

  @override
  int? get currentIndex => _player.currentIndex;

  @override
  Duration get position => _player.position;

  @override
  Duration get bufferedPosition => _player.bufferedPosition;

  @override
  double get speed => _player.speed;

  @override
  double get volume => _player.volume;

  @override
  Stream<AppPlaybackEvent> get playbackEventStream =>
      _player.playbackEventStream.map(
        (event) => AppPlaybackEvent(
          processingState: _mapState(event.processingState),
          currentIndex: event.currentIndex,
          position: event.updatePosition,
          bufferedPosition: event.bufferedPosition,
        ),
      );

  @override
  Stream<AppProcessingState> get processingStateStream =>
      _player.processingStateStream.map(_mapState);

  @override
  Stream<int?> get currentIndexStream => _player.currentIndexStream;

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

  AppProcessingState _mapState(ProcessingState state) {
    return switch (state) {
      .idle => .idle,
      .loading => .loading,
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
