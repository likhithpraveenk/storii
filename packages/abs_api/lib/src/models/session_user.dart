import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_user.freezed.dart';
part 'session_user.g.dart';

@freezed
abstract class SessionUser with _$SessionUser {
  const factory({required String id, required String username}) = _SessionUser;

  factory fromJson(Map<String, dynamic> json) => _$SessionUserFromJson(json);
}
