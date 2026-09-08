import 'package:audio_service/audio_service.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/shared/helpers/extensions.dart';

class PositionResolver {
  final List<Duration> _trackOffsets;
  final List<Chapter> _chapters;

  List<Chapter> get chapters => _chapters;
  List<Duration> get trackOffsets => _trackOffsets;
  bool get isEmpty => _trackOffsets.isEmpty || _chapters.isEmpty;

  const new({required this._trackOffsets, required this._chapters});

  static const empty = PositionResolver(trackOffsets: [], chapters: []);

  static PositionResolver from(List<MediaItem> items) {
    final offsets = List<Duration>.unmodifiable(
      items.map(
        (item) => Duration(microseconds: item.extras!['startOffset'] as int),
      ),
    );

    final totalDuration = Duration(
      microseconds: items.firstOrNull?.extras?['totalDuration'] as int? ?? 0,
    );

    final raw = items.firstOrNull?.extras?['chapters'] as List<dynamic>? ?? [];
    final chapters = List<Chapter>.unmodifiable(
      raw.map((c) => Chapter.fromJson(c as Map<String, dynamic>)),
    );

    final filledChapters = <Chapter>[];
    Duration coveredUntil = Duration.zero;

    final titleForFill = items.firstOrNull?.title ?? '';
    final subtitleForFill =
        items.firstOrNull?.artist ?? items.firstOrNull?.album ?? '';

    for (final chapter in chapters) {
      final chapterStart = chapter.start.clamp(Duration.zero, totalDuration);
      final chapterEnd = chapter.end.clamp(Duration.zero, totalDuration);

      if (chapterEnd <= chapterStart) continue;

      if (chapterStart > coveredUntil) {
        filledChapters.add(
          Chapter(
            start: coveredUntil,
            end: chapterStart,
            title: titleForFill,
            subtitle: subtitleForFill,
          ),
        );
      }

      filledChapters.add(
        Chapter(
          start: chapterStart,
          end: chapterEnd,
          title: chapter.title,
          subtitle: chapter.subtitle,
          fromTracks: chapter.fromTracks,
        ),
      );
      coveredUntil = chapterEnd;
    }

    if (coveredUntil < totalDuration) {
      filledChapters.add(
        Chapter(
          start: coveredUntil,
          end: totalDuration,
          title: titleForFill,
          subtitle: subtitleForFill,
        ),
      );
    }

    return PositionResolver(
      trackOffsets: offsets,
      chapters: List<Chapter>.unmodifiable(filledChapters),
    );
  }

  int _trackIndexFor(Duration globalPosition) {
    if (_trackOffsets.isEmpty) return 0;
    for (var i = _trackOffsets.length - 1; i >= 0; i--) {
      if (_trackOffsets[i] <= globalPosition) return i;
    }
    return 0;
  }

  int _chapterIndexFor(Duration globalPosition) {
    if (_chapters.isEmpty) return 0;
    for (var i = _chapters.length - 1; i >= 0; i--) {
      if (_chapters[i].start <= globalPosition) return i;
    }
    return 0;
  }

  Duration globalPositionFromTrack(int? index, Duration position) {
    if (index == null || index < 0 || index >= _trackOffsets.length) {
      return Duration.zero;
    }
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

  int chapterIndexFromTrack(int? index, Duration position) {
    if (index == null || index < 0 || index >= _trackOffsets.length) {
      return 0;
    }
    final global = globalPositionFromTrack(index, position);
    final chapterIndex = _chapterIndexFor(global);
    return chapterIndex;
  }

  ({int chapterIndex, Duration chapterPosition}) chapterPositionFromGlobal(
    Duration globalPosition,
  ) {
    final chapterIndex = _chapterIndexFor(globalPosition);
    return (
      chapterIndex: chapterIndex,
      chapterPosition: globalPosition - _chapters[chapterIndex].start,
    );
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

  ({int chapterIndex, Duration chapterPosition})? resolveChapterFromTrack(
    int? index,
    Duration position,
  ) {
    if (index == null || index < 0 || index >= _trackOffsets.length) {
      return null;
    }

    final global = globalPositionFromTrack(index, position);
    final chapterIndex = _chapterIndexFor(global);

    return (
      chapterIndex: chapterIndex,
      chapterPosition: global - _chapters[chapterIndex].start,
    );
  }

  Duration get totalDuration =>
      (_chapters.lastOrNull?.start ?? Duration.zero) +
      (_chapters.lastOrNull?.duration ?? Duration.zero);

  ({int trackIndex, Duration trackPosition})? resolveSeek(
    int chapterIndex,
    Duration chapterPosition,
  ) {
    if (chapterIndex < 0 || chapterIndex >= _chapters.length) return null;

    final global = _chapters[chapterIndex].start + chapterPosition;
    if (global < Duration.zero || global > totalDuration) return null;

    final trackIndex = _trackIndexFor(global);
    final trackPosition = global - _trackOffsets[trackIndex];

    return (trackIndex: trackIndex, trackPosition: trackPosition);
  }
}

extension ChapterX on Chapter {
  MediaItem toMediaItem(MediaItem item) {
    return item.copyWith(
      id: '${item.id}$title',
      title: fromTracks ? item.title : title,
      duration: duration,
      artist: item.artist,
      artUri: item.artUri,
    );
  }
}
