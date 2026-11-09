import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
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

Uri _activeServerUrl() => Uri.parse('http://localhost');

Future<List<DownloadItem>> _run(
  DownloadEngine engine,
  DownloadItem item, {
  void Function(DownloadItem)? onSnapshot,
}) async {
  final snapshots = <DownloadItem>[];
  await engine.download(
    item: item,
    user: _user,
    onProgress: (snapshot) async {
      snapshots.add(snapshot);
      onSnapshot?.call(snapshot);
    },
  );
  return snapshots;
}

DownloadEngine _buildEngine({
  FakeDownloadTransport? transport,
  Future<String?> Function(String)? accessToken,
  StorageService? Function(DownloadItem)? storageService,
  _FakeCoverDownloader? coverDownloader,
  Uri Function()? activeServerUrl,
}) => DownloadEngine(
  transport: transport ?? FakeDownloadTransport(),
  accessToken: accessToken ?? ((_) async => 'token'),
  storageService:
      storageService ?? ((_) => FakeStorageService(fakeStorageLocation)),
  coverDownloader: coverDownloader?.call ?? _FakeCoverDownloader().call,
  activeServerUrl: activeServerUrl ?? _activeServerUrl,
);

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
      final cover = _FakeCoverDownloader();
      final engine = _buildEngine(transport: transport, coverDownloader: cover);

      final snapshots = await _run(engine, _item());

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
      final engine = _buildEngine(transport: transport);

      await _run(
        engine,
        _item(
          tracks: [
            _track(ino: 'ino-1', index: 1, status: .completed),
            _track(ino: 'ino-2', index: 2),
          ],
        ),
      );

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
      final engine = _buildEngine(transport: transport);

      await _run(engine, _item());

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
      final cover = _FakeCoverDownloader()..error = Exception('cover failed');
      final engine = _buildEngine(transport: transport, coverDownloader: cover);

      final snapshots = await _run(engine, _item());

      expect(snapshots.last.status, DownloadStatus.completed);
    });

    test('fails when the access token is missing', () async {
      final engine = _buildEngine(accessToken: (_) async => null);

      final snapshots = await _run(engine, _item());

      expect(snapshots.single.status, DownloadStatus.failed);
    });

    test('fails when no storage service resolves', () async {
      final engine = _buildEngine(storageService: (_) => null);

      final snapshots = await _run(engine, _item());

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
      final engine = _buildEngine(transport: transport);
      final item = _item();

      final snapshots = await _run(
        engine,
        item,
        onSnapshot: (snapshot) {
          if (snapshot.tracks.first.status == .completed) {
            engine.cancel(item.key);
          }
        },
      );

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
      final engine = _buildEngine(transport: transport);
      final item = _item();

      final snapshots = await _run(
        engine,
        item,
        onSnapshot: (snapshot) {
          if (snapshot.tracks.every((t) => t.status == .completed)) {
            engine.cancel(item.key);
          }
        },
      );

      expect(snapshots.last.status, DownloadStatus.paused);
    });
  });
}
