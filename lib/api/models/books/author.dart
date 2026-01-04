import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/books/series.dart';
import 'package:storii/api/models/library/library_item.dart';
import 'package:storii/api/models/utils/json_converters.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
sealed class Author with _$Author {
  @DateTimeEpochConverter()
  const factory Author({
    required String id,
    required String name,
    String? asin,
    String? description,
    String? imagePath,
    DateTime? addedAt,
    DateTime? updatedAt,
    List<LibraryItem>? libraryItems,
    List<Series>? series,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
