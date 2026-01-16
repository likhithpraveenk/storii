import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/models/user.dart';

extension UserToDomain on User {
  UserDomain toDomain(Uri url) {
    return UserDomain(
      id: id,
      username: username,
      userType: type.name,
      serverUrl: url,
    );
  }
}

extension LibraryToDomain on Library {
  LibraryDomain toDomain(Uri url) {
    final mediaContent = switch (mediaType) {
      .book => MediaContent.audiobook,
      .podcast => MediaContent.podcast,
    };
    return LibraryDomain(
      id: id,
      mediaContent: mediaContent,
      name: name,
      serverUrl: url,
    );
  }
}

extension LibraryItemToDomain on LibraryItem {
  ItemDomain toDomain() {
    return switch (media) {
      final BookMedia m => Audiobook(
        id: id,
        libraryId: libraryId,
        addedAt: addedAt,
        updatedAt: updatedAt,
        isMissing: isMissing,
        size: size,
        duration: m.duration,
        audioFiles: m.audioFiles ?? [],
        chapters: m.chapters ?? [],
        title: m.metadata.title,
        description: m.metadata.description,
        explicit: m.metadata.explicit,
        genres: m.metadata.genres,
        language: m.metadata.language,
        narrators: m.metadata.mapOrNull(book: (m) => m.narrators) ?? [],
        authors:
            m.metadata.mapOrNull(
              book: (m) =>
                  m.authors?.map((a) => a.toDomain(libraryId)).toList(),
            ) ??
            [],
        tracks: m.tracks ?? [],
        tags: m.tags,
        hideFromContinueListening:
            userMediaProgress?.hideFromContinueListening ?? false,
        progress: userMediaProgress?.progress ?? 0,
        isFinished: userMediaProgress?.isFinished ?? false,
      ),

      final PodcastMedia m => Podcast(
        id: id,
        libraryId: libraryId,
        addedAt: addedAt,
        updatedAt: updatedAt,
        isMissing: isMissing,
        size: size,
        episodes: m.episodes ?? [],
        tags: m.tags,
        description: m.metadata.description,
        explicit: m.metadata.explicit,
        feedUrl: m.metadata.mapOrNull(podcast: (m) => m.feedUrl),
        genres: m.metadata.genres,
        language: m.metadata.language,
        lastEpisodeCheck: m.lastEpisodeCheck,
        title: m.metadata.title,
        authorName: m.metadata.mapOrNull(podcast: (m) => m.author),
        episodeId: userMediaProgress?.episodeId,
        hideFromContinueListening:
            userMediaProgress?.hideFromContinueListening ?? false,
        progress: userMediaProgress?.progress ?? 0,
        isFinished: userMediaProgress?.isFinished ?? false,
      ),
    };
  }
}

extension ShelfToDomain on Shelf {
  ShelfDomain toDomain(String libraryId) {
    return switch (this) {
      final LibraryItemsShelf l => ItemShelfDomain(
        id: id,
        label: label,
        type: type,
        items: l.entities.map((e) => e.toDomain()).toList(),
      ),
      final SeriesShelf s => SeriesShelfDomain(
        id: id,
        label: label,
        type: type,
        series: s.entities.map((e) => e.toDomain(libraryId)).toList(),
      ),
      final AuthorShelf a => AuthorShelfDomain(
        id: id,
        label: label,
        type: type,
        authors: a.entities.map((e) => e.toDomain(libraryId)).toList(),
      ),
    };
  }
}

extension SeriesX on Series {
  SeriesDomain toDomain(String libraryId) {
    return SeriesDomain(
      id: id,
      name: name,
      libraryId: this.libraryId ?? libraryId,
      addedAt: addedAt,
      updatedAt: updatedAt,
      description: description,
      isFinished: progress?.isFinished ?? false,
      nameIgnorePrefix: nameIgnorePrefix,
      books: books.map((b) => b.toDomain()).toList(),
      libraryItemIdsFinished: progress?.libraryItemIdsFinished,
    );
  }
}

extension AuthorX on Author {
  AuthorDomain toDomain(String libraryId) {
    return AuthorDomain(
      id: id,
      name: name,
      libraryId: this.libraryId ?? libraryId,
      description: description,
      updatedAt: updatedAt,
      addedAt: addedAt,
      numBooks: numBooks,
      books: libraryItems?.map((i) => i.toDomain()).cast<Audiobook>().toList(),
      series: series?.map((s) => s.toDomain(libraryId)).toList(),
    );
  }
}
