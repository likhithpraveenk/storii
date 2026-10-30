import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_download_transport.dart';
import '../../../fakes/fake_storage_service.dart';
import '../../../helpers/init_globals.dart';

final _user = UserDomain(
  id: 'user-1',
  username: 'user',
  userType: '',
  serverUrl: Uri.parse('http://localhost'),
);

DownloadTrack _track({
  required String ino,
  required int index,
  DownloadStatus status = DownloadStatus.queued,
}) => DownloadTrack(
  audioTrack: AudioTrack(
    index: index,
    startOffset: Duration.zero,
    duration: Duration.zero,
    title: 'Track $index',
    contentUrl: 'http://server/track$index',
  ),
  ino: ino,
  bytesTotal: 100,
  trackPath: 'audio$index.mp3',
  status: status,
);

DownloadItem _item({List<DownloadTrack>? tracks}) => DownloadItem(
  serverUrl: Uri.parse('http://localhost'),
  libraryItemId: 'item-1',
  userId: 'user-1',
  title: 'Book',
  author: 'Author',
  tracks:
      tracks ??
      [_track(ino: 'ino-1', index: 1), _track(ino: 'ino-2', index: 2)],
  folderPath: '/downloads',
  relativePath: 'book',
);

class _FakeCoverDownloader {
  final List<String> calls = <String>[];
  Object? error;

  Future<void> call({
    required String libraryItemId,
    required bool isPodcast,
    required DownloadCancelToken cancelToken,
  }) async {
    calls.add(libraryItemId);
    if (error != null) throw error!;
  }
}

void main() {
  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  group('DownloadEngine', () {
    test('downloads every pending track and completes', () async {
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
      final service = FakeStorageService(fakeStorageLocation);
      final cover = _FakeCoverDownloader();
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: cover.call,
      );

      final snapshots = await engine
          .downloadItem(item: _item(), user: _user)
          .toList();

      expect(snapshots.last.status, DownloadStatus.completed);
      expect(
        snapshots.last.tracks.every((t) => t.status == .completed),
        isTrue,
      );
      expect(cover.calls, ['item-1']);
    });

    test('skips tracks that are already completed', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1, 2],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: _FakeCoverDownloader().call,
      );

      await engine
          .downloadItem(
            item: _item(
              tracks: [
                _track(ino: 'ino-1', index: 1, status: .completed),
                _track(ino: 'ino-2', index: 2),
              ],
            ),
            user: _user,
          )
          .toList();

      expect(transport.calls.length, 1);
      expect(transport.calls.single.url.toString(), contains('ino-2'));
    });

    test('keeps the track order', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1],
            ],
          ),
          const FakeTransportResponse(
            chunks: [
              [2],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: _FakeCoverDownloader().call,
      );

      await engine.downloadItem(item: _item(), user: _user).toList();

      expect(transport.calls.first.url.toString(), contains('ino-1'));
      expect(transport.calls.last.url.toString(), contains('ino-2'));
    });

    test('a failing cover does not block the audio download', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1],
            ],
          ),
          const FakeTransportResponse(
            chunks: [
              [2],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);
      final cover = _FakeCoverDownloader()..error = Exception('cover failed');
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: cover.call,
      );

      final snapshots = await engine
          .downloadItem(item: _item(), user: _user)
          .toList();

      expect(snapshots.last.status, DownloadStatus.completed);
    });

    test('fails when the access token is missing', () async {
      final engine = DownloadEngine(
        transport: FakeDownloadTransport(),
        accessToken: (_) async => null,
        storageService: (_) => FakeStorageService(fakeStorageLocation),
        coverDownloader: _FakeCoverDownloader().call,
      );

      final snapshots = await engine
          .downloadItem(item: _item(), user: _user)
          .toList();

      expect(snapshots.single.status, DownloadStatus.failed);
    });

    test('fails when no storage service resolves', () async {
      final engine = DownloadEngine(
        transport: FakeDownloadTransport(),
        accessToken: (_) async => 'token',
        storageService: (_) => null,
        coverDownloader: _FakeCoverDownloader().call,
      );

      final snapshots = await engine
          .downloadItem(item: _item(), user: _user)
          .toList();

      expect(snapshots.last.status, DownloadStatus.failed);
    });

    test('cancelling between tracks pauses the download', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1],
            ],
          ),
          const FakeTransportResponse(
            chunks: [
              [2],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: _FakeCoverDownloader().call,
      );
      final item = _item();

      final snapshots = <DownloadItem>[];
      await for (final snapshot in engine.downloadItem(
        item: item,
        user: _user,
      )) {
        snapshots.add(snapshot);
        if (snapshot.tracks.first.status == .completed) {
          engine.cancel(item.key);
        }
      }

      expect(snapshots.last.status, DownloadStatus.paused);
      expect(transport.calls.length, 1);
    });

    test('a late cancel wins over the completed snapshot', () async {
      final transport = FakeDownloadTransport(
        responses: [
          const FakeTransportResponse(
            chunks: [
              [1],
            ],
          ),
          const FakeTransportResponse(
            chunks: [
              [2],
            ],
          ),
        ],
      );
      final service = FakeStorageService(fakeStorageLocation);
      final engine = DownloadEngine(
        transport: transport,
        accessToken: (_) async => 'token',
        storageService: (_) => service,
        coverDownloader: _FakeCoverDownloader().call,
      );
      final item = _item();

      final snapshots = <DownloadItem>[];
      await for (final snapshot in engine.downloadItem(
        item: item,
        user: _user,
      )) {
        snapshots.add(snapshot);
        if (snapshot.tracks.every((t) => t.status == .completed)) {
          engine.cancel(item.key);
        }
      }

      expect(snapshots.last.status, DownloadStatus.paused);
    });
  });
}
