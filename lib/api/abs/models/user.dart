import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/bookmark.dart';
import 'package:storii/api/abs/models/enums.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/media_progress.dart';
import 'package:storii/api/abs/models/playback_session.dart';
import 'package:storii/api/abs/models/user_permissions.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  @DateTimeEpochConverter()
  const factory({
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

  factory fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
sealed class UserMinimal with _$UserMinimal {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String username,
    required UserType type,
    PlaybackSession? session,
    DateTime? lastSeen,
    required DateTime createdAt,
  }) = _UserMinimal;

  factory fromJson(Map<String, dynamic> json) => _$UserMinimalFromJson(json);
}
