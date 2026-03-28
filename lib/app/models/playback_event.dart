import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback_event.freezed.dart';
part 'playback_event.g.dart';

enum PlaybackEventKind { play, pause, seek, sync, stop, complete }

@freezed
sealed class ServerSyncResult with _$ServerSyncResult {
  const factory ServerSyncResult({
    required bool attempted,
    required bool success,
    String? message,
  }) = _ServerSyncResult;

  factory ServerSyncResult.fromJson(Map<String, dynamic> json) =>
      _$ServerSyncResultFromJson(json);
}

@freezed
sealed class PlaybackEvent with _$PlaybackEvent {
  const factory PlaybackEvent({
    required DateTime timestamp,
    required Duration position,
    required PlaybackEventKind kind,
    ServerSyncResult? syncResult,
  }) = _PlaybackEvent;

  factory PlaybackEvent.fromJson(Map<String, dynamic> json) =>
      _$PlaybackEventFromJson(json);
}
