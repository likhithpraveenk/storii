import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

import '../../fakes/fake_api.dart';

void main() {
  final testUser = UserDomain(
    id: 'user-id',
    username: 'test-user',
    userType: 'user',
    serverUrl: Uri.parse('http://localhost'),
  );

  late FakeSocketApi socket;

  setUp(() {
    socket = FakeSocketApi();
  });

  tearDown(() {
    socket.dispose();
  });

  ProviderContainer createContainer({bool signedIn = true}) =>
      ProviderContainer(
        overrides: [
          currentUserProvider.overrideWithValue(signedIn ? testUser : null),
          socketApiProvider.overrideWith((ref, _) async => socket),
        ],
      );

  group('socketStatus', () {
    test('streams the live socket status', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final sub = container.listen(socketStatusProvider, (_, _) {});
      await pumpEventQueue();
      expect(sub.read().value, SocketStatus.connecting);

      socket.emitStatus(.ready);
      await pumpEventQueue();
      expect(sub.read().value, SocketStatus.ready);

      socket.emitStatus(.authenticating);
      await pumpEventQueue();
      expect(sub.read().value, SocketStatus.authenticating);

      socket.emitStatus(.disconnected);
      await pumpEventQueue();
      expect(sub.read().value, SocketStatus.disconnected);
    });

    test('is disconnected without a current user', () async {
      final container = createContainer(signedIn: false);
      addTearDown(container.dispose);

      final sub = container.listen(socketStatusProvider, (_, _) {});
      await pumpEventQueue();
      expect(sub.read().value, SocketStatus.disconnected);
    });
  });
}
