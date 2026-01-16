abstract class HasValue {
  String get value;
}

enum AudiobookSort implements HasValue {
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
}

enum SeriesSort implements HasValue {
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
}

enum PodcastSort implements HasValue {
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
}

enum AuthorSort implements HasValue {
  name('name'),
  lastFirst('lastFirst'),
  addedAt('addedAt'),
  updatedAt('updatedAt'),
  numBooks('numBooks');

  @override
  final String value;
  const AuthorSort(this.value);
}
