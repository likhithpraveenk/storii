import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/books/series_progress.dart';
import 'package:storii/api/models/library/library_item.dart';
import 'package:storii/api/models/rss/rss_feed.dart';
import 'package:storii/api/models/utils/json_converters.dart';

part 'series.freezed.dart';
part 'series.g.dart';

@freezed
sealed class Series with _$Series {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory Series({
    required String id,
    required String name,
    required String libraryId,
    String? nameIgnorePrefix,

    // Common Metadata
    String? description,
    required DateTime addedAt,
    required DateTime updatedAt,

    // Content / Collections
    @Default([]) List<LibraryItem> books,
    List<String>? libraryItemIds,
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
