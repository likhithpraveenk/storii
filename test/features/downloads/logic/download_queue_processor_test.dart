import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/downloads/logic/download_queue_processor.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_stores.dart';

DownloadItem _item(String key) => DownloadItem(
  serverUrl: Uri.parse('http://localhost'),
  libraryItemId: key,
  userId: 'user-1',
  title: 'Title $key',
  author: 'Author',
  tracks: const [],
  folderPath: '/dl',
  relativePath: 'book',
);

void main() {
  group('DownloadQueueProcessor', () {
    test('drains the queue in FIFO order', () async {
      final keys = ['a', 'b', 'c'];
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: FakeDownloadsStore(),
        canStart: (_) async => true,
        runItem: (key) async => started.add(key),
      );

      await processor.process();

      expect(started, ['a', 'b', 'c']);
      expect(keys, isEmpty);
    });

    test('a waiting head stops the drain', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));

      final keys = ['a', 'b'];
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (item) async => item?.libraryItemId != 'a',
        runItem: (key) async => started.add(key),
      );

      await processor.process();

      expect(started, isEmpty);
      expect(keys, ['a', 'b']);
    });

    test('drains the rest once the gate opens again', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));

      final keys = ['a', 'b'];
      var allowed = false;
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (_) async => allowed,
        runItem: (key) async => started.add(key),
      );

      await processor.process();
      expect(started, isEmpty);

      allowed = true;
      await processor.process();

      expect(started, ['a', 'b']);
      expect(keys, isEmpty);
    });

    test('removes a key only after its task finished', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final keys = ['a'];
      final gate = Completer<void>();
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (_) async => true,
        runItem: (key) async => gate.future,
      );

      final processing = processor.process();
      await Future<void>.delayed(Duration.zero);
      expect(keys, ['a']);

      gate.complete();
      await processing;
      expect(keys, isEmpty);
    });

    test('a missing store row is skipped and dropped from the queue', () async {
      final keys = ['ghost'];
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: FakeDownloadsStore(),
        canStart: (_) async => true,
        runItem: (key) async => started.add(key),
      );

      await processor.process();

      expect(started, ['ghost']);
      expect(keys, isEmpty);
    });

    test('releases the processing guard when a task throws', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final keys = ['a'];
      var shouldThrow = true;
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          started.add(key);
          if (shouldThrow) throw Exception('save failed');
        },
      );

      await expectLater(processor.process(), throwsA(isException));
      expect(processor.isProcessing, isFalse);

      shouldThrow = false;
      await processor.process();

      expect(started, ['a', 'a']);
    });

    test('a second drain does not start while one is running', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final keys = ['a'];
      final gate = Completer<void>();
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          started.add(key);
          await gate.future;
        },
      );

      final processing = processor.process();
      await Future<void>.delayed(Duration.zero);
      final second = processor.process();

      gate.complete();
      await processing;
      await second;

      expect(started, ['a']);
    });

    test('waitForIdle waits for the running task', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final keys = ['a'];
      final gate = Completer<void>();
      final processor = DownloadQueueProcessor(
        readKeys: () => keys,
        removeKey: keys.remove,
        store: store,
        canStart: (_) async => true,
        runItem: (key) async => gate.future,
      );

      final processing = processor.process();
      await Future<void>.delayed(Duration.zero);

      var idle = false;
      final idleFuture = processor.waitForIdle().then((_) => idle = true);
      await Future<void>.delayed(Duration.zero);
      expect(idle, isFalse);

      gate.complete();
      await processing;
      await idleFuture;
      expect(idle, isTrue);
    });
  });
}
