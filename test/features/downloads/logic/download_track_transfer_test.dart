import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/features/downloads/logic/download_track_transfer.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_download_transport.dart';
import '../../../fakes/fake_storage_service.dart';
import '../../../helpers/init_globals.dart';

const _url = 'http://localhost/api/items/item-1/file/ino-1/download';

DownloadTrack _track({String ino = 'ino-1'}) => DownloadTrack(
  audioTrack: const AudioTrack(
    index: 1,
    startOffset: Duration.zero,
    duration: Duration.zero,
    title: 'Track 1',
    contentUrl: 'http://server/track1',
  ),
  ino: ino,
  bytesTotal: 100,
  trackPath: 'audio1.mp3',
);

TrackTransfer _transfer(FakeDownloadTransport transport) =>
    TrackTransfer(transport: transport, delay: (_) async {});

Future<List<TrackTransferEvent>> _run(
  TrackTransfer transfer, {
  required FakeStorageService service,
  required DownloadCancelToken cancelToken,
  bool Function()? isCancelled,
}) {
  return transfer
      .transfer(
        track: _track(),
        url: Uri.parse(_url),
        accessToken: 'token',
        service: service,
        relativePath: 'book',
        cancelToken: cancelToken,
        isCancelled: isCancelled ?? () => false,
      )
      .toList();
}

void main() {
  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  group('TrackTransfer', () {
    test('writes the full body and completes', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1, 2],
              [3, 4],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);

      final events = await _run(
        _transfer(transport),
        service: service,
        cancelToken: DownloadCancelToken(),
      );

      expect(events.last, isA<TrackOutcome>());
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.completed);
      expect(outcome.bytesReceived, 4);
      expect(service.sinks.single.bytes, [1, 2, 3, 4]);
      expect(service.sinks.single.closed, isTrue);
    });

    test('resumes from existing bytes with a range request', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1, 2],
            ],
            isPartial: true,
          ),
        ],
      );
      final service = FakeStorageService(
        fakeStorageLocation,
        existingBytes: 100,
      );

      final events = await _run(
        _transfer(transport),
        service: service,
        cancelToken: DownloadCancelToken(),
      );

      expect(transport.calls.single.rangeStart, 100);
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.completed);
      expect(outcome.bytesReceived, 102);
    });

    test('restarts the track when the server ignores the range', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1, 2],
            ],
          ),
          const FakeTransportResponse(
            chunks: [
              [3, 4],
            ],
          ),
        ],
      );
      final service = FakeStorageService(
        fakeStorageLocation,
        existingBytes: 100,
      );

      final events = await _run(
        _transfer(transport),
        service: service,
        cancelToken: DownloadCancelToken(),
      );

      expect(service.deletedTracks, ['audio1.mp3']);
      expect(transport.calls.first.rangeStart, 100);
      expect(transport.calls.last.rangeStart, isNull);
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.completed);
      expect(outcome.bytesReceived, 2);
    });

    test('retries after a failure and succeeds', () async {
      final transport = FakeDownloadTransport(
        responses: [
          FakeTransportResponse(error: Exception('boom')),
          const FakeTransportResponse(
            chunks: [
              [1, 2, 3],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);

      final events = await _run(
        _transfer(transport),
        service: service,
        cancelToken: DownloadCancelToken(),
      );

      expect(transport.calls.length, 2);
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.completed);
      expect(outcome.bytesReceived, 3);
    });

    test('fails once the retry budget is exhausted', () async {
      final transport = FakeDownloadTransport(
        responses: [FakeTransportResponse(error: Exception('boom'))],
      );
      final service = FakeStorageService(fakeStorageLocation);

      final events = await _run(
        _transfer(transport),
        service: service,
        cancelToken: DownloadCancelToken(),
      );

      expect(transport.calls.length, 4);
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.failed);
      expect(outcome.error, isNotNull);
      expect(service.sinks.every((s) => s.closed), isTrue);
    });

    test(
      'pauses when the download is cancelled before the first attempt',
      () async {
        final transport = FakeDownloadTransport();
        final service = FakeStorageService(fakeStorageLocation);
        final cancelToken = DownloadCancelToken()..cancel();

        final events = await _run(
          _transfer(transport),
          service: service,
          cancelToken: cancelToken,
        );

        final outcome = events.last as TrackOutcome;
        expect(outcome.status, DownloadStatus.paused);
        expect(transport.calls, isEmpty);
      },
    );

    test('pauses when cancelled mid-stream and closes the sink', () async {
      final controller = StreamController<List<int>>();
      final transport = FakeDownloadTransport(manualController: controller);
      final service = FakeStorageService(fakeStorageLocation);
      final cancelToken = DownloadCancelToken();
      final transfer = _transfer(transport);

      final future = transfer
          .transfer(
            track: _track(),
            url: Uri.parse(_url),
            accessToken: 'token',
            service: service,
            relativePath: 'book',
            cancelToken: cancelToken,
            isCancelled: () => cancelToken.isCancelled,
          )
          .toList();

      controller.add([1, 2, 3]);
      await Future<void>.delayed(Duration.zero);
      cancelToken.cancel();
      controller.add([4, 5]);
      await controller.close();

      final events = await future;
      final outcome = events.last as TrackOutcome;
      expect(outcome.status, DownloadStatus.paused);
      expect(service.sinks.single.closed, isTrue);
    });
  });
}
