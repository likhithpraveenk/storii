// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchItemResponse _$MatchItemResponseFromJson(Map<String, dynamic> json) =>
    _MatchItemResponse(
      updated: json['updated'] as bool,
      libraryItem: LibraryItem.fromJson(
        json['libraryItem'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$MatchItemResponseToJson(_MatchItemResponse instance) =>
    <String, dynamic>{
      'updated': instance.updated,
      'libraryItem': instance.libraryItem.toJson(),
    };
