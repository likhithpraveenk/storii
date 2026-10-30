import 'dart:async';

import 'package:storii/features/downloads/logic/download_transport.dart';

class FakeTransportCall {
  const new({
    required this.url,
    required this.accessToken,
    required this.rangeStart,
  });

  final Uri url;
  final String? accessToken;
  final int? rangeStart;
}

class FakeTransportResponse {
  const new({
    this.chunks = const <List<int>>[],
    this.isPartial = false,
    this.error,
  });

  final List<List<int>> chunks;
  final bool isPartial;
  final Object? error;
}

class FakeDownloadTransport implements DownloadTransport {
  new({this.responses = const [], this.manualController});

  final List<FakeTransportResponse> responses;
  final StreamController<List<int>>? manualController;
  final List<FakeTransportCall> calls = <FakeTransportCall>[];

  @override
  Future<TransportResponse> fetch({
    required Uri url,
    required String? accessToken,
    required int? rangeStart,
    required DownloadCancelToken cancelToken,
  }) async {
    calls.add(
      FakeTransportCall(
        url: url,
        accessToken: accessToken,
        rangeStart: rangeStart,
      ),
    );

    final controller = manualController;
    if (controller != null) {
      return TransportResponse(stream: controller.stream, isPartial: false);
    }

    if (responses.isEmpty) {
      return const TransportResponse(
        stream: Stream<List<int>>.empty(),
        isPartial: false,
      );
    }

    final index = calls.length - 1;
    final scripted =
        responses[index < responses.length ? index : responses.length - 1];

    final error = scripted.error;
    if (error != null) throw error;

    return TransportResponse(
      stream: Stream<List<int>>.fromIterable(scripted.chunks),
      isPartial: scripted.isPartial,
    );
  }
}
