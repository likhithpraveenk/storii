import 'dart:async';

import 'package:abs_api/src/socket/events/collection_events.dart';
import 'package:abs_api/src/socket/events/playlist_events.dart';
import 'package:abs_api/src/socket/events/task_events.dart';
import 'package:abs_api/src/socket/events/user_events.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketApi {
  final Socket socket;

  late final StreamSubscription<String?> _tokenSub;
  late final StreamController<bool> _connController;
  final Function? onAuthFailure;

  late final UserSocketEvents user;
  late final TaskEvents taskEvents;
  late final CollectionEvents collectionEvents;
  late final PlaylistEvents playlistEvents;

  late final Stream<bool> isConnected;

  String? _currentToken;

  new({
    required String baseUrl,
    required String? token,
    required Stream<String?> tokenUpdates,
    this.onAuthFailure,
  }) : socket = io(
         baseUrl,
         OptionBuilder()
             .setTransports(['websocket'])
             .disableAutoConnect()
             .build(),
       ),
       _currentToken = token {
    user = UserSocketEvents(socket);
    taskEvents = TaskEvents(socket);
    collectionEvents = CollectionEvents(socket);
    playlistEvents = PlaylistEvents(socket);

    _connController = StreamController<bool>.broadcast();
    isConnected = _connController.stream;

    socket.onConnect((_) {
      _connController.add(true);
      _authenticate();
    });
    socket.onDisconnect((_) {
      _connController.add(false);
      _currentToken = null;
    });
    socket.onConnectError((_) {
      _connController.add(false);
      _currentToken = null;
    });
    socket.on('auth_failed', (_) {
      _currentToken = null;
      return onAuthFailure?.call();
    });

    _tokenSub = tokenUpdates.listen(_onTokenUpdate);

    socket.connect();
  }

  void _authenticate() {
    final token = _currentToken;

    if (token != null) {
      socket.emit('auth', token);
    }
  }

  void _onTokenUpdate(String? newToken) {
    _currentToken = newToken;

    if (socket.connected && newToken != null) {
      _authenticate();
    }
  }

  void dispose() {
    _tokenSub.cancel();
    _connController.close();
    socket.dispose();
  }
}
