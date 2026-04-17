import 'package:storii/abs_api/abs_api.dart';

enum AppErrorType { network, timeout, auth, notFound, server, unknown }

class AppError implements Exception {
  final AppErrorType type;
  final String message;

  const AppError(this.type, this.message);

  factory AppError.resolve(Object error) {
    if (error is AppError) return error;

    if (error is ApiException) {
      return switch (error.type) {
        .network => const AppError(.network, 'No internet connection'),
        .timeout => const AppError(.timeout, 'Request timed out'),
        .unauthorized ||
        .forbidden => const AppError(.auth, 'Please login again'),
        .notFound => const AppError(.notFound, 'Resource not found'),
        .server => const AppError(.server, 'Server error'),
        _ => const AppError(.unknown, 'Something went wrong'),
      };
    }
    return const AppError(.unknown, 'Something went wrong');
  }

  @override
  String toString() {
    return 'AppError (${type.name}): $message';
  }
}
