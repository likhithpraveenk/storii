import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/playback_sync_service.dart';

import '../../../fakes/fake_playback_history_notifier.dart';
import '../../../fakes/fake_session.dart';

void main() {
  late StreamController<AudioHandlerEvent> audioEvents;
  late List<({Duration listened, Duration position})> syncCalls;
  late PlaybackSyncService service;
  var playing = false;

  PlaybackSyncService makeService({OnSync? onSync}) {
    return PlaybackSyncService(
      session: fakeBookSession,
      history: FakePlaybackHistoryNotifier(),
      audioEvents: audioEvents.stream,
      syncInterval: const Duration(hours: 1),
      getPosition: () => const Duration(seconds: 30),
      isPlaying: () => playing,
      onSync:
          onSync ??
          (listened, position) async =>
              syncCalls.add((listened: listened, position: position)),
      onClose: () async {},
      onMarkComplete: () async {},
    );
  }

  Future<void> emit(AudioHandlerEvent event) async {
    audioEvents.add(event);
    await Future.delayed(Duration.zero);
  }

  setUp(() {
    audioEvents = StreamController<AudioHandlerEvent>.broadcast();
    syncCalls = [];
    service = makeService();
  });

  tearDown(() async {
    await service.dispose();
    await audioEvents.close();
  });

  test('does not sync if listened < 200ms', () async {
    playing = true;
    await emit(.play);
    await emit(.pause);
    expect(syncCalls, isEmpty);
  });

  test('syncs after sufficient listen time', () async {
    playing = true;
    await emit(.play);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.pause);
    expect(syncCalls.length, 1);
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
    await emit(.play);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.pause);
    expect(attempts, 1);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.play);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.pause);
    expect(attempts, 3);
    expect(syncCalls, isEmpty);
  });

  test('complete calls onMarkComplete and onClose', () async {
    final calls = <String>[];
    await service.dispose();
    service = PlaybackSyncService(
      session: fakeBookSession,
      history: FakePlaybackHistoryNotifier(),
      audioEvents: audioEvents.stream,
      syncInterval: const Duration(hours: 1),
      getPosition: () => const Duration(seconds: 30),
      isPlaying: () => playing,
      onSync: (_, _) async {},
      onClose: () async => calls.add('close'),
      onMarkComplete: () async => calls.add('complete'),
    );
    playing = true;
    await emit(.play);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.complete);
    expect(calls, ['complete', 'close']);
  });

  test('dispose stops timer and subscription', () async {
    playing = true;
    await service.dispose();
    await emit(.play);
    await Future.delayed(const Duration(milliseconds: 300));
    await emit(.pause);
    expect(syncCalls, isEmpty);
  });
}
