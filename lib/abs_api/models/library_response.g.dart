// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryResponse _$LibraryResponseFromJson(Map<String, dynamic> json) =>
    _LibraryResponse(
      filterData: LibraryFilterData.fromJson(
        json['filterdata'] as Map<String, dynamic>,
      ),
      issues: (json['issues'] as num).toInt(),
      numUserPlaylists: (json['numUserPlaylists'] as num).toInt(),
      library: Library.fromJson(json['library'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LibraryResponseToJson(_LibraryResponse instance) =>
    <String, dynamic>{
      'filterdata': instance.filterData.toJson(),
      'issues': instance.issues,
      'numUserPlaylists': instance.numUserPlaylists,
      'library': instance.library.toJson(),
    };
