import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/author.dart';

part 'item.freezed.dart';

@freezed
sealed class ItemDomain with _$ItemDomain {
  const ItemDomain._();

  const factory ItemDomain.audiobook({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required int size,
    required Duration duration,

    String? title,
    @Default([]) List<AuthorDomain> authors,
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

  const factory ItemDomain.podcast({
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

  String? get authorName => switch (this) {
    final Audiobook a => a.authors.firstOrNull?.name,
    final Podcast p => p.authorName,
  };
}
