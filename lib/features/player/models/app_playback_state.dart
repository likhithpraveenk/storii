import 'package:storii/features/player/models/app_playback_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

enum AppPlaybackStatus { idle, buffering, ready, completed, error }

const _fakeNull = Object();

class AppPlaybackState {
  final AppPlaybackStatus status;

  final bool isPlaying;

  /// track position
  final Duration position;

  final Duration bufferedPosition;

  final double speed;

  final double volume;

  /// track index
  final int? index;

  final AppPlaybackError? error;

  const AppPlaybackState({
    this.status = .idle,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.bufferedPosition = Duration.zero,
    this.speed = 1.0,
    this.volume = 1.0,
    this.index,
    this.error,
  });

  AppPlaybackState copyWith({
    AppPlaybackStatus? status,
    bool? isPlaying,
    Duration? position,
    Duration? bufferedPosition,
    double? speed,
    double? volume,
    Object? index = _fakeNull,
    Object? error = _fakeNull,
  }) => AppPlaybackState(
    status: status ?? this.status,
    isPlaying: isPlaying ?? this.isPlaying,
    position: position ?? this.position,
    bufferedPosition: bufferedPosition ?? this.bufferedPosition,
    speed: speed ?? this.speed,
    volume: volume ?? this.volume,
    index: index == _fakeNull ? this.index : index as int?,
    error: error == _fakeNull ? this.error : error as AppPlaybackError?,
  );

  @override
  String toString() {
    final state = [
      'status: ${status.name}',
      'playing: $isPlaying',
      'position: ${position.toTime(padHours: true)}',
      'buffered: ${bufferedPosition.toTime(padHours: true)}',
      'speed: ${speed}x',
      'volume: $volume',
      if (index != null) 'index: $index',
      if (error != null) 'error: $error',
    ].join(', ');
    return 'AppPlaybackState($state)';
  }
}
