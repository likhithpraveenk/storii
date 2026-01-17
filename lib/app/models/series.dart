import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/item.dart';

part 'series.freezed.dart';

@freezed
sealed class SeriesDomain with _$SeriesDomain {
  const factory SeriesDomain({
    required String id,
    required String name,
    required String libraryId,
    String? sequence,
    String? nameIgnorePrefix,
    String? description,
    DateTime? addedAt,
    DateTime? updatedAt,
    @Default(false) bool isFinished,
    List<ItemDomain>? books,
    List<String>? libraryItemIdsFinished,
  }) = _SeriesDomain;
}
