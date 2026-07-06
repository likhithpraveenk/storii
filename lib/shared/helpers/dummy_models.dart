import 'package:abs_api/abs_api.dart';

final dummyEpisode = PodcastEpisode(
  libraryItemId: 'libraryItemId',
  podcastId: 'podcastId',
  id: 'id',
  title:
      'Title Title Title Title Title Title'
      'Title Title Title Title Title Title'
      'Title Title Title Title Title Title',
  audioFile: AudioFile(
    ino: 'ino',
    metadata: FileMetadata(
      filename: 'filename',
      ext: 'ext',
      path: 'path',
      relPath: 'relPath',
      size: 0,
      mtime: DateTime.timestamp(),
      ctime: DateTime.timestamp(),
      birthtime: DateTime.timestamp(),
    ),
  ),
  episode: '99',
  season: '99',
  duration: Duration.zero,
  addedAt: DateTime.timestamp(),
  updatedAt: DateTime.timestamp(),
);
