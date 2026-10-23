import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';

import '../../../fakes/fake_socket.dart';

/// Mirrors socket_io_client's dispose ordering: `dispose()` emits `disconnect`
/// synchronously before clearing its listeners.
class _DisconnectOnDisposeSocket extends FakeSocket {
  @override
  void dispose() {
    if (connected) serverDrops('io client disconnect');
    disposed = true;
  }
}

class _TokenSource {
  new(this.value);

  String? value;

  Future<String?> call() async => value;
}

class _SocketApiFixture {
  new({
    required this.api,
    required this.socket,
    required this.authFailures,
    required this.tokens,
  });

  final SocketApi api;
  final FakeSocket socket;
  final List<String> authFailures;
  final _TokenSource tokens;

  void dispose() => api.dispose();
}

_SocketApiFixture _createFixture({
  FakeSocket? socket,
  String? token = 'T1',
  void Function(String)? onAuthFailure,
  String baseUrl = 'http://localhost',
}) {
  final s = socket ?? FakeSocket();
  final failures = <String>[];
  final tokens = _TokenSource(token);
  final api = SocketApi(
    socket: s,
    baseUrl: baseUrl,
    getToken: tokens.call,
    onAuthFailure: onAuthFailure ?? failures.add,
  );
  return _SocketApiFixture(
    api: api,
    socket: s,
    authFailures: failures,
    tokens: tokens,
  );
}

List<Object?> _authTokens(FakeSocket s) =>
    s.emitted.where((e) => e.event == 'auth').map((e) => e.data).toList();

void _expectReady(SocketApi api) {
  expect(api.status, SocketStatus.ready);
  expect(api.isReady, isTrue);
}

void _expectAuthFailed(SocketApi api) {
  expect(api.status, SocketStatus.authFailed);
}

void _expectAuthTokens(FakeSocket socket, List<String> expected) {
  expect(_authTokens(socket), expected);
}

void main() {
  group('SocketApi', () {
    group('auth handshake', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('emits auth on server accept', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T1']);
      });

      test('fails and disconnects when no token is available', () async {
        final bare = _createFixture(token: null);
        addTearDown(bare.dispose);

        bare.socket.serverAccepts();
        await pumpEventQueue();

        expect(bare.socket.emitted, isEmpty);
        _expectAuthFailed(bare.api);
        expect(bare.socket.connected, isFalse);
      });

      test('token read failure fails auth without throwing', () async {
        final socket = FakeSocket();
        final api = SocketApi(
          socket: socket,
          baseUrl: 'http://localhost',
          getToken: () async => throw StateError('vault locked'),
        );
        addTearDown(api.dispose);

        socket.serverAccepts();
        await pumpEventQueue();

        expect(socket.emitted, isEmpty);
        _expectAuthFailed(api);
      });

      test('storage re-drives token-less handshake', () async {
        final late = _createFixture(token: null);
        addTearDown(late.dispose);

        late.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(late.socket, []);
        _expectAuthFailed(late.api);

        late.tokens.value = 'T1';
        await late.api.refresh();
        await pumpEventQueue();
        expect(late.api.status, SocketStatus.connecting);
        expect(late.socket.connectCalls, 2);

        late.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(late.socket, ['T1']);
      });
    });

    group('reconnection', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('re-authenticates on every reconnect', () async {
        final states = <SocketStatus>[];
        fixture.api.statusStream.listen(states.add);
        await pumpEventQueue();

        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverDrops();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverDrops();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();

        expect(states, <SocketStatus>[
          .connecting,
          .authenticating,
          .disconnected,
          .authenticating,
          .disconnected,
          .authenticating,
        ]);
        _expectAuthTokens(fixture.socket, ['T1', 'T1', 'T1']);
      });

      test('refresh reconnects when the transport is down', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverDrops();
        await pumpEventQueue();
        expect(fixture.api.status, SocketStatus.disconnected);
        expect(fixture.socket.connected, isFalse);

        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();

        expect(fixture.api.status, SocketStatus.connecting);
        expect(fixture.socket.connectCalls, 2);

        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T1', 'T2']);
      });

      test('refresh is a no-op when the token did not change', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
        });
        await pumpEventQueue();
        _expectReady(fixture.api);
        fixture.socket.emitted.clear();

        await fixture.api.refresh();
        await pumpEventQueue();

        _expectAuthTokens(fixture.socket, []);
        _expectReady(fixture.api);
        expect(fixture.socket.connected, isTrue);
      });
    });

    group('token rotation', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('re-authenticates on live transport when token rotates', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T1']);

        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();

        _expectAuthTokens(fixture.socket, ['T1', 'T2']);
        expect(fixture.api.status, SocketStatus.authenticating);

        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
        });
        await pumpEventQueue();
        _expectReady(fixture.api);
      });

      test('rotation clears latch and re-drives disconnected socket', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('auth_failed');
        _expectAuthFailed(fixture.api);
        expect(fixture.socket.connected, isFalse);
        fixture.socket.emitted.clear();

        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();
        expect(fixture.api.status, SocketStatus.connecting);
        expect(fixture.socket.connectCalls, 2);

        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T2']);

        fixture.socket.emitted.clear();
        fixture.socket.serverDrops('io server disconnect');
        await pumpEventQueue();
        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T2']);
      });

      test('refresh with a null token fails auth', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.tokens.value = null;

        await fixture.api.refresh();
        await pumpEventQueue();

        _expectAuthFailed(fixture.api);
        expect(fixture.socket.connected, isFalse);
      });
    });

    group('latch behavior', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('does not re-send rejected token until rotation', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('auth_failed');
        fixture.socket.emitted.clear();
        _expectAuthFailed(fixture.api);
        expect(fixture.authFailures.length, 1);

        fixture.tokens.value = 'T1';
        await fixture.api.refresh();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, []);
        expect(fixture.authFailures.length, 1);
        expect(fixture.socket.connected, isFalse);

        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T2']);
      });

      test('force refresh re-sends a latched token', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('auth_failed');
        fixture.socket.emitted.clear();
        _expectAuthFailed(fixture.api);
        expect(fixture.socket.connected, isFalse);

        await fixture.api.refresh(force: true);
        await pumpEventQueue();
        expect(fixture.api.status, SocketStatus.connecting);
        expect(fixture.socket.connectCalls, 2);

        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T1']);
      });

      test('late rejection does not latch rotated token after init', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();

        fixture.tokens.value = 'T2';
        await fixture.api.refresh();
        await pumpEventQueue();
        fixture.socket.serverEmits('auth_failed');
        _expectAuthFailed(fixture.api);

        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
        });
        await pumpEventQueue();
        _expectReady(fixture.api);

        fixture.socket.emitted.clear();
        await fixture.api.refresh();
        await pumpEventQueue();
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        _expectAuthTokens(fixture.socket, ['T2']);
      });

      test('reports auth failure to callback', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('auth_failed');
        expect(fixture.authFailures.length, 1);
      });

      test('reports auth failure with reason and status', () async {
        final reasons = <String>[];
        final auth = _createFixture(onAuthFailure: reasons.add);
        addTearDown(auth.dispose);

        auth.socket.serverAccepts();
        await pumpEventQueue();
        auth.socket.serverEmits('auth_failed');

        _expectAuthFailed(auth.api);
        expect(reasons, ['server rejected token']);
      });
    });

    group('streams & disposal', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('dispose is idempotent and closes streams', () async {
        var statusCompleted = false;
        fixture.api.statusStream.listen(
          (_) {},
          onDone: () => statusCompleted = true,
        );

        fixture.api
          ..dispose()
          ..dispose();

        expect(fixture.socket.disposed, isTrue);
        await pumpEventQueue();
        expect(statusCompleted, isTrue);
      });

      test('dispose on a live connection does not throw', () async {
        final socket = _DisconnectOnDisposeSocket();
        final api = SocketApi(
          socket: socket,
          baseUrl: 'http://localhost',
          getToken: () async => 'T1',
        );

        socket.serverAccepts();
        await pumpEventQueue();

        var statusCompleted = false;
        api.statusStream.listen((_) {}, onDone: () => statusCompleted = true);

        expect(api.dispose, returnsNormally);
        expect(socket.disposed, isTrue);
        await pumpEventQueue();
        expect(statusCompleted, isTrue);
      });

      test('statusStream replays current status to late listeners', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
        });

        final replayed = <SocketStatus>[];
        final sub = fixture.api.statusStream.listen(replayed.add);
        await pumpEventQueue();

        expect(replayed.first, SocketStatus.ready);
        await sub.cancel();
      });

      test('payloadStream replays latest payload to late listeners', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
        });

        final received = <InitEvent?>[];
        final sub = fixture.api.payloadStream.listen(received.add);
        await pumpEventQueue();

        expect(received.first?.username, 'root');
        await sub.cancel();
      });
    });

    group('init payload', () {
      late _SocketApiFixture fixture;

      setUp(() {
        fixture = _createFixture();
        addTearDown(fixture.dispose);
      });

      test('marks ready and captures init payload', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();

        fixture.socket.serverEmits('init', {
          'userId': 'u1',
          'username': 'root',
          'usersOnline': [
            {
              'id': 'u1',
              'username': 'root',
              'type': 'root',
              'createdAt': 1730000000000,
            },
            {
              'id': 'u2',
              'username': 'reader',
              'type': 'user',
              'createdAt': 1730000000000,
            },
          ],
        });

        _expectReady(fixture.api);
        expect(fixture.api.payload?.userId, 'u1');
        expect(fixture.api.payload?.username, 'root');
        expect(
          fixture.api.payload?.usersOnline.map((u) => u.username).toList(),
          ['root', 'reader'],
        );
        expect(fixture.api.payload?.usersOnline.first.type, UserType.root);
      });

      test('malformed init payload still marks ready', () async {
        fixture.socket.serverAccepts();
        await pumpEventQueue();
        fixture.socket.serverEmits('init', 'not-a-map');

        expect(fixture.api.isReady, isTrue);
        expect(fixture.api.payload, isNull);
        expect(fixture.socket.connected, isTrue);
      });
    });
  });
}
