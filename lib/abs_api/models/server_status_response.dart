import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/enums.dart';

part 'server_status_response.freezed.dart';
part 'server_status_response.g.dart';

@freezed
sealed class ServerStatusResponse with _$ServerStatusResponse {
  const factory ServerStatusResponse({
    String? app,
    String? serverVersion,
    required bool isInit,
    String? language,
    List<AuthMethod>? authMethods,
    @JsonKey(name: 'ConfigPath') String? configPath,
    @JsonKey(name: 'MetadataPath') String? metadataPath,
    AuthFormData? authFormData,
  }) = _ServerStatusResponse;

  factory ServerStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerStatusResponseFromJson(json);
}

@freezed
sealed class AuthFormData with _$AuthFormData {
  const factory AuthFormData({
    String? authLoginCustomMessage,
    String? authOpenIDButtonText,
    bool? authOpenIDAutoLaunch,
  }) = _AuthFormData;

  factory AuthFormData.fromJson(Map<String, dynamic> json) =>
      _$AuthFormDataFromJson(json);
}
