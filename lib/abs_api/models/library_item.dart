import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/enums.dart';
import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/media.dart';
import 'package:storii/abs_api/models/media_progress.dart';
import 'package:storii/abs_api/models/podcast_episode_download.dart';

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
    required int size,
    String? sequence,
    String? seriesSequence,
    MediaProgress? userMediaProgress,
    List<PodcastEpisodeDownload>? episodesDownloading,
  }) = _LibraryItem;

  factory LibraryItem.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemFromJson(json);
}
