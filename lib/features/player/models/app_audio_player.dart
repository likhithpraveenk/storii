import 'package:storii/features/player/models/app_audio_source.dart';
import 'package:storii/features/player/models/app_playback_state.dart';

abstract class AppAudioPlayer {
  int? get index;
  Duration get position;
  AppPlaybackState get state;
  bool get isPlaying;

  Stream<AppPlaybackState> get stateStream;
  Stream<Duration> get positionStream;
  Stream<double> get volumeStream;

  Future<void> setAudioSources(
    List<AppAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  });
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> seek(Duration position, {int? index});
  Future<void> setSpeed(double speed);
  Future<void> setVolume(double volume);
  Future<void> dispose();
}
