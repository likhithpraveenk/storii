import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/books/author.dart';
import 'package:storii/abs_api/models/books/series.dart';
import 'package:storii/abs_api/models/library/library_item.dart';
import 'package:storii/abs_api/models/utils/enums.dart';

part 'shelf.freezed.dart';
part 'shelf.g.dart';

@freezed
sealed class Shelf with _$Shelf {
  const factory Shelf.libraryItems({
    required String id,
    required String label,
    required String labelStringKey,
    required ShelfType type,
    required List<LibraryItem> entities,
    required int total,
  }) = LibraryItemsShelf;

  const factory Shelf.series({
    required String id,
    required String label,
    required String labelStringKey,
    required ShelfType type,
    required List<Series> entities,
    required int total,
  }) = SeriesShelf;

  const factory Shelf.authors({
    required String id,
    required String label,
    required String labelStringKey,
    required ShelfType type,
    required List<Author> entities,
    required int total,
  }) = AuthorShelf;

  factory Shelf.fromJson(Map<String, dynamic> json) =>
      const ShelfConverter().fromJson(json);
}

class ShelfConverter implements JsonConverter<Shelf, Map<String, dynamic>> {
  const ShelfConverter();

  @override
  Shelf fromJson(Map<String, dynamic> json) {
    if (json.containsKey('runtimeType')) return _$ShelfFromJson(json);

    final type = ShelfType.values.byName(json['type']);

    switch (type) {
      case ShelfType.book:
      case ShelfType.podcast:
      case ShelfType.episode:
        return LibraryItemsShelf.fromJson(json);
      case ShelfType.series:
        return SeriesShelf.fromJson(json);
      case ShelfType.authors:
        return AuthorShelf.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(Shelf object) => object.toJson();
}
