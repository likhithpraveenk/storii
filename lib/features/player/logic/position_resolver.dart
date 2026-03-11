import 'package:audio_service/audio_service.dart';
import 'package:storii/app/models/chapter.dart';

class PositionResolver {
  final List<Duration> _trackOffsets;
  final List<Chapter> _chapters;

  List<Chapter> get chapters => _chapters;
  List<Duration> get trackOffsets => _trackOffsets;
  bool get isEmpty => _trackOffsets.isEmpty || _chapters.isEmpty;

  const PositionResolver({
    required List<Duration> trackOffsets,
    required List<Chapter> chapters,
  }) : _trackOffsets = trackOffsets,
       _chapters = chapters;

  static const empty = PositionResolver(trackOffsets: [], chapters: []);

  static PositionResolver from(List<MediaItem> items) {
    final offsets = List<Duration>.unmodifiable(
      items.map(
        (item) => Duration(microseconds: item.extras!['startOffset'] as int),
      ),
    );

    final raw = items.firstOrNull?.extras?['chapters'] as List<dynamic>? ?? [];
    final chapters = List<Chapter>.unmodifiable(
      raw.map((c) => Chapter.fromJson(c as Map<String, dynamic>)),
    );

    return PositionResolver(trackOffsets: offsets, chapters: chapters);
  }

  int _trackIndexFor(Duration globalPosition) {
    for (var i = _trackOffsets.length - 1; i >= 0; i--) {
      if (_trackOffsets[i] <= globalPosition) return i;
    }
    return 0;
  }

  int _chapterIndexFor(Duration globalPosition) {
    for (var i = _chapters.length - 1; i >= 0; i--) {
      if (_chapters[i].start <= globalPosition) return i;
    }
    return 0;
  }

  Duration globalPositionFromTrack(int? index, Duration position) {
    if (index == null || index >= _trackOffsets.length) return Duration.zero;
    return _trackOffsets[index] + position;
  }

  Duration chapterPositionFromTrack(int? index, Duration position) {
    if (index == null || index < 0 || index >= _trackOffsets.length) {
      return position;
    }
    final global = globalPositionFromTrack(index, position);
    final chapterIndex = _chapterIndexFor(global);
    return global - _chapters[chapterIndex].start;
  }

  Duration chapterPositionFromGlobal(Duration globalPosition) {
    final chapterIndex = _chapterIndexFor(globalPosition);
    return globalPosition - _chapters[chapterIndex].start;
  }

  Chapter? chapterFromTrack(int? index, Duration position) {
    if (index == null || index < 0 || index >= _trackOffsets.length) {
      return null;
    }
    final chapterIndex = _chapterIndexFor(
      globalPositionFromTrack(index, position),
    );
    return _chapters[chapterIndex];
  }

  Chapter? chapterAt(int? index) {
    if (index == null || index < 0 || index >= _chapters.length) {
      return null;
    }
    return _chapters[index];
  }

  ({int chapterIndex, Duration chapterPosition})? resolveChapter(
    int trackIndex,
    Duration trackPosition,
  ) {
    if (trackIndex < 0 || trackIndex >= _trackOffsets.length) return null;

    final global = globalPositionFromTrack(trackIndex, trackPosition);
    final chapterIndex = _chapterIndexFor(global);

    return (
      chapterIndex: chapterIndex,
      chapterPosition: global - _chapters[chapterIndex].start,
    );
  }

  ({int trackIndex, Duration trackPosition})? resolveSeek(
    int chapterIndex,
    Duration chapterPosition,
  ) {
    if (chapterIndex < 0 || chapterIndex >= _chapters.length) return null;

    final global = _chapters[chapterIndex].start + chapterPosition;
    final trackIndex = _trackIndexFor(global);

    return (
      trackIndex: trackIndex,
      trackPosition: global - _trackOffsets[trackIndex],
    );
  }
}

extension ChapterX on Chapter {
  MediaItem toMediaItem(MediaItem item) {
    return item.copyWith(
      id: '${item.id}$title',
      title: fromTracks ? item.title : title,
      duration: duration,
      artist: fromTracks ? item.artist : item.title,
    );
  }
}
