import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/audio/audio_file.dart';
import 'package:storii/api/models/audio/audio_track.dart';
import 'package:storii/api/models/books/book_chapter.dart';
import 'package:storii/api/models/podcasts/podcast_episode.dart';

part 'library_item.freezed.dart';

@freezed
sealed class LibraryItem with _$LibraryItem {
  const LibraryItem._();

  const factory LibraryItem.audiobook({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required int size,
    required Duration duration,

    String? title,
    String? authorName,
    String? description,
    String? language,
    @Default(false) bool explicit,

    @Default([]) List<String> narrators,
    @Default([]) List<String> genres,
    @Default([]) List<String> tags,
    @Default([]) List<AudioFile> audioFiles,
    @Default([]) List<AudioTrack> tracks,
    @Default([]) List<BookChapter> chapters,

    @Default(0) double progress,
    @Default(false) bool isFinished,
    @Default(false) bool hideFromContinueListening,
  }) = Audiobook;

  const factory LibraryItem.podcast({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required int size,

    String? episodeId,
    String? title,
    String? authorName,
    String? description,
    String? language,
    @Default(false) bool explicit,

    @Default([]) List<String> genres,
    @Default([]) List<String> tags,
    @Default([]) List<PodcastEpisode> episodes,
    Uri? feedUrl,

    DateTime? lastEpisodeCheck,
    @Default(0) double progress,
    @Default(false) bool isFinished,
    @Default(false) bool hideFromContinueListening,
  }) = Podcast;
}
