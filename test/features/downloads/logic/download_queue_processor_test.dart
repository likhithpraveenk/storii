import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/downloads/logic/download_queue_processor.dart';
import 'package:storii/features/downloads/models/download_item.dart';

import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

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

List<String> _activeKeys(FakeDownloadsStore store) => store
    .getAll()
    .values
    .where((item) => item.isActive)
    .map((item) => item.key)
    .toList();

Future<void> _complete(FakeDownloadsStore store, String key) async {
  final item = store.get(key);
  if (item == null) return;
  await store.save(item.copyWith(status: .completed));
}

void main() {
  setUpAll(() async {
    await initGlobals();
  });
  tearDownAll(disposeGlobals);

  group('DownloadQueueProcessor', () {
    test('drains the queue in FIFO order', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));
      await store.save(_item('c'));

      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          started.add(key);
          await _complete(store, key);
        },
        maxConcurrent: () => 1,
      );

      await processor.process();

      expect(started, ['a', 'b', 'c']);
      expect(_activeKeys(store), isEmpty);
    });

    test('a waiting head stops the drain', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));

      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (item) async => item?.libraryItemId != 'a',
        runItem: (key) async => started.add(key),
        maxConcurrent: () => 1,
      );

      await processor.process();

      expect(started, isEmpty);
      expect(_activeKeys(store), ['a', 'b']);
    });

    test('drains the rest once the gate opens again', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));

      var allowed = false;
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async => allowed,
        runItem: (key) async {
          started.add(key);
          await _complete(store, key);
        },
        maxConcurrent: () => 1,
      );

      await processor.process();
      expect(started, isEmpty);

      allowed = true;
      await processor.process();

      expect(started, ['a', 'b']);
      expect(_activeKeys(store), isEmpty);
    });

    test('a key removed while the gate awaits is not started', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final gate = Completer<void>();
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async {
          await gate.future;
          return true;
        },
        runItem: (key) async => started.add(key),
        maxConcurrent: () => 1,
      );

      final processing = processor.process();
      await store.remove('a');
      gate.complete();
      await processing;

      expect(started, isEmpty);
    });

    test('releases the processing guard when a task throws', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      var shouldThrow = true;
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          started.add(key);
          if (shouldThrow) throw Exception('save failed');
        },
        maxConcurrent: () => 1,
      );

      await expectLater(processor.process(), throwsA(isException));
      expect(processor.isProcessing, isFalse);
      expect(store.get('a')?.status, DownloadStatus.failed);

      shouldThrow = false;
      await processor.process();

      expect(started, ['a']);
    });

    test(
      'a task that ends without a terminal status is marked failed',
      () async {
        final store = FakeDownloadsStore();
        await store.save(_item('a'));

        final processor = DownloadQueueProcessor(
          readKeys: () => _activeKeys(store),
          store: store,
          canStart: (_) async => true,
          runItem: (key) async {},
          maxConcurrent: () => 1,
        );

        await processor.process();

        expect(store.get('a')?.status, DownloadStatus.failed);
        expect(_activeKeys(store), isEmpty);
      },
    );

    test('a second drain does not start while one is running', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));

      final gate = Completer<void>();
      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          started.add(key);
          await gate.future;
          await _complete(store, key);
        },
        maxConcurrent: () => 1,
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

      final gate = Completer<void>();
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (_) async => true,
        runItem: (key) async {
          await gate.future;
          await _complete(store, key);
        },
        maxConcurrent: () => 1,
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

    test(
      'starts up to maxConcurrent items concurrently in FIFO order',
      () async {
        final store = FakeDownloadsStore();
        await store.save(_item('a'));
        await store.save(_item('b'));
        await store.save(_item('c'));

        final started = <String>[];
        final gates = <String, Completer<void>>{
          'a': Completer<void>(),
          'b': Completer<void>(),
          'c': Completer<void>(),
        };
        var inFlight = 0;
        var maxInFlight = 0;
        final processor = DownloadQueueProcessor(
          readKeys: () => _activeKeys(store),
          store: store,
          canStart: (_) async => true,
          runItem: (key) async {
            inFlight++;
            if (inFlight > maxInFlight) maxInFlight = inFlight;
            started.add(key);
            await gates[key]!.future;
            inFlight--;
            await _complete(store, key);
          },
          maxConcurrent: () => 2,
        );

        final processing = processor.process();
        await Future<void>.delayed(Duration.zero);

        expect(started, ['a', 'b']);
        expect(maxInFlight, 2);

        gates['a']!.complete();
        gates['b']!.complete();
        gates['c']!.complete();

        await processing;

        expect(started, ['a', 'b', 'c']);
        expect(_activeKeys(store), isEmpty);
        expect(maxInFlight, 2);
      },
    );

    test('a waiting head stops the drain even with concurrency', () async {
      final store = FakeDownloadsStore();
      await store.save(_item('a'));
      await store.save(_item('b'));
      await store.save(_item('c'));

      final started = <String>[];
      final processor = DownloadQueueProcessor(
        readKeys: () => _activeKeys(store),
        store: store,
        canStart: (item) async => item?.libraryItemId != 'a',
        runItem: (key) async => started.add(key),
        maxConcurrent: () => 2,
      );

      await processor.process();

      expect(started, isEmpty);
      expect(_activeKeys(store), ['a', 'b', 'c']);
    });
  });
}
