import 'package:abs_api/src/models/author.dart';
import 'package:abs_api/src/models/series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_filter_data.freezed.dart';
part 'library_filter_data.g.dart';

@freezed
abstract class LibraryFilterData with _$LibraryFilterData {
  const factory LibraryFilterData({
    required List<Author> authors,
    required List<String> genres,
    required List<String> tags,
    required List<Series> series,
    required List<String> narrators,
    required List<String> languages,
    required List<String> publishers,
    required List<String> publishedDecades,
  }) = _LibraryFilterData;

  factory LibraryFilterData.fromJson(Map<String, dynamic> json) =>
      _$LibraryFilterDataFromJson(json);
}
