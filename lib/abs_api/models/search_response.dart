import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/models.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
sealed class SearchResponse with _$SearchResponse {
  const factory SearchResponse.book({
    @JsonKey(readValue: readLibraryItemList)
    @Default([])
    List<LibraryItem> book,

    @Default([]) List<SearchResultItem> narrators,
    @Default([]) List<Author> authors,
    @Default([]) List<SearchResultItem> tags,
    @Default([]) List<SearchResultItem> genres,

    @JsonKey(readValue: readSeriesWithBooks) @Default([]) List<Series> series,
  }) = BookSearchResponse;

  const factory SearchResponse.podcast({
    @JsonKey(readValue: readLibraryItemList)
    @Default([])
    List<LibraryItem> podcast,

    @JsonKey(readValue: readLibraryItemList)
    @Default([])
    List<LibraryItem> episodes,

    @Default([]) List<SearchResultItem> tags,
    @Default([]) List<SearchResultItem> genres,
  }) = PodcastSearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      const SearchResponseConverter().fromJson(json);
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

class SearchResponseConverter
    implements JsonConverter<SearchResponse, Map<String, dynamic>> {
  const SearchResponseConverter();

  @override
  SearchResponse fromJson(Map<String, dynamic> json) {
    if (json.containsKey('runtimeType')) return _$SearchResponseFromJson(json);

    final MediaType mediaType = json.containsKey('book') ? .book : .podcast;

    return switch (mediaType) {
      .book => BookSearchResponse.fromJson(json),
      .podcast => PodcastSearchResponse.fromJson(json),
    };
  }

  @override
  Map<String, dynamic> toJson(SearchResponse response) => response.toJson();
}
