import 'package:flutter/widgets.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/l10n/l10n.dart';

enum MediaContent {
  audiobooks,
  podcasts;

  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return switch (this) {
      .audiobooks => l10n.audiobooks,
      .podcasts => l10n.podcasts,
    };
  }
}

enum Languages {
  en('English');

  final String displayName;
  const Languages(this.displayName);
}

abstract class EnumHasValue {
  String get value;
  String getDisplayString(BuildContext context);
}

enum AudiobookSort implements EnumHasValue {
  title('media.metadata.title'),
  authorName('media.metadata.authorName'),
  authorNameLF('media.metadata.authorNameLF'),
  addedAt('addedAt'),
  publishedYear('media.metadata.publishedYear'),
  size('size'),
  duration('media.duration'),
  fileBirthtime('birthtimeMs'),
  fileModified('libraryItem.mtime'),
  progressLastUpdated('progress'),
  progressStartedAt('progress.createdAt'),
  progressFinishedAt('progress.finishedAt'),
  random('random');

  @override
  final String value;
  const AudiobookSort(this.value);

  @override
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      title => l10n.sortTitle,
      authorName => l10n.sortAuthor,
      authorNameLF => l10n.sortAuthorLastFirst,
      addedAt => l10n.sortAddedAt,
      publishedYear => l10n.sortPublishedYear,
      size => l10n.sortSize,
      duration => l10n.sortDuration,
      fileBirthtime => l10n.sortFileBirthtime,
      fileModified => l10n.sortFileModified,
      progressLastUpdated => l10n.sortProgressUpdated,
      progressStartedAt => l10n.sortProgressStarted,
      progressFinishedAt => l10n.sortProgressFinished,
      random => l10n.sortRandom,
    };
  }
}

enum SeriesSort implements EnumHasValue {
  numBooks('numBooks'),
  addedAt('addedAt'),
  name('name'),
  totalDuration('totalDuration'),
  lastBookAdded('lastBookAdded'),
  lastBookUpdated('lastBookUpdated'),
  random('random');

  @override
  final String value;
  const SeriesSort(this.value);

  @override
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      numBooks => l10n.sortNumBooks,
      addedAt => l10n.sortAddedAt,
      name => l10n.sortName,
      totalDuration => l10n.sortDuration,
      lastBookAdded => l10n.sortLastBookAdded,
      lastBookUpdated => l10n.sortLastBookUpdated,
      random => l10n.sortRandom,
    };
  }
}

enum AuthorSort implements EnumHasValue {
  name('name'),
  lastFirst('lastFirst'),
  addedAt('addedAt'),
  updatedAt('updatedAt'),
  numBooks('numBooks');

  @override
  final String value;
  const AuthorSort(this.value);

  @override
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      name => l10n.sortName,
      lastFirst => l10n.sortLastFirst,
      addedAt => l10n.sortAddedAt,
      updatedAt => l10n.sortUpdatedAt,
      numBooks => l10n.sortNumBooks,
    };
  }
}

enum PodcastSort implements EnumHasValue {
  addedAt('addedAt'),
  size('size'),
  birthtime('birthtimeMs'),
  mtime('mtimeMs'),
  author('media.metadata.author'),
  title('media.metadata.title'),
  numEpisodes('media.numTracks'),
  random('random');

  @override
  final String value;
  const PodcastSort(this.value);

  @override
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      addedAt => l10n.sortAddedAt,
      size => l10n.sortSize,
      birthtime => l10n.sortFileBirthtime,
      mtime => l10n.sortFileModified,
      author => l10n.sortAuthor,
      title => l10n.sortTitle,
      numEpisodes => l10n.sortNumEpisodes,
      random => l10n.sortRandom,
    };
  }
}

enum FilterAudiobooks {
  genre,
  tag,
  author,
  series,
  status;

  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      genre => l.filterGenre,
      tag => l.filterTag,
      author => l.filterAuthor,
      series => l.filterSeries,
      status => l.filterStatus,
    };
  }

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    author => .authors,
    series => .series,
    status => .progress,
  };
}

enum FilterPodcasts {
  genre,
  tag,
  language;

  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      genre => l.filterGenre,
      tag => l.filterTag,
      language => l.filterLanguage,
    };
  }

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    language => .languages,
  };
}

enum FilterSeries {
  genre,
  tag,
  status;

  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      genre => l.filterGenre,
      tag => l.filterTag,
      status => l.filterStatus,
    };
  }

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    status => .progress,
  };
}
