import 'package:abs_api/abs_api.dart';

final fakeBookSession = PlaybackSession(
  id: 'test-session',
  libraryItemId: 'item-1',
  userId: 'user-id',
  libraryId: 'library-id',
  mediaType: .book,
  mediaMetadata: const MediaMetadata.book(),
  chapters: [],
  duration: const Duration(hours: 1),
  playMethod: .directPlay,
  mediaPlayer: 'test',
  date: '2026-06-13',
  dayOfWeek: 'Saturday',
  timeListening: Duration.zero,
  startTime: Duration.zero,
  currentTime: Duration.zero,
  startedAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
