import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class UserDomain with _$UserDomain {
  const factory({
    required String id,
    required String username,
    required String userType,
    required Uri serverUrl,
  }) = _User;

  factory fromJson(Map<String, dynamic> json) => _$UserDomainFromJson(json);
}
