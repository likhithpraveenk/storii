import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/logic/storage_service_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

import '../../../fakes/fake_download_transport.dart';
import '../../../fakes/fake_notifications.dart';
import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

class _FakeStorageService extends StorageService {
  new(super.location);

  @override
  Future<TrackFileStat?> stat({
    required String relativePath,
    required String trackPath,
  }) async => (path: trackPath, length: 1024);

  @override
  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
  }) async {
    final controller = StreamController<List<int>>();
    return controller.sink;
  }

  @override
  Future<void> deleteFolder({required String relativePath}) async {}

  @override
  Future<void> deleteTrack({
    required String relativePath,
    required String trackPath,
  }) async {}

  @override
  Future<void> cleanupEmptyFolders() async {}
}

LibraryItem _bookItem({String id = 'item-1'}) => LibraryItem(
  id: id,
  libraryId: 'lib-1',
  addedAt: DateTime(2026),
  updatedAt: DateTime(2026),
  isMissing: false,
  mediaType: .book,
  media: Media.book(
    id: id,
    metadata: const MediaMetadata.book(
      title: 'Test Book',
      authorName: 'Author',
    ),
    audioFiles: [
      AudioFile(
        ino: 'ino-1',
        metadata: FileMetadata(
          filename: 'audio1.mp3',
          ext: 'mp3',
          path: '/path/audio1.mp3',
          relPath: 'book/audio1.mp3',
          size: 1000,
          mtime: DateTime(2026),
          ctime: DateTime(2026),
          birthtime: DateTime(2026),
        ),
        index: 1,
      ),
    ],
    tracks: [
      const AudioTrack(
        index: 1,
        startOffset: Duration.zero,
        duration: Duration.zero,
        title: 'Track 1',
        contentUrl: 'http://server/track1',
      ),
    ],
  ),
  relPath: 'book',
);

const _location = StorageLocation(
  name: 'loc',
  uri: '/downloads',
  mediaType: DownloadMediaType.audiobook,
  isInternal: true,
);

final _user = UserDomain(
  id: '1',
  username: 'user',
  userType: '',
  serverUrl: Uri.parse('http://localhost'),
);

class _FakeItemDetail extends ItemDetail {
  new() : super();

  @override
  Future<LibraryItem> build(String id) async => _bookItem(id: id);
}

class _FakeEngine extends DownloadEngine {
  new({this.hold = false})
    : super(
        transport: FakeDownloadTransport(),
        accessToken: (_) async => 'token',
        storageService: (_) => null,
        activeServerUrl: () => Uri.parse('http://localhost'),
        coverDownloader: ({
          required libraryItemId,
          required isPodcast,
          required cancelToken,
        }) async {},
      );

  final bool hold;
  final List<String> cancelledKeys = <String>[];
  final Completer<void> started = Completer<void>();
  final Map<String, Completer<void>> _gates = <String, Completer<void>>{};

  @override
  Future<DownloadItem> download({
    required DownloadItem item,
    required UserDomain user,
    required Future<void> Function(DownloadItem item) onProgress,
  }) async {
    await onProgress(item.copyWith(status: .downloading));
    if (!started.isCompleted) started.complete();

    if (hold) {
      final gate = Completer<void>();
      _gates[item.key] = gate;
      await gate.future;
      _gates.remove(item.key);
    }

    final cancelled = cancelledKeys.contains(item.key);
    final current = item.copyWith(
      status: cancelled ? .paused : .completed,
      tracks: item.tracks
          .map(
            (t) => t.copyWith(
              status: cancelled ? .paused : .completed,
              bytesReceived: t.bytesTotal,
            ),
          )
          .toList(),
    );
    await onProgress(current);
    return current;
  }

  @override
  void cancel(String key) {
    cancelledKeys.add(key);
    _gates.remove(key)?.complete();
  }
}

ProviderContainer _container({
  bool isOffline = false,
  required ConnectionType connectionType,
  required bool wifiOnly,
  FakeDownloadsNotifications? notifications,
  DownloadEngine? engine,
}) {
  final store = FakeDownloadsStore();
  return ProviderContainer(
    overrides: [
      downloadsStoreProvider.overrideWithValue(store),
      itemsCacheProvider.overrideWithValue(FakeItemsCache()),
      storageServiceProvider(_location)
          .overrideWithValue(_FakeStorageService(_location)),
      itemDetailProvider('item-1').overrideWith(_FakeItemDetail.new),
      currentUserProvider.overrideWithValue(_user),
      isServerOfflineProvider.overrideWithValue(isOffline),
      connectionTypeProvider.overrideWithValue(connectionType),
      downloadOnUnmeteredOnlyProvider.overrideWithValue(wifiOnly),
      useBinaryBytesProvider.overrideWithValue(false),
      downloadsNotificationsProvider.overrideWithValue(
        notifications ?? FakeDownloadsNotifications(),
      ),
      parallelDownloadsProvider.overrideWithValue(1),
      if (engine != null) downloadEngineProvider.overrideWithValue(engine),
    ],
  );
}

FakeDownloadsStore storeOf(ProviderContainer container) =>
    container.read(downloadsStoreProvider) as FakeDownloadsStore;

FakeDownloadsNotifications notificationsOf(ProviderContainer container) =>
    container.read(downloadsNotificationsProvider)
        as FakeDownloadsNotifications;

void main() {
  setUpAll(() async {
    await initGlobals();
  });
  group('DownloadQueue network gating', () {
    test(
      'enqueue while offline marks the item waiting and keeps it queued',
      () async {
        final container = _container(
          isOffline: true,
          connectionType: .mobile,
          wifiOnly: false,
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);

        final store = storeOf(container);
        expect(store.saveCalls, 2);
        expect(store.get('item-1')?.status, DownloadStatus.waiting);
        expect(container.read(downloadQueueProvider), equals(['item-1']));
      },
    );

    test('does not re-enqueue an already queued item', () async {
      final container = _container(
        isOffline: true,
        connectionType: .mobile,
        wifiOnly: false,
      );
      addTearDown(container.dispose);

      final queue = container.read(downloadQueueProvider.notifier);
      await queue.enqueue(libraryItemId: 'item-1', location: _location);
      await queue.enqueue(libraryItemId: 'item-1', location: _location);

      expect(storeOf(container).saveCalls, 2);
      expect(container.read(downloadQueueProvider), equals(['item-1']));
    });

    test('waits on mobile when unmetered-only is enabled', () async {
      final container = _container(connectionType: .mobile, wifiOnly: true);
      addTearDown(container.dispose);

      final queue = container.read(downloadQueueProvider.notifier);
      await queue.enqueue(libraryItemId: 'item-1', location: _location);

      final store = storeOf(container);
      expect(store.get('item-1')?.status, DownloadStatus.waiting);
      expect(container.read(downloadQueueProvider), equals(['item-1']));
    });
  });

  group('DownloadQueue notifications', () {
    test('waiting items never start the foreground service', () async {
      final container = _container(
        connectionType: .mobile,
        wifiOnly: true,
        engine: _FakeEngine(),
      );
      addTearDown(container.dispose);

      final queue = container.read(downloadQueueProvider.notifier);
      await queue.enqueue(libraryItemId: 'item-1', location: _location);

      expect(storeOf(container).get('item-1')?.status, DownloadStatus.waiting);
      expect(notificationsOf(container).events, isEmpty);
    });

    test('starts foreground after the gate and stops it on completion', () {
      fakeAsync((async) async {
        final container = _container(
          connectionType: .wifi,
          wifiOnly: false,
          engine: _FakeEngine(),
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);
        async.elapse(const Duration(milliseconds: 300));

        final notifications = notificationsOf(container);
        expect(notifications.countOf('acquire'), 1);
        expect(notifications.countOf('release'), 1);
        expect(notifications.events, contains('showProgress'));
        expect(
          notifications.events.indexOf('acquire'),
          lessThan(notifications.events.indexOf('showProgress')),
        );

        expect(
          storeOf(container).get('item-1')?.status,
          DownloadStatus.completed,
        );
        expect(container.read(downloadQueueProvider), isEmpty);
      });
    });

    test('downloads multiple items concurrently', () {
      fakeAsync((async) async {
        final notifications = FakeDownloadsNotifications();
        final container = ProviderContainer(
          overrides: [
            downloadsStoreProvider.overrideWithValue(FakeDownloadsStore()),
            itemsCacheProvider.overrideWithValue(FakeItemsCache()),
            storageServiceProvider(_location)
                .overrideWithValue(_FakeStorageService(_location)),
            itemDetailProvider('item-1').overrideWith(_FakeItemDetail.new),
            itemDetailProvider('item-2').overrideWith(_FakeItemDetail.new),
            currentUserProvider.overrideWithValue(_user),
            isServerOfflineProvider.overrideWithValue(false),
            connectionTypeProvider.overrideWithValue(.wifi),
            downloadOnUnmeteredOnlyProvider.overrideWithValue(false),
            useBinaryBytesProvider.overrideWithValue(false),
            downloadsNotificationsProvider.overrideWithValue(notifications),
            parallelDownloadsProvider.overrideWithValue(2),
            downloadEngineProvider.overrideWithValue(_FakeEngine()),
          ],
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);
        await queue.enqueue(libraryItemId: 'item-2', location: _location);
        async.elapse(const Duration(milliseconds: 300));

        expect(notifications.countOf('acquire'), 2);
        expect(notifications.countOf('release'), 2);
        expect(notifications.countOf('showProgress'), greaterThanOrEqualTo(2));
        expect(
          storeOf(container).get('item-1')?.status,
          DownloadStatus.completed,
        );
        expect(
          storeOf(container).get('item-2')?.status,
          DownloadStatus.completed,
        );
        expect(container.read(downloadQueueProvider), isEmpty);
      });
    });

    test('respects parallel limit - third item stays queued', () {
      fakeAsync((async) async {
        final notifications = FakeDownloadsNotifications();
        final engine = _FakeEngine(hold: true);
        final container = ProviderContainer(
          overrides: [
            downloadsStoreProvider.overrideWithValue(FakeDownloadsStore()),
            itemsCacheProvider.overrideWithValue(FakeItemsCache()),
            storageServiceProvider(_location)
                .overrideWithValue(_FakeStorageService(_location)),
            itemDetailProvider('item-1').overrideWith(_FakeItemDetail.new),
            itemDetailProvider('item-2').overrideWith(_FakeItemDetail.new),
            itemDetailProvider('item-3').overrideWith(_FakeItemDetail.new),
            currentUserProvider.overrideWithValue(_user),
            isServerOfflineProvider.overrideWithValue(false),
            connectionTypeProvider.overrideWithValue(.wifi),
            downloadOnUnmeteredOnlyProvider.overrideWithValue(false),
            useBinaryBytesProvider.overrideWithValue(false),
            downloadsNotificationsProvider.overrideWithValue(notifications),
            parallelDownloadsProvider.overrideWithValue(2),
            downloadEngineProvider.overrideWithValue(engine),
          ],
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);
        await queue.enqueue(libraryItemId: 'item-2', location: _location);
        await queue.enqueue(libraryItemId: 'item-3', location: _location);

        await engine.started.future;
        async.elapse(const Duration(milliseconds: 100));

        final store = storeOf(container);
        expect(store.get('item-1')?.status, DownloadStatus.downloading);
        expect(store.get('item-2')?.status, DownloadStatus.downloading);
        expect(store.get('item-3')?.status, DownloadStatus.queued);

        expect(container.read(downloadQueueProvider).length, 3);

        engine.cancelledKeys.clear();
        engine._gates['item-1']?.complete();
        engine._gates['item-2']?.complete();

        async.elapse(const Duration(milliseconds: 200));
        expect(store.get('item-3')?.status, DownloadStatus.downloading);

        engine._gates['item-3']?.complete();
        async.elapse(const Duration(milliseconds: 200));

        expect(store.get('item-1')?.status, DownloadStatus.completed);
        expect(store.get('item-2')?.status, DownloadStatus.completed);
        expect(store.get('item-3')?.status, DownloadStatus.completed);
        expect(container.read(downloadQueueProvider), isEmpty);
      });
    });

    test('reports completion through the notification port', () {
      fakeAsync((async) async {
        final container = _container(
          connectionType: .wifi,
          wifiOnly: false,
          engine: _FakeEngine(),
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);
        async.elapse(const Duration(milliseconds: 300));

        final progress = notificationsOf(container).progressCalls.last;
        expect(progress.isComplete, isTrue);
        expect(progress.isFailed, isFalse);
        expect(progress.title, 'Test Book');
      });
    });
  });

  group('DownloadQueue drain races', () {
    test('pausing during a transfer keeps the item paused', () async {
      final engine = _FakeEngine(hold: true);
      final container = _container(
        connectionType: .wifi,
        wifiOnly: false,
        engine: engine,
      );
      addTearDown(container.dispose);

      final queue = container.read(downloadQueueProvider.notifier);
      final enqueue = queue.enqueue(
        libraryItemId: 'item-1',
        location: _location,
      );
      await engine.started.future;

      await queue.pause('item-1');
      await enqueue;

      expect(engine.cancelledKeys, ['item-1']);
      expect(storeOf(container).get('item-1')?.status, DownloadStatus.paused);
      expect(container.read(downloadQueueProvider), isEmpty);
    });

    test('a failing download does not block later drains', () {
      fakeAsync((async) async {
        final container = _container(
          connectionType: .wifi,
          wifiOnly: false,
          engine: _FakeEngine(),
        );
        addTearDown(container.dispose);

        final queue = container.read(downloadQueueProvider.notifier);
        await queue.enqueue(libraryItemId: 'item-1', location: _location);
        async.elapse(const Duration(milliseconds: 300));

        expect(container.read(downloadQueueProvider), isEmpty);
        expect(
          storeOf(container).get('item-1')?.status,
          DownloadStatus.completed,
        );
      });
    });
  });
}
