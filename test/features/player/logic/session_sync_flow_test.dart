import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/repositories/session_repository.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/progress_store.dart';
import 'package:storii/storage/local/session_store.dart';

import '../../../fakes/fake_api.dart';
import '../../../fakes/fake_session.dart';
import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

void main() {
  late FakeSessionStore sessionStore;
  late FakeProgressStore progressStore;
  late FakeSessionsApi fakeSessionsApi;
  late FakeItemApi fakeItemApi;
  late BehaviorSubject<List<ConnectivityResult>> connectivity;

  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  final testUser = UserDomain(
    id: 'user-id',
    username: 'test-user',
    userType: 'root',
    serverUrl: Uri.parse('http://localhost'),
  );

  setUp(() {
    sessionStore = FakeSessionStore();
    progressStore = FakeProgressStore(userId: testUser.id);
    fakeSessionsApi = FakeSessionsApi();
    fakeItemApi = FakeItemApi();
    connectivity = BehaviorSubject.seeded([ConnectivityResult.wifi]);
  });

  tearDown(() {
    connectivity.close();
  });

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        sessionStoreProvider.overrideWithValue(sessionStore),
        progressStoreProvider(testUser.id).overrideWithValue(progressStore),
        currentUserProvider.overrideWithValue(testUser),
        authenticatedUserProvider.overrideWith((ref) async => testUser),
        connectivityStreamProvider.overrideWith((ref) => connectivity.stream),
        sessionsApiProvider.overrideWith((ref, _) => fakeSessionsApi),
        sessionRepositoryProvider.overrideWith(
          (ref, _) => SessionRepository(fakeItemApi, fakeSessionsApi),
        ),
      ],
    );
  }

  Future<void> goOffline(ProviderContainer container) async {
    container.listen(isOfflineProvider, (_, _) {});
    connectivity.add([ConnectivityResult.none]);
    await pumpEventQueue();
  }

  group('Offline Local Playback Flow', () {
    test('N consecutive failed syncs accumulate linearly in Hive', () async {
      final container = createContainer();
      addTearDown(container.dispose);
      await goOffline(container);

      sessionStore.sessions[fakeLocalBookSession.id] = fakeLocalBookSession;
      container.read(sessionProvider.notifier).state = fakeLocalBookSession;

      // tick 1: +20s
      await container
          .read(sessionProvider.notifier)
          .sync(const Duration(seconds: 20), const Duration(seconds: 20));
      expect(
        sessionStore.sessions[fakeLocalBookSession.id]?.timeListening,
        const Duration(seconds: 20),
        reason: 'Tick 1 must be 20s',
      );

      // tick 2: +20s -> 40s
      await container
          .read(sessionProvider.notifier)
          .sync(const Duration(seconds: 20), const Duration(seconds: 40));
      expect(
        sessionStore.sessions[fakeLocalBookSession.id]?.timeListening,
        const Duration(seconds: 40),
        reason: 'Tick 2 must be 40s',
      );

      // tick 3: +20s -> 60s
      await container
          .read(sessionProvider.notifier)
          .sync(const Duration(seconds: 20), const Duration(seconds: 60));
      expect(
        sessionStore.sessions[fakeLocalBookSession.id]?.timeListening,
        const Duration(seconds: 60),
        reason: 'Tick 3 must be 60s',
      );
    });
  });

  group('Reconnection Cleanup Flow', () {
    test('SessionsCleanup pushes exact local timeListening to server and deletes from store', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      // seed 400min offline session in store
      final offlineSession = fakeLocalBookSession.copyWith(
        timeListening: const Duration(minutes: 400),
        currentTime: const Duration(minutes: 400),
      );
      sessionStore.sessions[offlineSession.id] = offlineSession;
      await container.read(sessionsCleanupProvider.notifier).cleanup();

      expect(fakeSessionsApi.localSyncCalls.length, 1);
      expect(
        fakeSessionsApi.localSyncCalls.first.timeListening,
        const Duration(minutes: 400),
      );

      expect(sessionStore.sessions.containsKey(offlineSession.id), isFalse);
    });
  });

  group('Streaming Offline/Online Flow', () {
    test('Streaming offline disconnect saves position only and preserves delta for reconnect', () async {
      final container = createContainer();
      addTearDown(container.dispose);
      await goOffline(container);

      container.read(sessionProvider.notifier).state = fakeBookSession;

      // offline sync -> throw, no server call
      await expectLater(
        container
            .read(sessionProvider.notifier)
            .sync(const Duration(seconds: 20), const Duration(seconds: 20)),
        throwsA(
          isA<AppError>().having(
            (e) => e.message,
            'message',
            'No Server Connection',
          ),
        ),
      );

      // position saved, timeListening stays 0 -> delta preserved for reconnect
      expect(
        sessionStore.sessions[fakeBookSession.id]?.currentTime,
        const Duration(seconds: 20),
      );
      expect(
        sessionStore.sessions[fakeBookSession.id]?.timeListening,
        Duration.zero,
      );

      // reconnect -> online sync sends 60s accumulated delta, drop from store
      connectivity.add([ConnectivityResult.wifi]);
      await pumpEventQueue();

      await container
          .read(sessionProvider.notifier)
          .sync(const Duration(seconds: 60), const Duration(seconds: 60));

      expect(fakeSessionsApi.sessionSyncCalls.length, 1);
      expect(
        fakeSessionsApi.sessionSyncCalls.first.params.timeListened,
        const Duration(seconds: 60),
      );
      expect(sessionStore.sessions.containsKey(fakeBookSession.id), isFalse);
    });

    test(
      'network failure while online saves position and preserves delta',
      () async {
        final container = createContainer();
        addTearDown(container.dispose);

        container.listen(isOfflineProvider, (_, _) {});
        await pumpEventQueue();

        container.read(sessionProvider.notifier).state = fakeBookSession;
        fakeSessionsApi.syncErrorType = .network;

        await expectLater(
          container
              .read(sessionProvider.notifier)
              .sync(const Duration(seconds: 20), const Duration(seconds: 20)),
          throwsA(isA<AppError>()),
        );

        expect(fakeSessionsApi.sessionSyncCalls, isEmpty);
        expect(
          sessionStore.sessions[fakeBookSession.id]?.currentTime,
          const Duration(seconds: 20),
        );
        expect(
          sessionStore.sessions[fakeBookSession.id]?.timeListening,
          Duration.zero,
        );
      },
    );
  });
}
