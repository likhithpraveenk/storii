import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/bookmark.dart';
import 'package:storii/abs_api/models/enums.dart';
import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/media_progress.dart';
import 'package:storii/abs_api/models/user_permissions.dart';

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
    bool? isActive,
    bool? isLocked,
    DateTime? lastSeen,
    required DateTime createdAt,
    required UserPermissions permissions,
    required List<String> librariesAccessible,
    required List<String> itemTagsSelected,
    bool? hasOpenIDLink,
    String? accessToken,
    String? refreshToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
