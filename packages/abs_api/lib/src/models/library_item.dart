import 'package:abs_api/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_item.freezed.dart';
part 'library_item.g.dart';

@freezed
sealed class LibraryItem with _$LibraryItem {
  @DateTimeEpochConverter()
  const factory LibraryItem({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required MediaType mediaType,
    required Media media,
    int? size,
    String? sequence,
    String? seriesSequence,
    MediaProgress? userMediaProgress,
    List<PodcastEpisodeDownload>? episodesDownloading,
    Series? collapsedSeries,
  }) = _LibraryItem;

  factory LibraryItem.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemFromJson(json);
}
