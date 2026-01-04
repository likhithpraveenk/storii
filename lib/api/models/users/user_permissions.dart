import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_permissions.freezed.dart';
part 'user_permissions.g.dart';

@freezed
sealed class UserPermissions with _$UserPermissions {
  const factory UserPermissions({
    required bool download,
    required bool update,
    required bool delete,
    required bool upload,
    required bool createEreader,
    required bool accessAllLibraries,
    required bool accessAllTags,
    required bool accessExplicitContent,
    required bool selectedTagsNotAccessible,
  }) = _UserPermissions;

  factory UserPermissions.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionsFromJson(json);
}
