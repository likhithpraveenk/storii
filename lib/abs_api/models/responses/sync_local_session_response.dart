import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_local_session_response.freezed.dart';
part 'sync_local_session_response.g.dart';

@freezed
abstract class SyncLocalSessionResponse with _$SyncLocalSessionResponse {
  const factory SyncLocalSessionResponse({
    required String id,
    required bool success,
    String? error,
    bool? progressSynced,
  }) = _SyncLocalSessionResponse;

  factory SyncLocalSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncLocalSessionResponseFromJson(json);
}
