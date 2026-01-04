import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApiClient {
  final Dio _dio;

  BaseApiClient({required Uri baseUrl})
    : _dio = Dio(BaseOptions(baseUrl: baseUrl.toString())) {
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
  }

  Dio get dio => _dio;

  void dispose() => _dio.close();
}
