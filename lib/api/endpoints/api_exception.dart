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
      return 'The connection timed out';
    case DioExceptionType.connectionError:
      return 'Cannot reach the server. Please check your connection';
    case DioExceptionType.badCertificate:
      return 'Secure connection failed (SSl Certificate Error)';
    case DioExceptionType.badResponse:
      final code = e.response?.statusCode;
      if (code == 401) return 'Your session has expired. Please login again';
      if (code == 403) return 'You do not have permission to access this';
      if (code == 404) return 'Resource not found';
      if (code != null && code >= 500) {
        return 'Server is having trouble (Error $code).';
      }
      return 'Request failed with status: $code';
    case DioExceptionType.cancel:
      return 'Request was cancelled';
    case DioExceptionType.unknown:
      if (e.error is SocketException) return 'No internet connection detected';
      return 'An unknown network error occurred';
  }
}
