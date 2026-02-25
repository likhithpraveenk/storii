import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/models.dart';

part 'library_item.freezed.dart';
part 'library_item.g.dart';

@freezed
sealed class LibraryItem with _$LibraryItem {
  const LibraryItem._();

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

  String? get title => media.metadata.title;
  String? get description => media.metadata.description;
  String? get authorName => media.metadata.map(
    book: (m) => m.authorName ?? m.authors?.firstOrNull?.name,
    podcast: (m) => m.author,
  );
  List<Author> get authors => media.metadata.map(
    book: (m) => m.authors ?? [],
    podcast: (m) => throw UnsupportedError('Podcast authors unsupported'),
  );
  List<Series> get series => media.metadata.map(
    book: (m) => m.series ?? [],
    podcast: (m) => throw UnsupportedError('Podcast series unsupported'),
  );

  List<String> get genres => media.metadata.genres;
  bool get explicit => media.metadata.explicit;
  String? get language => media.metadata.language;
  List<String> get tags => media.tags;

  Duration get duration => media.map(
    book: (m) => m.duration,
    podcast: (m) => throw UnsupportedError('Podcast duration unsupported'),
  );
  List<BookChapter> get chapters => media.map(
    book: (m) => m.chapters ?? [],
    podcast: (m) => throw UnsupportedError('Podcast chapters unsupported'),
  );
  List<AudioTrack> get tracks => media.map(
    book: (m) => m.tracks ?? [],
    podcast: (m) => throw UnsupportedError('Podcast tracks unsupported'),
  );
  List<PodcastEpisode> get episodes => media.map(
    book: (m) => throw UnsupportedError('Audiobook episodes unsupported'),
    podcast: (m) => m.episodes ?? [],
  );
  DateTime? get lastEpisodeCheck => media.map(
    book: (m) => throw UnsupportedError('Audiobook episode unsupported'),
    podcast: (m) => m.lastEpisodeCheck,
  );

  double get progress => userMediaProgress?.progress ?? 0.0;
  bool get isFinished => userMediaProgress?.isFinished ?? false;
  Duration get currentOffset => userMediaProgress?.currentTime ?? Duration.zero;
  bool get hideFromContinue =>
      userMediaProgress?.hideFromContinueListening ?? false;
  String? get episodeId => userMediaProgress?.episodeId;
}
