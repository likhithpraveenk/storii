import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/player/logic/playback_sync_service.dart';

import '../../../fakes/fake_playback_history_notifier.dart';
import '../../../fakes/fake_session.dart';

void main() {
  late List<({Duration listened, Duration position})> syncCalls;
  var playing = false;

  PlaybackSyncService makeService({
    OnSync? onSync,
    OnSessionClose? onClose,
    OnMarkComplete? onMarkComplete,
  }) {
    return PlaybackSyncService(
      session: fakeBookSession,
      history: FakePlaybackHistoryNotifier(),
      getSyncInterval: () => const Duration(hours: 1),
      getPosition: () => const Duration(seconds: 30),
      isPlaying: () => playing,
      onSync:
          onSync ??
          (listened, position, {closing = false}) async =>
              syncCalls.add((listened: listened, position: position)),
      onClose: onClose ?? () async {},
      onMarkComplete: onMarkComplete ?? () async {},
    );
  }

  setUp(() {
    syncCalls = [];
    playing = false;
  });

  test(
    'does not sync on pause if listened < 200ms, but syncs on play',
    () async {
      playing = true;
      final service = makeService();
      await service.onPlay();
      expect(syncCalls.length, 1);
      expect(syncCalls.first.listened.inMilliseconds, lessThan(200));

      await service.onPause();
      expect(syncCalls.length, 1);
      await service.dispose();
    },
  );

  test('syncs on play and syncs again after sufficient listen time', () {
    fakeAsync((async) async {
      playing = true;
      final service = makeService();

      await service.onPlay();
      async.elapse(const Duration(milliseconds: 300));
      await service.onPause();
      expect(syncCalls.length, 2);
      expect(syncCalls[1].listened.inMilliseconds, greaterThanOrEqualTo(300));

      await service.dispose();
    });
  });

  test('rolls back time on sync failure', () {
    fakeAsync((async) async {
      var attempts = 0;
      final service = makeService(
        onSync: (_, _, {closing = false}) async {
          attempts++;
          throw Exception();
        },
      );
      playing = true;

      await service.onPlay();
      expect(attempts, 1);

      async.elapse(const Duration(milliseconds: 300));
      await service.onPause();
      expect(attempts, 2);
      expect(syncCalls, isEmpty);

      await service.dispose();
    });
  });

  test('seek after buffering preserves accumulated time', () {
    fakeAsync((async) async {
      playing = true;
      final service = makeService();

      await service.onPlay();
      async.elapse(const Duration(milliseconds: 500));
      service
        ..onBuffering()
        ..onBufferingComplete();
      await service.onSeek();
      expect(syncCalls.last.listened.inMilliseconds, greaterThanOrEqualTo(500));

      await service.dispose();
    });
  });

  test('onStop syncs and calls onClose', () {
    fakeAsync((async) async {
      final calls = <String>[];
      final service = makeService(onClose: () async => calls.add('close'));
      playing = true;

      await service.onPlay();
      async.elapse(const Duration(milliseconds: 300));
      await service.onStop();
      expect(calls, ['close']);
      expect(syncCalls.length, 2);

      await service.dispose();
    });
  });

  test('complete calls onMarkComplete', () {
    fakeAsync((async) async {
      final calls = <String>[];
      final service = makeService(
        onClose: () async => calls.add('close'),
        onMarkComplete: () async => calls.add('complete'),
      );
      playing = true;

      await service.onPlay();
      async.elapse(const Duration(milliseconds: 300));
      await service.onComplete();
      expect(calls, ['complete']);

      await service.dispose();
    });
  });

  test('periodic timer triggers sync when interval elapses', () {
    fakeAsync((async) async {
      playing = true;
      final localService = makeService(); // sync interval is 1hr

      await localService.onPlay();
      expect(syncCalls.length, 1);

      async.elapse(const Duration(minutes: 30));
      expect(syncCalls.length, 1);

      async.elapse(const Duration(minutes: 31));
      expect(syncCalls.length, 2);
      expect(syncCalls.first.listened.inMinutes, greaterThanOrEqualTo(60));

      await localService.dispose();
    });
  });

  test('dispose stops periodic timer', () {
    fakeAsync((async) async {
      playing = true;
      final localService = makeService();

      async.elapse(const Duration(minutes: 30));
      expect(syncCalls, isEmpty);

      await localService.dispose();

      async.elapse(const Duration(hours: 2));
      expect(syncCalls, isEmpty);
    });
  });
}
