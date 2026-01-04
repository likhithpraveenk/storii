import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';

@freezed
sealed class Series with _$Series {
  const factory Series({
    required String id,
    required String name,
    required String libraryId,
    String? nameIgnorePrefix,
    String? description,
    required DateTime addedAt,
    required DateTime updatedAt,
    @Default(false) bool isFinished,
  }) = _Series;
}
