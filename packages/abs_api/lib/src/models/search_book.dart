import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_book.freezed.dart';
part 'search_book.g.dart';

@freezed
abstract class SearchBook with _$SearchBook {
  const factory({
    String? title,
    String? subtitle,
    String? author,
    String? narrator,
    String? publisher,
    String? publishedYear,
    String? description,
    String? cover,
    String? asin,
    String? isbn,
    @Default([]) List<String> genres,
    @Default([]) List<String> tags,
    @Default([]) List<SearchSeries> series,
    String? language,
    @DurationMinConverter() Duration? duration,
    String? region,
    String? rating,
    @Default(false) bool abridged,
    String? descriptionPlain,
    @Default(0) double matchConfidence,
  }) = _SearchBook;

  factory fromJson(Map<String, dynamic> json) => _$SearchBookFromJson(json);
}

@freezed
abstract class SearchSeries with _$SearchSeries {
  const factory({required String series, String? sequence}) = _SearchSeries;

  factory fromJson(Map<String, dynamic> json) => _$SearchSeriesFromJson(json);
}
