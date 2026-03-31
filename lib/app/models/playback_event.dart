import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback_event.freezed.dart';
part 'playback_event.g.dart';

enum PlaybackEventKind { play, pause, seek, sync, stop, complete }

@freezed
sealed class PlaybackEvent with _$PlaybackEvent {
  const factory PlaybackEvent({
    required DateTime timestamp,
    required Duration position,
    required PlaybackEventKind kind,
    @Default(false) bool syncAttempt,
    @Default(false) bool syncSuccess,
    @Default(false) bool playbackError,
  }) = _PlaybackEvent;

  factory PlaybackEvent.fromJson(Map<String, dynamic> json) =>
      _$PlaybackEventFromJson(json);
}
