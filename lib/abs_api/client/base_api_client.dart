import 'package:dio/dio.dart';

class BaseApiClient {
  final Dio _dio;
  final List<Interceptor>? interceptors;

  BaseApiClient({required Uri baseUrl, this.interceptors})
    : _dio = Dio(BaseOptions(baseUrl: baseUrl.toString())) {
    _dio.interceptors.addAll([...?interceptors]);
  }

  Dio get dio => _dio;

  void dispose() => _dio.close();
}
