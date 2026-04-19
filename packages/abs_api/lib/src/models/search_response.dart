import 'package:abs_api/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
abstract class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    @Default([]) List<SearchResultItem> narrators,
    @Default([]) List<Author> authors,
    @Default([]) List<SearchResultItem> tags,
    @Default([]) List<SearchResultItem> genres,

    @JsonKey(readValue: _itemList) @Default([]) List<LibraryItem> book,
    @JsonKey(readValue: _itemList) @Default([]) List<LibraryItem> podcast,
    @JsonKey(readValue: _itemList) @Default([]) List<LibraryItem> episodes,
    @JsonKey(readValue: _seriesCombined) @Default([]) List<Series> series,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@freezed
sealed class SearchResultItem with _$SearchResultItem {
  const factory SearchResultItem({
    required String name,
    @Default(0) int numBooks,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}

Object? _itemList(Map json, String key) {
  final list = json[key] as List<dynamic>?;
  return list?.map((e) => e['libraryItem']).toList();
}

Object? _seriesCombined(Map json, String key) {
  final list = json[key] as List<dynamic>?;
  if (list == null) return null;

  return list.map((item) {
    final seriesMap = item['series'] as Map<String, dynamic>;
    final booksList = item['books'] as List<dynamic>?;
    return {...seriesMap, 'books': booksList};
  }).toList();
}
