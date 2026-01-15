import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/utils/enums.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/series.dart';

part 'shelf.freezed.dart';

@freezed
sealed class Shelf with _$Shelf {
  const Shelf._();

  const factory Shelf.libraryItems({
    required String id,
    required String label,
    required ShelfType type,
    required List<LibraryItem> items,
  }) = LibraryItemsShelf;

  const factory Shelf.series({
    required String id,
    required String label,
    required ShelfType type,
    required List<Series> series,
  }) = SeriesShelf;

  const factory Shelf.authors({
    required String id,
    required String label,
    required ShelfType type,
    required List<Author> authors,
  }) = AuthorShelf;

  ShelfIdentity? get identity => ShelfIdentity.fromId(id);
}
