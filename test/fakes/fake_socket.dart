import 'package:socket_io_client/socket_io_client.dart';

class FakeSocket implements Socket {
  new();

  final Map<String, List<dynamic>> _handlers = {};
  final List<({String event, Object? data})> emitted = [];

  @override
  bool connected = false;

  bool disposed = false;
  int connectCalls = 0;

  bool _attemptInFlight = false;

  @override
  Function() on(String event, dynamic Function(dynamic) handler) {
    (_handlers[event] ??= []).add(handler);
    return () => _handlers[event]?.remove(handler);
  }

  @override
  void off(String event, [dynamic Function(dynamic)? handler]) {
    if (handler == null) {
      _handlers.remove(event);
    } else {
      _handlers[event]?.remove(handler);
    }
  }

  @override
  void emit(String event, [dynamic data]) =>
      emitted.add((event: event, data: data));

  @override
  Socket connect() {
    connectCalls++;
    connected = false;
    _attemptInFlight = true;
    return this;
  }

  @override
  Socket disconnect() {
    _attemptInFlight = false;
    if (connected) {
      connected = false;
      _fire('disconnect', 'io client disconnect');
    }
    return this;
  }

  @override
  void dispose() => disposed = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;

  // server-side events

  /// accepts the connection attempt the client has in flight
  void serverAccepts() {
    assert(
      _attemptInFlight,
      'the server cannot accept a connection the client never opened',
    );
    _attemptInFlight = false;
    connected = true;
    _fire('connect');
  }

  /// refuses the in-flight handshake; the manager schedules the next retry
  void serverRejects([String reason = 'websocket error']) {
    assert(
      _attemptInFlight,
      'the server cannot reject a handshake the client never opened',
    );
    _attemptInFlight = false;
    _fire('connect_error', reason);
    _attemptInFlight = true;
  }

  /// drops the established connection
  void serverDrops([String reason = 'transport close']) {
    assert(connected, 'the server cannot drop a connection that is not up');
    connected = false;
    _fire('disconnect', reason);
    if (reason != 'io server disconnect') _attemptInFlight = true;
  }

  /// delivers a server packet, including stale in-flight ones after a drop
  void serverEmits(String event, [Object? data]) => _fire(event, data);

  void _fire(String event, [Object? data]) {
    for (final handler in List.of(_handlers[event] ?? const [])) {
      handler(data);
    }
  }
}
