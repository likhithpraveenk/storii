import 'dart:async';

import 'package:storii/api/abs/abs_api.dart';

import 'fake_socket.dart';

class FakeSessionsApi extends SessionsApi {
  new() : super(ApiClient(baseUrl: Uri.parse('http://localhost')));

  final List<PlaybackSession> localSyncCalls = [];
  final List<({String sessionId, SyncSessionRequestParams params})>
  sessionSyncCalls = [];

  ApiExceptionType? syncErrorType;

  @override
  Future<void> syncLocal({required PlaybackSession localSession}) async {
    localSyncCalls.add(localSession);
  }

  @override
  Future<void> syncSession({
    required String sessionId,
    required SyncSessionRequestParams params,
  }) async {
    final errorType = syncErrorType;
    if (errorType != null) {
      throw ApiException('sync failed', type: errorType);
    }
    sessionSyncCalls.add((sessionId: sessionId, params: params));
  }
}

class FakeItemApi extends ItemApi {
  new() : super(ApiClient(baseUrl: Uri.parse('http://localhost')));
}

class FakeSocketApi extends SocketApi {
  SocketStatus _status = .connecting;
  final StreamController<SocketStatus> _controller =
      StreamController<SocketStatus>.broadcast();

  new()
    : super(
        baseUrl: 'http://localhost',
        socket: FakeSocket(),
        getToken: () async => null,
      ) {
    _controller.onListen = () {
      if (!_controller.isClosed) _controller.add(_status);
    };
  }

  @override
  Stream<SocketStatus> get statusStream => _controller.stream;

  void emitStatus(SocketStatus status) {
    _status = status;
    if (!_controller.isClosed) _controller.add(status);
  }

  void emitConnected({required bool connected}) =>
      emitStatus(connected ? .ready : .disconnected);

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
