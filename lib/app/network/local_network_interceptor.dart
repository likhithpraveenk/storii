import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:storii/shared/helpers/local_network.dart';

/// Fallback for Android 17+ local network protection: when a request fails
/// to connect, check whether the host is on the LAN and ask for access.
class LocalNetworkInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final isConnectFailure =
        err.type == .connectionError ||
        err.type == .connectionTimeout ||
        err.error is SocketException;
    if (isConnectFailure) {
      unawaited(ensureLocalNetworkAccess(err.requestOptions.uri));
    }
    super.onError(err, handler);
  }
}
