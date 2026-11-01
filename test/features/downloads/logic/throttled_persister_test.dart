import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/downloads/logic/throttled_persister.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_stores.dart';

DownloadItem _item({DownloadStatus status = .queued}) => DownloadItem(
  serverUrl: Uri.parse('http://localhost'),
  libraryItemId: 'item-1',
  userId: 'user-1',
  title: 'T',
  author: 'A',
  tracks: const [],
  status: status,
  folderPath: '/dl',
  relativePath: 'book',
);

void main() {
  group('ThrottledPersister', () {
    test('persists terminal items immediately', () async {
      final store = FakeDownloadsStore();
      final persister = ThrottledPersister(
        store: store,
        onPersist: (_) async {},
      );

      await persister.update(_item(status: .completed));

      expect(store.saveCalls, 1);
      expect(store.saved.single.status, DownloadStatus.completed);
    });

    test('invokes onPersist with the persisted item', () async {
      final store = FakeDownloadsStore();
      DownloadItem? persisted;
      final persister = ThrottledPersister(
        store: store,
        onPersist: (item) async => persisted = item,
      );

      await persister.update(_item(status: .paused));

      expect(persisted, _item(status: .paused));
      expect(store.saveCalls, 1);
    });

    test('defers non-terminal items until flush or timer', () async {
      final store = FakeDownloadsStore();
      final persister = ThrottledPersister(
        store: store,
        onPersist: (_) async {},
      );

      await persister.update(_item());

      expect(store.saveCalls, 0);
    });

    test('flush persists a pending non-terminal item', () async {
      final store = FakeDownloadsStore();
      final persister = ThrottledPersister(
        store: store,
        onPersist: (_) async {},
      );

      await persister.update(_item());
      expect(store.saveCalls, 0);

      await persister.flush();
      expect(store.saveCalls, 1);
    });

    test('coalesces multiple updates into a single save', () async {
      final store = FakeDownloadsStore();
      final persister = ThrottledPersister(
        store: store,
        onPersist: (_) async {},
      );

      await persister.update(_item());
      await persister.update(_item(status: .downloading));

      expect(store.saveCalls, 0);
      await persister.flush();
      expect(store.saveCalls, 1);
      expect(store.saved.last.status, DownloadStatus.downloading);
    });

    test('persists after the persistence interval', () {
      fakeAsync((async) async {
        final store = FakeDownloadsStore();
        final persister = ThrottledPersister(
          store: store,
          onPersist: (_) async {},
        );

        await persister.update(_item());
        expect(store.saveCalls, 0);

        async.elapse(const Duration(milliseconds: 300));
        expect(store.saveCalls, 1);
      });
    });

    test(
      'terminal update saves before propagating an onPersist failure',
      () async {
        final store = FakeDownloadsStore();
        final persister = ThrottledPersister(
          store: store,
          onPersist: (_) async => throw Exception('boom'),
        );

        await expectLater(
          persister.update(_item(status: .completed)),
          throwsA(isException),
        );
        expect(store.saveCalls, 1);
        expect(store.saved.single.status, DownloadStatus.completed);
      },
    );

    test(
      'a failing save keeps the snapshot pending for the next flush',
      () async {
        final store = FakeDownloadsStore()..saveError = Exception('disk full');
        final persister = ThrottledPersister(
          store: store,
          onPersist: (_) async {},
        );

        await expectLater(
          persister.update(_item(status: .completed)),
          throwsA(isException),
        );

        store.saveError = null;
        await persister.flush();

        expect(store.saveCalls, 2);
        expect(store.saved.single.status, DownloadStatus.completed);
      },
    );

    test('a failing save does not block later flushes', () async {
      final store = FakeDownloadsStore()..saveError = Exception('disk full');
      final persister = ThrottledPersister(
        store: store,
        onPersist: (_) async {},
      );

      await expectLater(
        persister.update(_item(status: .completed)),
        throwsA(isException),
      );

      store.saveError = null;
      await persister.update(_item(status: .completed));

      expect(store.saved.single.status, DownloadStatus.completed);
    });

    test('the injected clock drives the persistence interval', () {
      fakeAsync((async) async {
        var now = DateTime(2026);
        final store = FakeDownloadsStore();
        final persister = ThrottledPersister(
          store: store,
          onPersist: (_) async {},
          now: () => now,
        );

        await persister.update(_item());
        expect(store.saveCalls, 0);

        // The clock jumped past the interval, so the next update is due now.
        now = now.add(const Duration(seconds: 1));
        await persister.update(_item(status: .downloading));
        async.elapse(const Duration(milliseconds: 300));

        expect(store.saveCalls, 1);
      });
    });
  });
}
