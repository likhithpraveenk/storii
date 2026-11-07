import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_task.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_download_transport.dart';
import '../../../fakes/fake_notifications.dart';
import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

final _user = UserDomain(
  id: 'user-1',
  username: 'user',
  userType: '',
  serverUrl: Uri.parse('http://localhost'),
);

DownloadItem _item({DownloadStatus status = .queued}) => DownloadItem(
  serverUrl: Uri.parse('http://localhost'),
  libraryItemId: 'item-1',
  userId: 'user-1',
  title: 'Book',
  author: 'Author',
  tracks: [
    const DownloadTrack(
      audioTrack: AudioTrack(
        index: 1,
        startOffset: Duration.zero,
        duration: Duration.zero,
        title: 'Track 1',
        contentUrl: 'http://server/track1',
      ),
      ino: 'ino-1',
      bytesTotal: 10,
      bytesReceived: 10,
      trackPath: 'audio1.mp3',
    ),
  ],
  status: status,
  folderPath: '/dl',
  relativePath: 'book',
);

class _FakeEngine extends DownloadEngine {
  new({this.snapshots = const [], this.error})
    : super(
        transport: FakeDownloadTransport(),
        accessToken: (_) async => 'token',
        storageService: (_) => null,
        coverDownloader: ({
          required libraryItemId,
          required isPodcast,
          required cancelToken,
        }) async {},
      );

  final List<DownloadItem> snapshots;
  final Object? error;

  @override
  Future<DownloadItem> download({
    required DownloadItem item,
    required UserDomain user,
    required Future<void> Function(DownloadItem item) onProgress,
  }) async {
    final failure = error;
    if (failure != null) throw failure;
    for (final snapshot in snapshots) {
      await onProgress(snapshot);
    }
    return snapshots.isEmpty ? item : snapshots.last;
  }
}

void main() {
  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  group('DownloadTask', () {
    test('runs the download and persists the terminal snapshot', () async {
      final store = FakeDownloadsStore();
      await store.save(_item());

      final notifications = FakeDownloadsNotifications();
      final task = DownloadTask(
        store: store,
        engine: _FakeEngine(snapshots: [_item(status: .completed)]),
        notifications: notifications,
        currentUser: () => _user,
      );

      await task.run('item-1');

      expect(store.get('item-1')?.status, DownloadStatus.completed);
      expect(notifications.countOf('acquire'), 1);
      expect(notifications.countOf('release'), 1);
      expect(notifications.progressCalls.last.isComplete, isTrue);
    });

    test('marks the item failed when the engine throws', () async {
      final store = FakeDownloadsStore();
      await store.save(_item());

      final notifications = FakeDownloadsNotifications();
      final task = DownloadTask(
        store: store,
        engine: _FakeEngine(error: Exception('boom')),
        notifications: notifications,
        currentUser: () => _user,
      );

      await task.run('item-1');

      expect(store.get('item-1')?.status, DownloadStatus.failed);
      expect(notifications.progressCalls.last.isFailed, isTrue);
      expect(notifications.countOf('release'), 1);
    });

    test('does nothing when the item is gone', () async {
      final notifications = FakeDownloadsNotifications();
      final task = DownloadTask(
        store: FakeDownloadsStore(),
        engine: _FakeEngine(snapshots: [_item(status: .completed)]),
        notifications: notifications,
        currentUser: () => _user,
      );

      await task.run('item-1');

      expect(notifications.events, isEmpty);
    });

    test('fails the item when no user is signed in', () async {
      final store = FakeDownloadsStore();
      await store.save(_item());

      final notifications = FakeDownloadsNotifications();
      final task = DownloadTask(
        store: store,
        engine: _FakeEngine(snapshots: [_item(status: .completed)]),
        notifications: notifications,
        currentUser: () => null,
      );

      await task.run('item-1');

      expect(store.get('item-1')?.status, DownloadStatus.failed);
      expect(notifications.progressCalls.last.isFailed, isTrue);
    });
  });
}
