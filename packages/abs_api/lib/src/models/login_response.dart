import 'package:abs_api/src/models/server_settings.dart';
import 'package:abs_api/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
sealed class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required User user,
    String? userDefaultLibraryId,
    required ServerSettings serverSettings,
    @JsonKey(name: 'Source') required String source,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
