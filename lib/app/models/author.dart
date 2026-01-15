import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/series.dart';

part 'author.freezed.dart';

@freezed
sealed class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    required String libraryId,
    String? description,
    DateTime? addedAt,
    DateTime? updatedAt,
    int? numBooks,
    List<LibraryItem>? libraryItems,
    List<Series>? series,
  }) = _Author;
}
