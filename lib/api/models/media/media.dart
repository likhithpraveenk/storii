import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/audio/audio_file.dart';
import 'package:storii/api/models/audio/audio_track.dart';
import 'package:storii/api/models/books/book_chapter.dart';
import 'package:storii/api/models/media/media_metadata.dart';
import 'package:storii/api/models/podcasts/podcast_episode.dart';
import 'package:storii/api/models/utils/enums.dart';
import 'package:storii/api/models/utils/json_converters.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
sealed class Media with _$Media {
  @DurationPreciseSecondsConverter()
  const factory Media.book({
    required MediaMetadata metadata,
    required List<String> tags,
    required Duration duration,
    required int size,
    String? coverPath,
    List<AudioFile>? audioFiles,
    List<AudioTrack>? tracks,
    List<BookChapter>? chapters,
  }) = BookMedia;

  @DateTimeEpochConverter()
  const factory Media.podcast({
    required MediaMetadata metadata,
    required List<String> tags,
    required int size,
    required bool autoDownloadEpisodes,
    String? coverPath,
    DateTime? lastEpisodeCheck,
    List<PodcastEpisode>? episodes,
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
    if (json.containsKey('duration')) {
      mediaType = .book;
    } else {
      mediaType = .podcast;
    }

    return switch (mediaType) {
      .book => BookMedia.fromJson(json),
      .podcast => PodcastMedia.fromJson(json),
    };
  }

  @override
  Map<String, dynamic> toJson(Media media) => media.toJson();
}
