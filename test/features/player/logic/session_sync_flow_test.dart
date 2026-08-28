import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';
import 'package:storii/storage/local/session_store.dart';

import '../../../fakes/fake_api.dart';
import '../../../fakes/fake_session.dart';
import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

void main() {
  late FakeSessionStore sessionStore;
  late FakeSessionsApi fakeSessionsApi;
  late FakeSocketApi fakeSocketApi;

  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  setUp(() {
    sessionStore = FakeSessionStore();
    fakeSessionsApi = FakeSessionsApi();
    fakeSocketApi = FakeSocketApi();
  });

  tearDown(() {
    fakeSocketApi.dispose();
  });

  final testUser = UserDomain(
    id: 'user-id',
    username: 'test-user',
    userType: 'root',
    serverUrl: Uri.parse('http://localhost'),
  );

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        sessionStoreProvider.overrideWith(() => sessionStore),
        currentUserProvider.overrideWithValue(testUser),
        authenticatedUserProvider.overrideWith((ref) async => testUser),
        socketApiProvider(testUser).overrideWith((ref) async => fakeSocketApi),
        sessionsApiProvider(testUser).overrideWithValue(fakeSessionsApi),
      ],
    );
  }

  group('Offline Local Playback Flow', () {
    test('N consecutive failed syncs accumulate linearly in Hive', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      container.listen(socketStatusProvider, (_, _) {});
      fakeSocketApi.emitConnected(connected: false);
      await pumpEventQueue();

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

      container.listen(socketStatusProvider, (_, _) {});
      fakeSocketApi.emitConnected(connected: false);
      await pumpEventQueue();

      container.read(sessionProvider.notifier).state = fakeBookSession;

      // offline sync -> throw, no server call
      await expectLater(
        container
            .read(sessionProvider.notifier)
            .sync(const Duration(seconds: 20), const Duration(seconds: 20)),
        throwsA(equals('No Server Connection')),
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
      fakeSocketApi.emitConnected(connected: true);
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
  });
}
