import 'package:abs_api/abs_api.dart';

enum AppErrorType { network, timeout, auth, notFound, server, unknown }

class AppError implements Exception {
  final AppErrorType type;
  final String message;
  final Object originalError;

  const AppError(this.type, this.message, this.originalError);

  factory AppError.resolve(Object error) {
    if (error is AppError) return error;

    if (error is ApiException) {
      return switch (error.type) {
        .network => AppError(
          .network,
          'No internet connection',
          error.originalError,
        ),
        .timeout => AppError(
          .timeout,
          'Request timed out',
          error.originalError,
        ),
        .unauthorized || .forbidden => AppError(
          .auth,
          'Please login again',
          error.originalError,
        ),
        .notFound => AppError(
          .notFound,
          'Resource not found',
          error.originalError,
        ),
        .server => AppError(.server, 'Server error', error.originalError),
        _ => AppError(.unknown, 'Something went wrong', error.originalError),
      };
    }
    return AppError(.unknown, 'Something went wrong', error);
  }

  @override
  String toString() {
    return 'AppError (${type.name}): $message'
        '\noriginal error: $originalError';
  }
}
