import 'package:abs_api/abs_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_target.freezed.dart';
part 'cast_target.g.dart';

@freezed
abstract class CastTarget with _$CastTarget {
  const factory CastTarget({
    required Uri serverUrl,
    required List<AudioTrack> tracks,
    required String sessionId,
    required String title,
  }) = _CastTarget;

  const CastTarget._();

  factory CastTarget.fromJson(Map<String, dynamic> json) =>
      _$CastTargetFromJson(json);

  /// Track numbers in the `/track/:index` URL are 1-based
  String urlFor(int trackIndex) => serverUrl
      .resolve(ApiRoutes.sessionOpenTrack(sessionId, '${trackIndex + 1}'))
      .toString();

  Duration globalPosition(int trackIndex, Duration relativePosition) {
    var accumulated = Duration.zero;
    for (var i = 0; i < trackIndex; i++) {
      accumulated += tracks[i].duration;
    }
    return accumulated + relativePosition;
  }
}

/// 0-based track index from a `/track/:index` URL
int? parseTrackIndex(String uri) {
  final match = RegExp(r'/track/(\d+)').firstMatch(uri);
  if (match == null) return null;
  return int.parse(match.group(1)!) - 1;
}
