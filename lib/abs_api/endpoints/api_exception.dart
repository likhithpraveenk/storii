import 'dart:io';

import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;
  final StackTrace? stackTrace;

  const ApiException(
    this.message, {
    this.statusCode,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() =>
      'ApiException: $message\nStatus: $statusCode\nError: $originalError';
}

String mapDioToMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Request timeout';
    case DioExceptionType.connectionError:
      return 'Connection error';
    case DioExceptionType.badCertificate:
      return 'SSL certificate error';
    case DioExceptionType.badResponse:
      final code = e.response?.statusCode;
      if (code == 400) return 'HTTP 400 Bad Request';
      if (code == 401) return 'HTTP 401 Unauthorized';
      if (code == 403) return 'HTTP 403 Forbidden';
      if (code == 404) return 'HTTP 404 Not Found';
      if (code != null && code >= 500) {
        return 'HTTP $code Internal Server Error';
      }
      return code != null ? 'HTTP $code' : 'HTTP error';
    case DioExceptionType.cancel:
      return 'Request cancelled';
    case DioExceptionType.unknown:
      if (e.error is SocketException) return 'No internet';
      return 'Unknown network error';
  }
}
