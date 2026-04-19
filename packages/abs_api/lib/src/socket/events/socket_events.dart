import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class SocketEvents {
  final io.Socket socket;

  const SocketEvents(this.socket);

  Stream<dynamic> on(String event) {
    final controller = StreamController<dynamic>.broadcast();
    void onEvent(dynamic data) => controller.add(data);

    controller.onListen = () => socket.on(event, onEvent);
    controller.onCancel = () => socket.off(event, onEvent);

    return controller.stream;
  }

  Stream<T> onJson<T>(String event, T Function(dynamic json) fromJson) {
    return on(event).map((data) {
      // log('$data', name: event);
      return fromJson(data);
    });
  }
}
