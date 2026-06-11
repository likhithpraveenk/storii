import 'package:abs_api/abs_api.dart';
import 'package:storii/app/init.dart';

class AppError implements Exception {
  final String message;
  final String localizedMessage;
  final Object? originalError;
  final StackTrace stackTrace;
  final int? statusCode;
  final ApiExceptionType? type;

  const AppError(
    this.message, {
    required this.localizedMessage,
    this.originalError,
    required this.stackTrace,
    this.statusCode,
    this.type,
  });

  factory AppError.from(Object error, StackTrace stackTrace) {
    if (error is AppError) return error;

    if (error is ApiException) {
      return AppError(
        error.message,
        localizedMessage: error.type.localizedMessage,
        originalError: error.originalError,
        stackTrace: error.stackTrace ?? stackTrace,
        statusCode: error.statusCode,
        type: error.type,
      );
    }

    return AppError(
      error.toString(),
      localizedMessage: l10n.errorUnknown,
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  @override
  String toString() => localizedMessage;
}

extension AppErrorTypeX on ApiExceptionType {
  String get localizedMessage => switch (this) {
    .network => l10n.errorNetwork,
    .timeout => l10n.errorTimeout,
    .unauthorized => l10n.errorAuth,
    .forbidden => l10n.errorForbidden,
    .notFound => l10n.errorNotFound,
    .server => l10n.errorServer,
    .unknown => l10n.errorUnknown,
    .typeError => l10n.errorType,
    .badRequest => l10n.errorServer,
    .conflict => l10n.errorServer,
    .validation => l10n.errorServer,
    .rateLimit => l10n.errorServer,
  };
}
