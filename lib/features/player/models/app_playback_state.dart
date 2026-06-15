import 'package:storii/shared/helpers/extensions.dart';

enum AppPlaybackStatus { idle, buffering, ready, completed }

const _sentinel = Object();

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

  final String? error;

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
    Object? index = _sentinel,
    Object? error = _sentinel,
  }) => AppPlaybackState(
    status: status ?? this.status,
    isPlaying: isPlaying ?? this.isPlaying,
    position: position ?? this.position,
    bufferedPosition: bufferedPosition ?? this.bufferedPosition,
    speed: speed ?? this.speed,
    volume: volume ?? this.volume,
    index: index == _sentinel ? this.index : index as int?,
    error: error == _sentinel ? this.error : error as String?,
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
