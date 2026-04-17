import 'package:dio/dio.dart';
import 'package:storii/abs_api/client/base_api_client.dart';
import 'package:storii/abs_api/endpoints/api_exception.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/json_helpers.dart';
import 'package:storii/abs_api/models/login_response.dart';
import 'package:storii/abs_api/models/server_status_response.dart';

class AuthApi {
  final BaseApiClient api;
  const AuthApi(this.api);

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await api.dio.post(
        ApiRoutes.login,
        data: {'username': username, 'password': password},
        options: Options(headers: {'x-return-tokens': true}),
      );

      return fromJson(response.data, LoginResponse.fromJson);
    } on DioException catch (e, st) {
      throw apiExceptionFromDio(e, st);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> healthCheck() async {
    try {
      await api.dio.get(ApiRoutes.healthCheck);
    } on DioException catch (e, st) {
      throw apiExceptionFromDio(e, st);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> ping() async {
    try {
      final response = await api.dio.get(ApiRoutes.ping);
      return fromJsonKey<bool>(response.data, 'success');
    } on DioException catch (e, st) {
      throw apiExceptionFromDio(e, st);
    } catch (e) {
      rethrow;
    }
  }

  Future<ServerStatusResponse> status() async {
    try {
      final response = await api.dio.get(ApiRoutes.status);
      return fromJson(response.data, ServerStatusResponse.fromJson);
    } on DioException catch (e, st) {
      throw apiExceptionFromDio(e, st);
    } catch (e) {
      rethrow;
    }
  }

  Future<(Uri?, String?)> oauthRequest({
    required String codeChallenge,
    String codeChallengeMethod = 'S256',
    String responseType = 'code',
    required String redirectUri,
    required String clientId,
    String? state,
  }) async {
    final response = await api.dio.get(
      ApiRoutes.oauth,
      queryParameters: {
        'code_challenge': codeChallenge,
        'code_challenge_method': codeChallengeMethod,
        'response_type': responseType,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'state': ?state,
      },
      options: Options(
        followRedirects: false,
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (status) =>
            status != null && status >= 200 && status < 400,
      ),
    );
    if (response.statusCode == 302) {
      final location = response.headers.value('location');
      final rawCookies = response.headers.map['set-cookie'] ?? [];
      final cookie = rawCookies.map((c) => c.split(';').first).join('; ');
      if (location != null) {
        final authUri = Uri.parse(location);
        return (authUri, cookie);
      }
    }
    return (null, null);
  }

  Future<LoginResponse> oauthCallback({
    required String code,
    required String state,
    required String codeVerifier,
    String? cookie,
  }) async {
    try {
      final response = await api.dio.get(
        ApiRoutes.oauthCallback,
        queryParameters: {
          'code': code,
          'state': state,
          'code_verifier': codeVerifier,
        },
        options: Options(
          followRedirects: false,
          headers: {'cookie': ?cookie, 'x-return-tokens': true},
          validateStatus: (s) => s != null && s < 400,
        ),
      );

      // log('oauth callback status: ${response.statusCode}');
      // log('oauth callback body: ${response.data}');

      return fromJson(response.data, LoginResponse.fromJson);
    } on DioException catch (e, st) {
      throw apiExceptionFromDio(e, st);
    }
  }
}
