import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/audio_track.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/app/models/podcast_episode.dart';
import 'package:storii/app/models/series.dart';

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
    String? authorName,
    @Default([]) List<SeriesDomain> series,
    String? seriesSequence,
    String? description,
    String? language,
    @Default(false) bool explicit,

    @Default([]) List<String> narrators,
    @Default([]) List<String> genres,
    @Default([]) List<String> tags,
    @Default([]) List<AudioTrackDomain> tracks,
    @Default([]) List<ChapterDomain> chapters,

    @Default(0) double progress,
    @Default(Duration.zero) Duration currentOffset,
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
    @Default([]) List<PodcastEpisodeDomain> episodes,
    Uri? feedUrl,

    DateTime? lastEpisodeCheck,
    @Default(0) double progress,
    @Default(false) bool isFinished,
    @Default(false) bool hideFromContinueListening,
  }) = Podcast;

  Duration get totalDuration => switch (this) {
    final Audiobook a => a.duration,
    final Podcast p =>
      p.episodes
          .map((ep) => ep.audioTrack.duration)
          .fold(Duration.zero, (sum, d) => sum + d),
  };
}
