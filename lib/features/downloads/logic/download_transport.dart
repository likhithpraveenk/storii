import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_transport.g.dart';

class DownloadCancelToken {
  bool _cancelled = false;
  final List<void Function()> _listeners = <void Function()>[];

  bool get isCancelled => _cancelled;

  void cancel() {
    if (_cancelled) return;
    _cancelled = true;
    for (final listener in List<void Function()>.of(_listeners)) {
      listener();
    }
  }

  void onCancel(void Function() listener) {
    if (_cancelled) {
      listener();
      return;
    }
    _listeners.add(listener);
  }
}

class TransportResponse {
  const new({required this.stream, required this.isPartial});

  final Stream<List<int>> stream;

  final bool isPartial;
}

abstract class DownloadTransport {
  Future<TransportResponse> fetch({
    required Uri url,
    required String? accessToken,
    required int? rangeStart,
    required DownloadCancelToken cancelToken,
  });
}

@Riverpod(keepAlive: true)
DownloadTransport downloadTransport(Ref ref) {
  return DioDownloadTransport(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 10),
      ),
    ),
  );
}

class DioDownloadTransport implements DownloadTransport {
  new(this._dio);

  final Dio _dio;

  @override
  Future<TransportResponse> fetch({
    required Uri url,
    required String? accessToken,
    required int? rangeStart,
    required DownloadCancelToken cancelToken,
  }) async {
    final dioToken = CancelToken();
    cancelToken.onCancel(() => dioToken.cancel('cancelled'));

    try {
      final response = await _dio.get<ResponseBody>(
        url.toString(),
        options: Options(
          headers: {
            if (accessToken != null) 'Authorization': 'Bearer $accessToken',
            if (rangeStart != null && rangeStart > 0)
              'Range': 'bytes=$rangeStart-',
          },
          responseType: .stream,
        ),
        cancelToken: dioToken,
      );

      final body = response.data;
      if (body == null) {
        throw StateError('No response body for $url');
      }

      return TransportResponse(
        stream: body.stream,
        isPartial: response.statusCode == 206,
      );
    } on DioException catch (e, st) {
      if (CancelToken.isCancel(e)) {
        cancelToken.cancel();
      }
      Error.throwWithStackTrace(e, st);
    }
  }
}
