import 'package:flutter/foundation.dart';
import 'package:storii/api/endpoints/api_exception.dart';

class AppError implements Exception {
  final String message;
  const AppError(this.message);

  factory AppError.resolve(Object error, [StackTrace? stack]) {
    if (error is AppError) return error;

    if (error is ApiException) {
      return AppError(error.message);
    }

    if (error is TypeError) {
      if (kDebugMode) {
        debugPrint('DEVELOPER ALERT: $error\n$stack');
      }
      return AppError(
        'Data processing error: ${error.toString().split('\n').first}',
      );
    }

    return const AppError('An unexpected error occurred');
  }

  @override
  String toString() {
    return message;
  }
}
