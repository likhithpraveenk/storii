import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/app_error.dart';

extension RefExtensions on Ref {
  Future<T> logApiCall<T>(
    Future<T> Function() call, {
    required String source,
    String? logMessage,
  }) async {
    try {
      return await call();
    } catch (e, st) {
      final error = AppError.from(e, st);
      final message = logMessage != null
          ? '$logMessage: ${error.message}'
          : error.message;
      LogService.log(
        message,
        source: source,
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
      throw error;
    }
  }
}
