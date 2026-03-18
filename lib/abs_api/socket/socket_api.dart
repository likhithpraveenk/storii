import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:storii/abs_api/socket/events/user_events.dart';

class SocketApi {
  final Socket socket;
  late final UserSocketEvents user;
  bool _initialized = false;

  SocketApi(String baseUrl, String token)
    : socket = io(
        baseUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      ) {
    user = UserSocketEvents(socket);
    _init(token);
  }

  void _init(String token) {
    if (_initialized) return;
    socket.onConnect((_) => socket.emit('auth', token));
    socket.connect();
    _initialized = true;
  }

  Stream<bool> get isConnected {
    final controller = StreamController<bool>.broadcast();
    controller.onListen = () => controller.add(socket.connected);
    socket.onConnect((_) => controller.add(true));
    socket.onDisconnect((_) => controller.add(false));
    return controller.stream;
  }

  void dispose() => socket.dispose();
}
