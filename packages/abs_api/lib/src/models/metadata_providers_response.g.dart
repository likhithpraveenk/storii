// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_providers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetadataProvidersResponse _$MetadataProvidersResponseFromJson(
  Map<String, dynamic> json,
) => _MetadataProvidersResponse(
  books:
      (json['books'] as List<dynamic>?)
          ?.map((e) => MetadataProvider.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  booksCovers:
      (json['booksCovers'] as List<dynamic>?)
          ?.map((e) => MetadataProvider.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  podcasts:
      (json['podcasts'] as List<dynamic>?)
          ?.map((e) => MetadataProvider.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MetadataProvidersResponseToJson(
  _MetadataProvidersResponse instance,
) => <String, dynamic>{
  'books': instance.books.map((e) => e.toJson()).toList(),
  'booksCovers': instance.booksCovers.map((e) => e.toJson()).toList(),
  'podcasts': instance.podcasts.map((e) => e.toJson()).toList(),
};
