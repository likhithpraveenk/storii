import 'dart:io';

import 'package:dio/dio.dart';

enum ApiExceptionType {
  network,
  timeout,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  validation,
  rateLimit,
  server,
  badRequest,
  typeError,
  unknown,
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;
  final ApiExceptionType type;
  final StackTrace? stackTrace;

  const ApiException(
    this.message, {
    this.statusCode,
    this.originalError,
    this.type = .unknown,
    this.stackTrace,
  });

  @override
  String toString() =>
      'ApiException: $message (${type.name} status: $statusCode)'
      '\nError: $originalError';
}

ApiException mapException(Object error, StackTrace stack) {
  if (error is DioException) {
    return _apiExceptionFromDio(error, stack);
  }
  if (error is TypeError) {
    return ApiException(
      'JSON serialization failed',
      type: .typeError,
      stackTrace: stack,
      originalError: error,
    );
  }
  return ApiException('Unknown error', stackTrace: stack, originalError: error);
}

ApiException _apiExceptionFromDio(DioException e, StackTrace stack) {
  final code = e.response?.statusCode ?? 0;
  final msg = e.message ?? 'Request failed';

  final ApiExceptionType type = switch (e.type) {
    .connectionError => .network,
    .connectionTimeout || .sendTimeout || .receiveTimeout => .timeout,
    .badResponse => switch (code) {
      400 => .badRequest,
      401 => .unauthorized,
      403 => .forbidden,
      404 => .notFound,
      409 => .conflict,
      422 => .validation,
      429 => .rateLimit,
      >= 500 => .server,
      _ => .unknown,
    },
    .unknown when e.error is SocketException => .network,
    _ => .unknown,
  };

  return ApiException(
    msg,
    type: type,
    statusCode: code,
    stackTrace: stack,
    originalError: e,
  );
}
