import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_permissions.freezed.dart';
part 'user_permissions.g.dart';

@freezed
sealed class UserPermissions with _$UserPermissions {
  const factory UserPermissions({
    bool? download,
    bool? update,
    bool? delete,
    bool? upload,
    bool? createEreader,
    bool? accessAllLibraries,
    bool? accessAllTags,
    bool? accessExplicitContent,
    bool? selectedTagsNotAccessible,
  }) = _UserPermissions;

  factory UserPermissions.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionsFromJson(json);
}
