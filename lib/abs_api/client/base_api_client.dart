import 'package:dio/dio.dart';

class BaseApiClient {
  final Dio _dio;
  final List<Interceptor>? interceptors;

  BaseApiClient({required Uri baseUrl, this.interceptors})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl.toString(),
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 5),
        ),
      ) {
    _dio.interceptors.addAll([...?interceptors]);
  }

  Dio get dio => _dio;

  void dispose() => _dio.close();
}
