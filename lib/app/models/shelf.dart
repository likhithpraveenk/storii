import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/series.dart';

part 'shelf.freezed.dart';

@freezed
sealed class ShelfDomain with _$ShelfDomain {
  const ShelfDomain._();

  const factory ShelfDomain.libraryItems({
    required String id,
    required String label,
    required ShelfType type,
    required List<ItemDomain> items,
  }) = ItemShelfDomain;

  const factory ShelfDomain.series({
    required String id,
    required String label,
    required ShelfType type,
    required List<SeriesDomain> series,
  }) = SeriesShelfDomain;

  const factory ShelfDomain.authors({
    required String id,
    required String label,
    required ShelfType type,
    required List<AuthorDomain> authors,
  }) = AuthorShelfDomain;

  ShelfIdentity? get identity => ShelfIdentity.fromId(id);
}
