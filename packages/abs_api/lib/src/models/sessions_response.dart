import 'package:abs_api/src/models/playback_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_response.freezed.dart';
part 'sessions_response.g.dart';

@freezed
abstract class SessionsResponse with _$SessionsResponse {
  const factory({
    required int total,
    required int numPages,
    required int itemsPerPage,
    required List<PlaybackSession> sessions,
    String? userFilter,
  }) = _SessionsResponse;

  factory fromJson(Map<String, dynamic> json) =>
      _$SessionsResponseFromJson(json);
}
