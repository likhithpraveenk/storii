import 'package:abs_api/src/models/playback_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sessions_response.freezed.dart';
part 'user_sessions_response.g.dart';

@freezed
abstract class UserSessionsResponse with _$UserSessionsResponse {
  const factory UserSessionsResponse({
    required int total,
    required int numPages,
    required int itemsPerPage,
    required List<PlaybackSession> sessions,
  }) = _UserSessionsResponse;

  factory UserSessionsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSessionsResponseFromJson(json);
}
