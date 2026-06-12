import 'package:storii/shared/helpers/audio_mime_helper.dart';

class AppAudioSource {
  const AppAudioSource({
    required this.uri,
    required this.tag,
    required this.type,
    this.headers = const {},
    this.duration,
  });

  final Uri uri;
  final dynamic tag;
  final AudioMimeType type;
  final Map<String, String> headers;
  final Duration? duration;
}

class AppPlaybackEvent {
  final AppProcessingState processingState;
  final int? currentIndex;
  final Duration position;
  final Duration bufferedPosition;

  const AppPlaybackEvent({
    required this.processingState,
    required this.currentIndex,
    required this.position,
    required this.bufferedPosition,
  });
}

enum AppProcessingState { idle, loading, buffering, ready, completed }

class AppPlaybackState {
  final AppProcessingState processingState;
  final bool playing;
  final Duration position;
  final Duration bufferedPosition;
  final double speed;
  final int? queueIndex;
  final String? errorMessage;

  const AppPlaybackState({
    this.processingState = AppProcessingState.idle,
    this.playing = false,
    this.position = Duration.zero,
    this.bufferedPosition = Duration.zero,
    this.speed = 1.0,
    this.queueIndex,
    this.errorMessage,
  });

  AppPlaybackState copyWith({
    AppProcessingState? processingState,
    bool? playing,
    Duration? position,
    Duration? bufferedPosition,
    double? speed,
    int? queueIndex,
    String? errorMessage,
  }) => AppPlaybackState(
    processingState: processingState ?? this.processingState,
    playing: playing ?? this.playing,
    position: position ?? this.position,
    bufferedPosition: bufferedPosition ?? this.bufferedPosition,
    speed: speed ?? this.speed,
    queueIndex: queueIndex ?? this.queueIndex,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}

abstract class AppAudioPlayer {
  bool get playing;
  AppProcessingState get processingState;
  int? get currentIndex;
  Duration get position;
  Duration get bufferedPosition;
  double get speed;
  double get volume;

  Stream<AppPlaybackEvent> get playbackEventStream;
  Stream<AppProcessingState> get processingStateStream;
  Stream<int?> get currentIndexStream;
  Stream<Duration> get positionStream;
  Stream<double> get volumeStream;

  Future<void> setSpeed(double speed);
  Future<void> setVolume(double volume);
  Future<void> play();
  Future<void> pause();
  Future<void> seek(Duration position, {int? index});
  Future<void> stop();
  Future<void> dispose();

  Future<void> setAudioSources(
    List<AppAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  });
}
