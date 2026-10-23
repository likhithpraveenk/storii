import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

import '../../fakes/fake_api.dart';
import '../../helpers/init_globals.dart';

void main() {
  setUpAll(initGlobals);
  tearDownAll(disposeGlobals);

  final testUser = UserDomain(
    id: 'user-id',
    username: 'test-user',
    userType: 'user',
    serverUrl: Uri.parse('http://localhost'),
  );

  late FakeSocketApi socket;
  late StreamController<List<ConnectivityResult>> connectivity;

  setUp(() {
    socket = FakeSocketApi();
    connectivity = StreamController.broadcast();
  });

  tearDown(() {
    socket.dispose();
    connectivity.close();
  });

  ProviderContainer createContainer() => ProviderContainer(
    overrides: [
      currentUserProvider.overrideWithValue(testUser),
      socketApiProvider.overrideWith((ref, _) async => socket),
      connectivityStreamProvider.overrideWith((ref) => connectivity.stream),
    ],
  );

  group('socketStatus', () {
    test('only a lost transport reads as offline', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final sub = container.listen(socketStatusProvider, (_, _) {});
      await pumpEventQueue();
      expect(sub.read().value, isTrue);

      socket.emitStatus(.authFailed);
      await pumpEventQueue();
      expect(sub.read().value, isTrue);

      socket.emitStatus(.authenticating);
      await pumpEventQueue();
      expect(sub.read().value, isTrue);

      socket.emitStatus(.disconnected);
      await pumpEventQueue();
      expect(sub.read().value, isFalse);

      socket.emitStatus(.ready);
      await pumpEventQueue();
      expect(sub.read().value, isTrue);
    });
  });

  group('serverConnection', () {
    test('seeds from the current socket value', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      container.listen(socketStatusProvider, (_, _) {});
      await pumpEventQueue();

      socket.emitStatus(.disconnected);
      await pumpEventQueue();

      expect(container.read(serverConnectionProvider), isFalse);
    });

    test('auth handshake does not drop the connection', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final values = <bool>[];
      container.listen(serverConnectionProvider, (_, next) => values.add(next));
      await pumpEventQueue();

      socket.emitStatus(.ready);
      await pumpEventQueue();
      socket.emitStatus(.authenticating);
      await pumpEventQueue();
      socket.emitStatus(.authFailed);
      await pumpEventQueue();
      socket.emitStatus(.ready);
      await pumpEventQueue();

      expect(values, isNot(contains(false)));
      expect(container.read(serverConnectionProvider), isTrue);
    });

    test('losing connectivity reports offline', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      container.listen(serverConnectionProvider, (_, _) {});
      await pumpEventQueue();

      connectivity.add([ConnectivityResult.none]);
      await pumpEventQueue();

      expect(container.read(serverConnectionProvider), isFalse);
    });
  });
}
