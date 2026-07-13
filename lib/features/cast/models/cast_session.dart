import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/features/cast/models/cast_device_info.dart';
import 'package:storii/features/cast/models/cast_target.dart';

part 'cast_session.freezed.dart';
part 'cast_session.g.dart';

enum CastStatus { idle, connecting, casting, error }

@freezed
abstract class CastSession with _$CastSession {
  const factory CastSession({
    @Default(CastStatus.idle) CastStatus status,
    CastDeviceInfo? device,
    String? error,
    CastTarget? target,
    @Default(0) int currentTrackIndex,
    @Default(Duration.zero) Duration initialPosition,

    /// current position
    @Default(Duration.zero) Duration currentGlobalPosition,
    String? id,
    String? libraryItemId,
    String? episodeId,
  }) = _CastSession;

  const CastSession._();

  factory CastSession.fromJson(Map<String, dynamic> json) =>
      _$CastSessionFromJson(json);

  bool get isActive => status == .connecting || status == .casting;

  bool get hasNextTrack =>
      target != null && currentTrackIndex + 1 < target!.tracks.length;

  String get nextTrackUrl => target!.urlFor(currentTrackIndex + 1);

  CastSession advancedTo(int newTrackIndex, Duration relativePosition) =>
      copyWith(
        currentTrackIndex: newTrackIndex,
        currentGlobalPosition: target!.globalPosition(
          newTrackIndex,
          relativePosition,
        ),
      );
}
