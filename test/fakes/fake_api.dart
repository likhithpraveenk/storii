import 'dart:async';

import 'package:abs_api/abs_api.dart';

class FakeSessionsApi extends SessionsApi {
  new() : super(ApiClient(baseUrl: Uri.parse('http://localhost')));

  final List<PlaybackSession> localSyncCalls = [];
  final List<({String sessionId, SyncSessionRequestParams params})>
  sessionSyncCalls = [];

  @override
  Future<void> syncLocal({required PlaybackSession localSession}) async {
    localSyncCalls.add(localSession);
  }

  @override
  Future<void> syncSession({
    required String sessionId,
    required SyncSessionRequestParams params,
  }) async {
    sessionSyncCalls.add((sessionId: sessionId, params: params));
  }
}

class FakeSocketApi extends SocketApi {
  bool _current = false;
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  new() : super('http://localhost', null) {
    _controller.onListen = () {
      if (!_controller.isClosed) _controller.add(_current);
    };
  }

  @override
  Stream<bool> get isConnected => _controller.stream;

  void emitConnected({required bool connected}) {
    _current = connected;
    _controller.add(connected);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
