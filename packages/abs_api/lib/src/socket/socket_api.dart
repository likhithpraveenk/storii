import 'dart:async';

import 'package:abs_api/src/socket/events/collection_events.dart';
import 'package:abs_api/src/socket/events/playlist_events.dart';
import 'package:abs_api/src/socket/events/task_events.dart';
import 'package:abs_api/src/socket/events/user_events.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketApi {
  final Socket socket;
  late final UserSocketEvents user;
  late final TaskEvents taskEvents;
  late final CollectionEvents collectionEvents;
  late final PlaylistEvents playlistEvents;

  bool _initialized = false;
  late final Stream<bool> isConnected;

  new(String baseUrl, String? token)
    : socket = io(
        baseUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      ) {
    user = UserSocketEvents(socket);
    taskEvents = TaskEvents(socket);
    collectionEvents = CollectionEvents(socket);
    playlistEvents = PlaylistEvents(socket);

    final controller = StreamController<bool>.broadcast();
    isConnected = controller.stream;
    socket.onConnect((_) => controller.add(true));
    socket.onDisconnect((_) => controller.add(false));
    controller.onListen = () => controller.add(socket.connected);

    _init(token);
  }

  void _init(String? token) {
    if (_initialized) return;
    socket.onConnect((_) => socket.emit('auth', token));
    socket.connect();
    _initialized = true;
  }

  void dispose() => socket.dispose();
}
