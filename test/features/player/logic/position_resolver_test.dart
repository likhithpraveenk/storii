import 'package:audio_service/audio_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/player/logic/position_resolver.dart';

void main() {
  PositionResolver makeFromItems(List<MediaItem> items) =>
      PositionResolver.from(items);

  Map<String, dynamic> chapterJson({
    required int displayIndex,
    required Duration start,
    required Duration end,
    required String title,
  }) => Chapter(
    displayIndex: displayIndex,
    start: start,
    end: end,
    title: title,
    subtitle: '',
  ).toJson();

  MediaItem makeTrack({
    required Duration startOffset,
    required List<Map<String, dynamic>>? chapters,
    String id = 'track',
    Duration duration = const Duration(seconds: 60),
  }) => MediaItem(
    id: id,
    title: 'Title',
    duration: duration,
    extras: {'chapters': ?chapters, 'startOffset': startOffset.inMicroseconds},
  );

  group('single track, multiple chapters', () {
    late PositionResolver resolver;

    setUp(() {
      final chapters = [
        chapterJson(
          displayIndex: 1,
          start: Duration.zero,
          end: const Duration(seconds: 30),
          title: 'Ch 1',
        ),
        chapterJson(
          displayIndex: 2,
          start: const Duration(seconds: 30),
          end: const Duration(seconds: 60),
          title: 'Ch 2',
        ),
      ];
      resolver = makeFromItems([
        makeTrack(startOffset: Duration.zero, chapters: chapters),
      ]);
    });

    test('resolves position in first chapter', () {
      final result = resolver.resolveChapterFromTrack(
        0,
        const Duration(seconds: 10),
      );
      expect(result?.chapterIndex, 0);
      expect(result?.chapterPosition, const Duration(seconds: 10));
    });

    test('resolves position in second chapter', () {
      final result = resolver.resolveChapterFromTrack(
        0,
        const Duration(seconds: 40),
      );
      expect(result?.chapterIndex, 1);
      expect(result?.chapterPosition, const Duration(seconds: 10));
    });

    test('resolveSeek maps chapter position back to track position', () {
      final result = resolver.resolveSeek(1, const Duration(seconds: 5));
      expect(result?.trackIndex, 0);
      expect(result?.trackPosition, const Duration(seconds: 35));
    });
  });

  group('multiple tracks, multiple chapters', () {
    late PositionResolver resolver;

    setUp(() {
      // track 0: 0-60s, track 1: 60-120s
      // chapter 0: 0-40s, chapter 1: 40-80s, chapter 2: 80-120s
      final chapters = [
        chapterJson(
          displayIndex: 1,
          start: Duration.zero,
          end: const Duration(seconds: 40),
          title: 'Ch 1',
        ),
        chapterJson(
          displayIndex: 2,
          start: const Duration(seconds: 40),
          end: const Duration(seconds: 80),
          title: 'Ch 2',
        ),
        chapterJson(
          displayIndex: 3,
          start: const Duration(seconds: 80),
          end: const Duration(seconds: 120),
          title: 'Ch 3',
        ),
      ];
      resolver = makeFromItems([
        makeTrack(startOffset: Duration.zero, chapters: chapters, id: 'track0'),
        makeTrack(
          startOffset: const Duration(seconds: 60),
          chapters: null,
          id: 'track1',
        ),
      ]);
    });

    test('globalPositionFromTrack adds track offset', () {
      expect(
        resolver.globalPositionFromTrack(1, const Duration(seconds: 10)),
        const Duration(seconds: 70),
      );
    });

    test('chapter spanning two tracks resolves correctly from track 1', () {
      // track 1 position 10s = global 70s = chapter 1 (40-80s), position 30s into it
      final result = resolver.resolveChapterFromTrack(
        1,
        const Duration(seconds: 10),
      );
      expect(result?.chapterIndex, 1);
      expect(result?.chapterPosition, const Duration(seconds: 30));
    });

    test(
      'resolveSeek into track 1 returns correct track index and position',
      () {
        // chapter 2 starts at 80s global, track 1 offset is 60s
        final result = resolver.resolveSeek(2, const Duration(seconds: 5));
        expect(result?.trackIndex, 1);
        expect(result?.trackPosition, const Duration(seconds: 25));
      },
    );
  });

  test('chapterPositionFromGlobal returns correct index and position', () {
    final chapters = [
      chapterJson(
        displayIndex: 1,
        start: Duration.zero,
        end: const Duration(seconds: 40),
        title: 'Ch 1',
      ),
      chapterJson(
        displayIndex: 2,
        start: const Duration(seconds: 40),
        end: const Duration(seconds: 80),
        title: 'Ch 2',
      ),
      chapterJson(
        displayIndex: 3,
        start: const Duration(seconds: 80),
        end: const Duration(seconds: 120),
        title: 'Ch 3',
      ),
    ];
    final resolver = makeFromItems([
      makeTrack(startOffset: Duration.zero, chapters: chapters, id: 'track0'),
      makeTrack(
        startOffset: const Duration(seconds: 60),
        chapters: null,
        id: 'track1',
      ),
    ]);
    final r = resolver.chapterPositionFromGlobal(const Duration(seconds: 50));
    expect(r.chapterIndex, 1);
    expect(r.chapterPosition, const Duration(seconds: 10));
  });

  group('multiple tracks, no chapters (fromTracks)', () {
    late PositionResolver resolver;

    setUp(() {
      // tracks become chapters via toAudioSources logic —
      // each track is its own chapter, start = accumulated offset
      final track0Chapters = [
        chapterJson(
          displayIndex: 1,
          start: Duration.zero,
          end: const Duration(seconds: 45),
          title: 'Part 1',
        ),
        chapterJson(
          displayIndex: 2,
          start: const Duration(seconds: 45),
          end: const Duration(seconds: 90),
          title: 'Part 2',
        ),
      ];
      resolver = makeFromItems([
        makeTrack(
          startOffset: Duration.zero,
          chapters: track0Chapters,
          id: 'track0',
          duration: const Duration(seconds: 45),
        ),
        makeTrack(
          startOffset: const Duration(seconds: 45),
          chapters: null,
          id: 'track1',
          duration: const Duration(seconds: 45),
        ),
      ]);
    });

    test('each track maps to its own chapter', () {
      final result = resolver.resolveChapterFromTrack(
        1,
        const Duration(seconds: 10),
      );
      expect(result?.chapterIndex, 1);
      expect(result?.chapterPosition, const Duration(seconds: 10));
    });

    test('resolveSeek into second track chapter returns correct track', () {
      final result = resolver.resolveSeek(1, const Duration(seconds: 5));
      expect(result?.trackIndex, 1);
      expect(result?.trackPosition, const Duration(seconds: 5));
    });

    test('invalid track index returns null', () {
      expect(resolver.resolveChapterFromTrack(99, Duration.zero), isNull);
      expect(resolver.resolveChapterFromTrack(null, Duration.zero), isNull);
    });
  });
}
