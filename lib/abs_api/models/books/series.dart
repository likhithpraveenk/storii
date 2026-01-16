import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/books/series_progress.dart';
import 'package:storii/abs_api/models/library/library_item.dart';
import 'package:storii/abs_api/models/rss/rss_feed.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

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
    @JsonKey(readValue: readBooksOrItems) @Default([]) List<LibraryItem> books,
    int? numBooks,

    // Sequence & Sorting
    String? sequence,
    String? seriesSequenceList,

    // Progress & States
    SeriesProgress? progress,
    bool? inProgress,
    bool? hasActiveBook,
    bool? hideFromContinueListening,
    DateTime? bookInProgressLastUpdate,
    LibraryItem? firstBookUnread,

    // External
    RssFeed? rssFeed,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
