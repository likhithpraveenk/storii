import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/series.dart';

part 'author.freezed.dart';

@freezed
sealed class AuthorDomain with _$AuthorDomain {
  const factory AuthorDomain({
    required String id,
    required String name,
    required String libraryId,
    String? description,
    DateTime? addedAt,
    DateTime? updatedAt,
    int? numBooks,
    List<Audiobook>? books,
    List<SeriesDomain>? series,
  }) = _AuthorDomain;
}
