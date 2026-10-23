import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:storii/api/abs/models/init_event.dart';
import 'package:storii/api/abs/socket/events/collection_events.dart';
import 'package:storii/api/abs/socket/events/item_events.dart';
import 'package:storii/api/abs/socket/events/playlist_events.dart';
import 'package:storii/api/abs/socket/events/task_events.dart';
import 'package:storii/api/abs/socket/events/user_events.dart';

enum SocketStatus {
  disconnected,
  connecting,
  authenticating,
  ready,
  authFailed,
}

io.Socket _buildSocket(String baseUrl, Map<String, String>? headers) {
  final options = io.OptionBuilder().setTransports([
    'websocket',
  ]).disableAutoConnect();
  if (headers != null) options.setExtraHeaders(headers);
  return io.io(baseUrl, options.build());
}

class SocketApi {
  final io.Socket _socket;

  final Future<String?> Function() getToken;
  final void Function(String reason)? onAuthFailure;

  late final UserSocketEvents user;
  late final TaskEvents taskEvents;
  late final CollectionEvents collectionEvents;
  late final PlaylistEvents playlistEvents;
  late final ItemEvents itemEvents;

  final _statusController = BehaviorSubject<SocketStatus>.seeded(.disconnected);
  final _initController = BehaviorSubject<InitEvent?>();

  // Invalidates a token read that resolves after a reconnect
  int _attempt = 0;
  String? _sentToken;
  String? _failedToken;
  bool _isDisposed = false;

  new({
    required String baseUrl,
    Map<String, String>? headers,
    required this.getToken,
    this.onAuthFailure,
    io.Socket? socket,
  }) : _socket = socket ?? _buildSocket(baseUrl, headers) {
    user = UserSocketEvents(_socket);
    taskEvents = TaskEvents(_socket);
    collectionEvents = CollectionEvents(_socket);
    playlistEvents = PlaylistEvents(_socket);
    itemEvents = ItemEvents(_socket);

    _socket.onConnect((_) => _handleConnect());
    _socket.onDisconnect((_) => _handleDisconnect());
    _socket.onConnectError((err) {
      _log('connect error: $err');
      _handleDisconnect();
    });

    _socket.on('auth_failed', (message) {
      if (_isDisposed) return;
      _setAuthFail(message?.toString() ?? 'server rejected token');
    });

    _socket.on('init', _handleInit);

    _setStatus(.connecting);
    _socket.connect();
  }

  bool get isReady => status == .ready;
  InitEvent? get payload => _initController.valueOrNull;

  Stream<SocketStatus> get statusStream => _statusController.stream;

  SocketStatus get status => _statusController.value;

  Stream<InitEvent?> get payloadStream => _initController.stream;

  /// Re-authenticates on a live transport, or reconnects when the transport is
  /// down (token rotation while offline must not stay queued in the send
  /// buffer). [force] clears the rejected-token latch so an explicit retry can
  /// re-send the current token.
  Future<void> refresh({bool force = false}) async {
    if (_isDisposed) return;
    if (force) _failedToken = null;
    if (!_socket.connected) {
      _setStatus(.connecting);
      _socket.connect();
      return;
    }
    await _handleConnect();
  }

  void _setStatus(SocketStatus next) {
    if (_isDisposed || status == next) return;
    _statusController.add(next);
  }

  Future<void> _handleConnect() async {
    if (_isDisposed) return;
    final attempt = ++_attempt;

    String? token;
    try {
      token = await getToken();
    } catch (e, st) {
      _log('token read failed: $e\n$st');
      if (_isDisposed || attempt != _attempt) return;
      return _setAuthFail('token read failed');
    }
    if (_isDisposed || attempt != _attempt) return;

    if (token == null) return _setAuthFail('no token found');
    if (token == _sentToken) return;
    if (token == _failedToken) {
      return _setAuthFail('token previously rejected', notify: false);
    }

    if (!_socket.connected) return;
    _setStatus(.authenticating);
    _sendAuth(token);
  }

  void _handleDisconnect() {
    if (_isDisposed) return;
    _attempt++;
    _sentToken = null;
    if (status == .authFailed) return;
    _setStatus(.disconnected);
  }

  void _handleInit(dynamic data) {
    if (_isDisposed) return;

    InitEvent? payload;
    try {
      payload = InitEvent.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      _log('init payload parse failed: $e');
    }
    _failedToken = null;
    _initController.add(payload);
    _setStatus(.ready);
  }

  void _sendAuth(String token) {
    _sentToken = token;
    _socket.emit('auth', token);
  }

  void _setAuthFail(String reason, {bool notify = true}) {
    if (_isDisposed) return;
    _failedToken = _sentToken ?? _failedToken;
    _setStatus(.authFailed);
    _log(reason);
    _socket.disconnect();
    if (!notify) return;

    onAuthFailure?.call(reason);
  }

  void _log(String msg) => debugPrint('[SocketApi] $msg');

  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _socket.dispose();
    _statusController.close();
    _initController.close();
  }
}
