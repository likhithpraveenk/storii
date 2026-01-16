import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/books/series.dart';
import 'package:storii/abs_api/models/library/library_item.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
sealed class Author with _$Author {
  @DateTimeEpochConverter()
  const factory Author({
    required String id,
    required String name,
    String? lastFirst,
    String? libraryId,
    String? asin,
    String? description,
    String? imagePath,
    DateTime? addedAt,
    DateTime? updatedAt,
    int? numBooks,
    List<LibraryItem>? libraryItems,
    List<Series>? series,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
