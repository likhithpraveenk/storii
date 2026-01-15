import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/library_item.dart';

part 'series.freezed.dart';

@freezed
sealed class Series with _$Series {
  const factory Series({
    required String id,
    required String name,
    required String libraryId,
    String? nameIgnorePrefix,
    String? description,
    DateTime? addedAt,
    DateTime? updatedAt,
    @Default(false) bool isFinished,
    List<LibraryItem>? books,
    List<String>? libraryItemIdsFinished,
  }) = _Series;
}
