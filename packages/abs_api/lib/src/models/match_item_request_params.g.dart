// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_item_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchItemRequestParams _$MatchItemRequestParamsFromJson(
  Map<String, dynamic> json,
) => _MatchItemRequestParams(
  provider: MetadataProvider.fromJson(json['provider'] as Map<String, dynamic>),
  title: json['title'] as String?,
  author: json['author'] as String?,
  overrideDefaults: json['overrideDefaults'] as bool? ?? false,
  isbn: json['isbn'] as String?,
  asin: json['asin'] as String?,
);

Map<String, dynamic> _$MatchItemRequestParamsToJson(
  _MatchItemRequestParams instance,
) => <String, dynamic>{
  'provider': instance.provider.toJson(),
  'title': ?instance.title,
  'author': ?instance.author,
  'overrideDefaults': instance.overrideDefaults,
  'isbn': ?instance.isbn,
  'asin': ?instance.asin,
};
