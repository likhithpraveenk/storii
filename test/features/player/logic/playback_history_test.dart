import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/storage/local/playback_history_store.dart';

import '../../../fakes/fake_stores.dart';

void main() {
  late FakePlaybackHistoryStore store;
  late ProviderContainer container;

  final user = UserDomain(
    id: '1',
    username: 'user',
    userType: '',
    serverUrl: Uri.parse(''),
  );
  const mediaItemId = 'media-1';

  PlaybackEvent event({
    required DateTime timestamp,
    Duration position = Duration.zero,
    PlaybackEventKind kind = .play,
    Duration listened = Duration.zero,
    bool syncAttempt = false,
    bool syncSuccess = false,
    bool playbackError = false,
  }) {
    return PlaybackEvent(
      timestamp: timestamp,
      position: position,
      kind: kind,
      listened: listened,
      syncAttempt: syncAttempt,
      syncSuccess: syncSuccess,
      playbackError: playbackError,
    );
  }

  setUp(() {
    store = FakePlaybackHistoryStore();

    container = ProviderContainer(
      overrides: [
        currentUserProvider.overrideWithValue(user),
        historyLimitProvider.overrideWithValue(10),
        playbackHistoryStoreProvider.overrideWithValue(store),
      ],
    );
    addTearDown(container.dispose);
  });

  PlaybackHistoryNotifier notifier() =>
      container.read(playbackHistoryProvider(mediaItemId).notifier);

  Future<List<PlaybackEvent>> state() =>
      container.read(playbackHistoryProvider(mediaItemId).future);

  group('build', () {
    test('returns empty list when there is no current user', () async {
      container = ProviderContainer(
        overrides: [
          currentUserProvider.overrideWithValue(null),
          historyLimitProvider.overrideWithValue(10),
          playbackHistoryStoreProvider.overrideWithValue(store),
        ],
      );
      addTearDown(container.dispose);
      final events = await state();
      expect(events, isEmpty);
    });

    test('hydrates from the store when a user is present', () async {
      final seeded = [event(timestamp: DateTime(2026))];
      store.seed(user.id, mediaItemId, seeded);

      container = ProviderContainer(
        overrides: [
          currentUserProvider.overrideWithValue(user),
          historyLimitProvider.overrideWithValue(10),
          playbackHistoryStoreProvider.overrideWithValue(store),
        ],
      );
      addTearDown(container.dispose);

      final events = await state();
      expect(events, equals(seeded));
    });
  });

  group('addEvent', () {
    test('appends', () async {
      final e1 = event(timestamp: DateTime(2026), kind: .sync);
      final e2 = event(timestamp: DateTime(2026, 1, 1, 0, 0, 1), kind: .sync);

      await notifier().addEvent(e1);
      await notifier().addEvent(e2);

      final events = await state();
      expect(events, equals([e1, e2]));
      expect(store.putCalls, 2);
    });

    test('trims oldest events once historyLimit is exceeded', () async {
      container = ProviderContainer(
        overrides: [
          currentUserProvider.overrideWithValue(user),
          historyLimitProvider.overrideWithValue(2),
          playbackHistoryStoreProvider.overrideWithValue(store),
        ],
      );
      addTearDown(container.dispose);

      final events = List.generate(
        3,
        (i) => event(timestamp: DateTime(2026, 1, 1, 0, 0, i)),
      );

      for (final e in events) {
        await container
            .read(playbackHistoryProvider(mediaItemId).notifier)
            .addEvent(e);
      }

      final result = await container.read(
        playbackHistoryProvider(mediaItemId).future,
      );
      expect(result.length, 2);
      expect(result, equals(events.sublist(1)));
    });
  });

  group('updateEvent', () {
    test('replaces the event with a matching timestamp', () async {
      final original = event(timestamp: DateTime(2026));
      await notifier().addEvent(original);

      final updated = original.copyWith(playbackError: true);
      await notifier().updateEvent(updated);

      final events = await state();
      expect(events, equals([updated]));
    });

    test(
      'collapses consecutive sync events with matching syncSuccess',
      () async {
        final pending1 = event(
          timestamp: DateTime(2026),
          kind: .sync,
          syncAttempt: true,
        );
        final pending2 = event(
          timestamp: DateTime(2026, 1, 1, 0, 0, 1),
          kind: .sync,
          syncAttempt: true,
        );

        await notifier().addEvent(pending1);
        await notifier().addEvent(pending2);

        await notifier().updateEvent(pending1.copyWith(syncSuccess: true));
        await notifier().updateEvent(pending2.copyWith(syncSuccess: true));

        final events = await state();
        expect(events.length, 1);
        expect(events.single.syncSuccess, isTrue);
      },
    );

    test('sums listened duration when collapsing like events', () async {
      final e1 = event(
        timestamp: DateTime(2026),
        kind: .sync,
        listened: const Duration(seconds: 10),
      );
      final e2 = event(
        timestamp: DateTime(2026, 1, 1, 0, 0, 1),
        kind: .sync,
        listened: const Duration(seconds: 15),
      );

      await notifier().addEvent(e1);
      await notifier().addEvent(e2);

      await notifier().updateEvent(e2.copyWith(playbackError: false));

      final events = await state();
      expect(events.single.listened, const Duration(seconds: 25));
      expect(events.length, 1);
    });

    test('does not collapse across a non-like event in between', () async {
      final syncA = event(
        timestamp: DateTime(2026),
        kind: .sync,
        syncSuccess: true,
      );
      final pauseEvent = event(
        timestamp: DateTime(2026, 1, 1, 0, 0, 1),
        kind: .pause,
      );
      final syncB = event(
        timestamp: DateTime(2026, 1, 1, 0, 0, 2),
        kind: .sync,
        syncSuccess: true,
      );

      await notifier().addEvent(syncA);
      await notifier().addEvent(pauseEvent);
      await notifier().addEvent(syncB);
      await notifier().updateEvent(syncB);

      final events = await state();
      expect(events.length, 3);
    });
  });

  group('clearHistory', () {
    test('empties state and removes from the store', () async {
      await notifier().addEvent(event(timestamp: DateTime(2026)));

      await notifier().clearHistory();

      final events = await state();
      expect(events, isEmpty);
      expect(store.removeCalls, 1);
    });
  });
}
