import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_progress.freezed.dart';
part 'series_progress.g.dart';

@freezed
sealed class SeriesProgress with _$SeriesProgress {
  const factory SeriesProgress({
    required List<String> libraryItemIds,
    required List<String> libraryItemIdsFinished,
    required bool isFinished,
  }) = _SeriesProgress;

  factory SeriesProgress.fromJson(Map<String, dynamic> json) =>
      _$SeriesProgressFromJson(json);
}
