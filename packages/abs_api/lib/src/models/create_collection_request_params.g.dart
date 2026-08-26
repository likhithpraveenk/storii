// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCollectionRequestParams _$CreateCollectionRequestParamsFromJson(
  Map<String, dynamic> json,
) => _CreateCollectionRequestParams(
  libraryId: json['libraryId'] as String,
  name: json['name'] as String,
  books: (json['books'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CreateCollectionRequestParamsToJson(
  _CreateCollectionRequestParams instance,
) => <String, dynamic>{
  'libraryId': instance.libraryId,
  'name': instance.name,
  'books': instance.books,
};
