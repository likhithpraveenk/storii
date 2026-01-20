import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/users/bookmark.dart';
import 'package:storii/abs_api/models/users/media_progress.dart';
import 'package:storii/abs_api/models/users/user_permissions.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  @DateTimeEpochConverter()
  const factory User({
    required String id,
    required String username,
    String? email,
    required UserType type,
    required List<MediaProgress> mediaProgress,
    required List<String> seriesHideFromContinueListening,
    required List<Bookmark> bookmarks,
    required bool isActive,
    required bool isLocked,
    DateTime? lastSeen,
    required DateTime createdAt,
    required UserPermissions permissions,
    required List<String> librariesAccessible,
    required List<String> itemTagsSelected,
    required bool hasOpenIDLink,
    required String accessToken,
    required String? refreshToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
