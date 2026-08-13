import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_cover_response.freezed.dart';
part 'update_cover_response.g.dart';

@freezed
sealed class UpdateCoverResponse with _$UpdateCoverResponse {
  const factory UpdateCoverResponse({
    required bool success,
    required String cover,
  }) = _UpdateCoverResponse;

  factory UpdateCoverResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCoverResponseFromJson(json);
}
