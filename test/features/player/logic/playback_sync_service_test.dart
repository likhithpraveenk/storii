import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/player/logic/playback_sync_service.dart';

import '../../../fakes/fake_playback_history_notifier.dart';
import '../../../fakes/fake_session.dart';

void main() {
  late List<({Duration listened, Duration position})> syncCalls;
  late PlaybackSyncService service;
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
          (listened, position) async =>
              syncCalls.add((listened: listened, position: position)),
      onClose: onClose ?? () async {},
      onMarkComplete: onMarkComplete ?? () async {},
    );
  }

  setUp(() {
    syncCalls = [];
    service = makeService();
  });

  tearDown(() async {
    await service.dispose();
  });

  test(
    'does not sync on pause if listened < 200ms, but syncs on play',
    () async {
      playing = true;
      await service.onPlay();
      expect(syncCalls.length, 1);
      expect(syncCalls.first.listened.inMilliseconds, lessThan(200));

      await service.onPause();
      expect(syncCalls.length, 1);
    },
  );

  test('syncs on play and syncs again after sufficient listen time', () async {
    playing = true;

    await service.onPlay();
    await Future.delayed(const Duration(milliseconds: 300));
    await service.onPause();
    expect(syncCalls.length, 2);
    expect(syncCalls[1].listened.inMilliseconds, greaterThanOrEqualTo(300));
  });

  test('rolls back time on sync failure', () async {
    var attempts = 0;
    await service.dispose();
    service = makeService(
      onSync: (_, _) async {
        attempts++;
        throw Exception();
      },
    );
    playing = true;

    await service.onPlay();
    expect(attempts, 1);

    await Future.delayed(const Duration(milliseconds: 300));
    await service.onPause();
    expect(attempts, 2);
    expect(syncCalls, isEmpty);
  });

  test('seek after buffering preserves accumulated time', () async {
    playing = true;
    await service.onPlay();
    await Future.delayed(const Duration(milliseconds: 500));
    service.onBuffering();
    service.onBufferingComplete();
    await service.onSeek();
    expect(syncCalls.last.listened.inMilliseconds, greaterThanOrEqualTo(500));
  });

  test('onStop syncs and calls onClose', () async {
    final calls = <String>[];
    await service.dispose();
    service = makeService(onClose: () async => calls.add('close'));
    playing = true;

    await service.onPlay();
    await Future.delayed(const Duration(milliseconds: 300));
    await service.onStop();
    expect(calls, ['close']);
    expect(syncCalls.length, 2);
  });

  test('complete calls onMarkComplete and onClose', () async {
    final calls = <String>[];
    await service.dispose();
    service = makeService(
      onClose: () async => calls.add('close'),
      onMarkComplete: () async => calls.add('complete'),
    );
    playing = true;

    await service.onPlay();
    await Future.delayed(const Duration(milliseconds: 300));
    await service.onComplete();
    expect(calls, ['complete', 'close']);
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
