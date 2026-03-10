import 'package:storii/abs_api/abs_api.dart';

class PlayerSession {
  final String id;
  final String libraryItemId;
  final String? episodeId;
  final String displayTitle;
  final String displayAuthor;
  final Duration duration;
  final Duration startTime;
  final List<AudioTrack> tracks;
  final List<BookChapter> chapters;
  final MediaType mediaType;

  Duration currentTime;
  Duration timeListening;

  PlayerSession({
    required this.id,
    required this.libraryItemId,
    this.episodeId,
    required this.displayTitle,
    required this.displayAuthor,
    required this.duration,
    required this.startTime,
    required this.tracks,
    required this.chapters,
    required this.mediaType,
    required this.currentTime,
    required this.timeListening,
  });
}
