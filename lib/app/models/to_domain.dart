import 'package:storii/api/models/models.dart' as dto;
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/media_progress.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/models/user.dart';

extension UserToDomain on dto.User {
  User toDomain(Uri url) {
    return User(
      id: id,
      username: username,
      userType: type.name,
      serverUrl: url,
    );
  }
}

extension LibraryToDomain on dto.Library {
  Library toDomain(Uri url) {
    final mediaContent = switch (mediaType) {
      .book => MediaContent.audiobook,
      .podcast => MediaContent.podcast,
    };
    return Library(
      id: id,
      mediaContent: mediaContent,
      name: name,
      serverUrl: url,
    );
  }
}

extension LibraryItemToDomain on dto.LibraryItem {
  LibraryItem toDomain() {
    return switch (media) {
      final dto.BookMedia m => Audiobook(
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

      final dto.PodcastMedia m => Podcast(
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

extension ShelfToDomain on dto.Shelf {
  Shelf toDomain(String libraryId) {
    return switch (this) {
      final dto.LibraryItemsShelf l => LibraryItemsShelf(
        id: id,
        label: label,
        type: type,
        items: l.entities.map((e) => e.toDomain()).toList(),
      ),
      final dto.SeriesShelf s => SeriesShelf(
        id: id,
        label: label,
        type: type,
        series: s.entities.map((e) => e.toDomain(libraryId)).toList(),
      ),
      final dto.AuthorShelf a => AuthorShelf(
        id: id,
        label: label,
        type: type,
        authors: a.entities.map((e) => e.toDomain(libraryId)).toList(),
      ),
    };
  }
}

extension ProgressToDomain on dto.MediaProgress {
  MediaProgress toDomain(String userId) {
    return MediaProgress(
      libraryItemId: libraryItemId,
      userId: userId,
      duration: duration,
      currentDuration: currentTime,
      hideFromContinueListening: hideFromContinueListening,
      isFinished: isFinished,
      lastUpdate: lastUpdate,
      finishedAt: finishedAt,
      progress: progress ?? 0,
      startedAt: startedAt,
    );
  }
}

extension SeriesX on dto.Series {
  Series toDomain(String libraryId) {
    return Series(
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

extension AuthorX on dto.Author {
  Author toDomain(String libraryId) {
    return Author(
      id: id,
      name: name,
      libraryId: this.libraryId ?? libraryId,
      description: description,
      updatedAt: updatedAt,
      addedAt: addedAt,
      numBooks: numBooks,
      libraryItems: libraryItems?.map((i) => i.toDomain()).toList(),
      series: series?.map((s) => s.toDomain(libraryId)).toList(),
    );
  }
}
