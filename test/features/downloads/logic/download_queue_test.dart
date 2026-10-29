import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/logic/storage_service_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

import '../../../fakes/fake_stores.dart';

class _FakeStorageService extends StorageService {
  new(super.location);

  @override
  Future<String?> getTrackPath({
    required String relativePath,
    required String trackPath,
  }) async => null;

  @override
  Future<int> getBytes({
    required String relativePath,
    required String trackPath,
  }) async => 0;

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
  Future<bool> isFileIntact({
    required String relativePath,
    required String trackPath,
    required int expectedBytes,
  }) async => true;

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
  Future<LibraryItem> build(String id) async => _bookItem();
}

ProviderContainer _container({
  required bool isOffline,
  required ConnectionType connectionType,
  required bool wifiOnly,
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
      isOfflineProvider.overrideWithValue(isOffline),
      connectionTypeProvider.overrideWithValue(connectionType),
      downloadOnUnmeteredOnlyProvider.overrideWithValue(wifiOnly),
    ],
  );
}

FakeDownloadsStore storeOf(ProviderContainer container) =>
    container.read(downloadsStoreProvider) as FakeDownloadsStore;

void main() {
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
      final container = _container(
        isOffline: false,
        connectionType: .mobile,
        wifiOnly: true,
      );
      addTearDown(container.dispose);

      final queue = container.read(downloadQueueProvider.notifier);
      await queue.enqueue(libraryItemId: 'item-1', location: _location);

      final store = storeOf(container);
      expect(store.get('item-1')?.status, DownloadStatus.waiting);
      expect(container.read(downloadQueueProvider), equals(['item-1']));
    });
  });
}
