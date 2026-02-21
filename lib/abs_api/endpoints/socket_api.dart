import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:storii/abs_api/models/user_item_progress_updated_event.dart';

class SocketApi {
  final Socket socket;
  bool _initialized = false;

  SocketApi(String baseUrl, String token)
    : socket = io(
        baseUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      ) {
    init(token);
  }

  void init(String token) {
    if (_initialized) return;

    socket.onConnect((_) {
      socket.emit('auth', token);
    });

    socket.connect();
    _initialized = true;
  }

  Stream<UserItemProgressUpdatedEvent> get onProgressUpdate {
    final controller =
        StreamController<UserItemProgressUpdatedEvent>.broadcast();

    void onEvent(dynamic data) {
      try {
        controller.add(UserItemProgressUpdatedEvent.fromJson(data));
      } catch (_) {}
    }

    controller.onListen = () =>
        socket.on('user_item_progress_updated', onEvent);
    controller.onCancel = () =>
        socket.off('user_item_progress_updated', onEvent);

    return controller.stream;
  }

  Stream<bool> get isConnected {
    final controller = StreamController<bool>.broadcast();
    socket.onConnect((_) => controller.add(true));
    socket.onDisconnect((_) => controller.add(false));
    return controller.stream;
  }

  void dispose() {
    socket.dispose();
  }
}
