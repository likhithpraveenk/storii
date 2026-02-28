// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String?,
  type: $enumDecode(_$UserTypeEnumMap, json['type']),
  mediaProgress: (json['mediaProgress'] as List<dynamic>)
      .map((e) => MediaProgress.fromJson(e as Map<String, dynamic>))
      .toList(),
  seriesHideFromContinueListening:
      (json['seriesHideFromContinueListening'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  bookmarks: (json['bookmarks'] as List<dynamic>)
      .map((e) => Bookmark.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool,
  isLocked: json['isLocked'] as bool,
  lastSeen: _$JsonConverterFromJson<int, DateTime>(
    json['lastSeen'],
    const DateTimeEpochConverter().fromJson,
  ),
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  permissions: UserPermissions.fromJson(
    json['permissions'] as Map<String, dynamic>,
  ),
  librariesAccessible: (json['librariesAccessible'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  itemTagsSelected: (json['itemTagsSelected'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  hasOpenIDLink: json['hasOpenIDLink'] as bool,
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': ?instance.email,
  'type': _$UserTypeEnumMap[instance.type]!,
  'mediaProgress': instance.mediaProgress.map((e) => e.toJson()).toList(),
  'seriesHideFromContinueListening': instance.seriesHideFromContinueListening,
  'bookmarks': instance.bookmarks.map((e) => e.toJson()).toList(),
  'isActive': instance.isActive,
  'isLocked': instance.isLocked,
  'lastSeen': ?_$JsonConverterToJson<int, DateTime>(
    instance.lastSeen,
    const DateTimeEpochConverter().toJson,
  ),
  'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
  'permissions': instance.permissions.toJson(),
  'librariesAccessible': instance.librariesAccessible,
  'itemTagsSelected': instance.itemTagsSelected,
  'hasOpenIDLink': instance.hasOpenIDLink,
  'accessToken': ?instance.accessToken,
  'refreshToken': ?instance.refreshToken,
};

const _$UserTypeEnumMap = {
  UserType.root: 'root',
  UserType.guest: 'guest',
  UserType.user: 'user',
  UserType.admin: 'admin',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
