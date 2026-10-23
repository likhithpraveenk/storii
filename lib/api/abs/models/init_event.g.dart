// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InitEvent _$InitEventFromJson(Map<String, dynamic> json) => _InitEvent(
  userId: json['userId'] as String,
  username: json['username'] as String,
  usersOnline:
      (json['usersOnline'] as List<dynamic>?)
          ?.map((e) => UserMinimal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$InitEventToJson(_InitEvent instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'usersOnline': instance.usersOnline.map((e) => e.toJson()).toList(),
    };
