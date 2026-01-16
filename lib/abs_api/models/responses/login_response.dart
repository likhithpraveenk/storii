import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/users/server_settings.dart';
import 'package:storii/abs_api/models/users/user.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

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
