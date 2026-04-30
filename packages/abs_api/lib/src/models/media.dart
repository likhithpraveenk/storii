import 'package:abs_api/src/models/audio_file.dart';
import 'package:abs_api/src/models/audio_track.dart';
import 'package:abs_api/src/models/book_chapter.dart';
import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/media_metadata.dart';
import 'package:abs_api/src/models/podcast_episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
sealed class Media with _$Media {
  @DurationPreciseSecondsConverter()
  const factory Media.book({
    required String id,
    required MediaMetadata metadata,
    String? libraryItemId,
    @Default([]) List<String> tags,
    Duration? duration,
    String? coverPath,
    @Default([]) List<AudioFile> audioFiles,
    @Default(0) int numAudioFiles,
    @Default([]) List<AudioTrack> tracks,
    @Default(0) int numTracks,
    @Default([]) List<BookChapter> chapters,
    @Default(0) int numChapters,
    int? size,
  }) = BookMedia;

  @DateTimeEpochConverter()
  const factory Media.podcast({
    required String id,
    required MediaMetadata metadata,
    String? libraryItemId,
    @Default([]) List<String> tags,
    @Default(false) bool autoDownloadEpisodes,
    @Default([]) List<PodcastEpisode> episodes,
    String? coverPath,
    DateTime? lastEpisodeCheck,
    int? size,
    int? numEpisodes,
  }) = PodcastMedia;

  factory Media.fromJson(Map<String, dynamic> json) =>
      const MediaConverter().fromJson(json);
}

class MediaConverter implements JsonConverter<Media, Map<String, dynamic>> {
  const MediaConverter();

  @override
  Media fromJson(Map<String, dynamic> json) {
    if (json.containsKey('runtimeType')) return _$MediaFromJson(json);

    final MediaType mediaType;
    if (json.containsKey('episodes')) {
      mediaType = .podcast;
    } else {
      mediaType = .book;
    }

    return switch (mediaType) {
      .book => BookMedia.fromJson(json),
      .podcast => PodcastMedia.fromJson(json),
    };
  }

  @override
  Map<String, dynamic> toJson(Media media) => media.toJson();
}
