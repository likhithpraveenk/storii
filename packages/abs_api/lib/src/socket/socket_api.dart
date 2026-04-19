import 'dart:async';

import 'package:abs_api/src/socket/events/user_events.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketApi {
  final Socket socket;
  late final UserSocketEvents user;
  bool _initialized = false;
  late final Stream<bool> isConnected;

  SocketApi(String baseUrl, String token)
    : socket = io(
        baseUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      ) {
    user = UserSocketEvents(socket);

    final controller = StreamController<bool>.broadcast();
    isConnected = controller.stream;
    socket.onConnect((_) => controller.add(true));
    socket.onDisconnect((_) => controller.add(false));
    controller.onListen = () => controller.add(socket.connected);

    _init(token);
  }

  void _init(String token) {
    if (_initialized) return;
    socket.onConnect((_) => socket.emit('auth', token));
    socket.connect();
    _initialized = true;
  }

  void dispose() => socket.dispose();
}
