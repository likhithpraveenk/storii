import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/shared/helpers/api_call_logger.dart' as api_calls;

extension RefExtensions on Ref {
  Future<T> logApiCall<T>(
    Future<T> Function() call, {
    required String source,
    String? logMessage,
    bool debug = false,
  }) => api_calls.logApiCall(
    call,
    source: source,
    logMessage: logMessage,
    debug: debug,
  );

  void invalidateOnReconnect() {
    listen(socketStatusProvider, (prev, next) {
      final status = next.value;
      if (prev?.value == .disconnected &&
          status != null &&
          status != .disconnected) {
        invalidateSelf();
      }
    });
  }
}
