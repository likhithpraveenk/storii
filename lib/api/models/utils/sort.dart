enum LibraryItemSort {
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

  final String value;

  const LibraryItemSort(this.value);
}

// TODO: for podcasts, series and authors
