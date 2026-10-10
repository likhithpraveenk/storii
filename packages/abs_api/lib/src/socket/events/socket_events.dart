import 'dart:async';
import 'dart:developer';

import 'package:abs_api/src/models/json_helpers.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class SocketEvents {
  final io.Socket socket;

  const new(this.socket);

  Stream<dynamic> on(String event) {
    final controller = StreamController<dynamic>.broadcast();
    void onEvent(dynamic data) => controller.add(data);

    controller
      ..onListen = () {
        socket.on(event, onEvent);
      }
      ..onCancel = () {
        socket.off(event, onEvent);
      };

    return controller.stream;
  }

  Stream<T> onJson<T>(String event, T Function(dynamic json) fromJson) {
    return on(event).map((data) {
      log('data: ${getByteSize(data)}Bytes', name: 'SocketEvent: $event');
      return fromJson(data);
    });
  }
}
