import 'package:flutter/widgets.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/l10n/l10n.dart';

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
  fileBirthTime('birthtimeMs'),
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
      title => l10n.title,
      authorName => l10n.author,
      authorNameLF => l10n.authorLastFirst,
      addedAt => l10n.dateAdded,
      publishedYear => l10n.publishedYear,
      size => l10n.size,
      duration => l10n.duration,
      fileBirthTime => l10n.fileCreatedDate,
      fileModified => l10n.fileModifiedDate,
      progressLastUpdated => l10n.lastPlayed,
      progressStartedAt => l10n.dateStarted,
      progressFinishedAt => l10n.dateFinished,
      random => l10n.random,
    };
  }
}

enum SeriesSort implements EnumHasValue {
  name('name'),
  addedAt('addedAt'),
  lastBookAdded('lastBookAdded'),
  lastBookUpdated('lastBookUpdated'),
  totalDuration('totalDuration'),
  numBooks('numBooks'),
  random('random');

  @override
  final String value;
  const SeriesSort(this.value);

  @override
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      numBooks => l10n.numOfBooks,
      addedAt => l10n.dateAdded,
      name => l10n.name,
      totalDuration => l10n.duration,
      lastBookAdded => l10n.lastBookAdded,
      lastBookUpdated => l10n.lastBookUpdated,
      random => l10n.random,
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
      name => l10n.name,
      lastFirst => l10n.lastFirst,
      addedAt => l10n.dateAdded,
      updatedAt => l10n.lastUpdated,
      numBooks => l10n.numOfBooks,
    };
  }
}

enum PodcastSort implements EnumHasValue {
  addedAt('addedAt'),
  size('size'),
  birthTime('birthtimeMs'),
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
      addedAt => l10n.dateAdded,
      size => l10n.size,
      birthTime => l10n.fileCreatedDate,
      mtime => l10n.fileModifiedDate,
      author => l10n.author,
      title => l10n.title,
      numEpisodes => l10n.numOfEpisodes,
      random => l10n.random,
    };
  }
}

enum FilterAudiobooks {
  genre,
  tag,
  author,
  series,
  narrator,
  publishers,
  publishedDecade,
  language,
  progress,
  missing,
  tracks,
  abridged,
  explicit,
  ebooks,
  issues,
  feedOpen;

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    author => .authors,
    series => .series,
    progress => .progress,
    narrator => .narrators,
    publishers => .publishers,
    publishedDecade => .publishedDecade,
    language => .languages,
    missing => .missing,
    tracks => .tracks,
    abridged => .abridged,
    explicit => .explicit,
    ebooks => .ebooks,
    issues => .issues,
    feedOpen => .feedOpen,
  };
}

enum FilterPodcasts {
  genre,
  tag,
  language,
  issues,
  explicit,
  feedOpen;

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    language => .languages,
    issues => .issues,
    feedOpen => .feedOpen,
    explicit => .explicit,
  };
}

enum FilterSeries {
  genre,
  tag,
  progress,
  author,
  narrator,
  publishers,
  language;

  FilterGroup get group => switch (this) {
    genre => .genres,
    tag => .tags,
    progress => .progress,
    author => .authors,
    narrator => .narrators,
    publishers => .publishers,
    language => .languages,
  };
}

enum DisplayMode { listView, compact, comfortable, coverOnly }
