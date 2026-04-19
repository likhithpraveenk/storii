import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/library_item.dart';
import 'package:abs_api/src/models/series_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';
part 'series.g.dart';

@freezed
sealed class Series with _$Series {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory Series({
    required String id,
    required String name,
    String? libraryId,
    String? nameIgnorePrefix,

    // Common Metadata
    String? description,
    DateTime? addedAt,
    DateTime? updatedAt,

    // Content / Collections
    @JsonKey(readValue: _booksOrItems) @Default([]) List<LibraryItem> books,
    int? numBooks,

    // Sequence & Sorting
    String? sequence,
    String? seriesSequenceList,

    // Progress & States
    List<String>? libraryItemIds,
    SeriesProgress? progress,
    bool? inProgress,
    bool? hasActiveBook,
    bool? hideFromContinueListening,
    DateTime? bookInProgressLastUpdate,
    LibraryItem? firstBookUnread,

    // External
    // RssFeed? rssFeed,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}

Object? _booksOrItems(Map json, String key) {
  return json['books'] ?? json['items'];
}
