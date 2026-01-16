import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/books/playback_session.dart';

part 'sessions_response.freezed.dart';
part 'sessions_response.g.dart';

@freezed
abstract class SessionsResponse with _$SessionsResponse {
  const factory SessionsResponse({
    required int total,
    required int numPages,
    required int itemsPerPage,
    required List<PlaybackSession> sessions,
    String? userFilter,
  }) = _SessionsResponse;

  factory SessionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionsResponseFromJson(json);
}
