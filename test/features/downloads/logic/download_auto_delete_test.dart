import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/features/downloads/logic/download_auto_delete.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

import '../../../fakes/fake_stores.dart';
import '../../../helpers/init_globals.dart';

DownloadItem _item({
  required String libraryItemId,
  DownloadStatus status = .completed,
  String? episodeId,
  String userId = 'user-1',
}) => DownloadItem(
  serverUrl: Uri.parse('http://localhost'),
  libraryItemId: libraryItemId,
  userId: userId,
  title: 'Title $libraryItemId',
  author: 'Author',
  tracks: const [],
  folderPath: '/dl',
  relativePath: 'book',
  status: status,
  episodeId: episodeId,
);

MediaProgress _progress({
  required String libraryItemId,
  String? episodeId,
  bool isFinished = false,
  DateTime? finishedAt,
  DateTime? lastUpdate,
}) => MediaProgress(
  id: mediaItemIdKey(libraryItemId, episodeId),
  libraryItemId: libraryItemId,
  episodeId: episodeId,
  isFinished: isFinished,
  finishedAt: finishedAt,
  lastUpdate: lastUpdate,
);

Map<String, MediaProgress> _noProgress() => const {};

void main() {
  setUpAll(() async => await initGlobals());
  tearDownAll(disposeGlobals);

  final now = DateTime(2024, 1, 1, 12);
  const delay = Duration(days: 7);
  final finished8DaysAgo = now.subtract(const Duration(days: 8));

  /// Due exactly [untilDue] from [now].
  Map<String, MediaProgress> dueIn(Duration untilDue) => {
    'book1': _progress(
      libraryItemId: 'book1',
      isFinished: true,
      finishedAt: now.subtract(delay - untilDue),
    ),
  };

  Map<String, MediaProgress> progressFor(
    List<String> ids,
    DateTime finishedAt, {
    bool isFinished = true,
  }) => {
    for (final id in ids)
      id: _progress(
        libraryItemId: id,
        isFinished: isFinished,
        finishedAt: finishedAt,
      ),
  };

  DownloadAutoDelete build({
    required FakeDownloadsStore store,
    Map<String, MediaProgress> Function() progress = _noProgress,
    List<String> deleted = const [],
    bool enabled = true,
    bool Function(DownloadItem)? isPlaying,
    Set<String> Function()? excluded,
    bool Function(DownloadItem)? isOwner,
    DateTime Function()? now,
    Duration? delay,
    Future<void> Function(DownloadItem)? onDelete,
    List<Duration>? timerDurations,
  }) => DownloadAutoDelete(
    readDownloads: store.getAll,
    readProgress: () async => progress(),
    readDeleteDelay: () => delay ?? const Duration(days: 7),
    delete: onDelete ?? (item) async => deleted.add(item.key),
    isPlaying: isPlaying ?? (_) => false,
    isEnabled: () => enabled,
    readExcluded: excluded ?? () => {},
    isOwner: isOwner ?? (_) => true,
    now: now,
    timerFactory: timerDurations == null
        ? null
        : ((d, cb) {
            timerDurations.add(d);
            return Timer(d, cb);
          }),
  );

  group('sweep', () {
    test('deletes only overdue completed items', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));
      await store.save(_item(libraryItemId: 'book2'));

      final deleted = <String>[];
      final sweeper = build(
        store: store,
        deleted: deleted,
        progress: () => {
          ...dueIn(-const Duration(days: 1)),
          'book2': _progress(
            libraryItemId: 'book2',
            isFinished: true,
            finishedAt: now.subtract(const Duration(hours: 6)),
          ),
        },
        now: () => now,
      );

      await sweeper.sweep();

      expect(deleted, ['book1']);
      expect(store.get('book2'), isNotNull);
    });

    test('delay boundary: finished exactly delay ago is due', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));

      final deleted = <String>[];
      final sweeper = build(
        store: store,
        deleted: deleted,
        progress: () => progressFor(['book1'], now.subtract(delay)),
      );

      await sweeper.sweep();

      expect(deleted, ['book1']);
    });

    test('guards: active and currently playing items are skipped', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));
      await store.save(_item(libraryItemId: 'book2', status: .downloading));
      await store.save(_item(libraryItemId: 'book3'));

      final deleted = <String>[];
      final sweeper = build(
        store: store,
        deleted: deleted,
        progress: () =>
            progressFor(['book1', 'book2', 'book3'], finished8DaysAgo),
        isPlaying: (item) => item.libraryItemId == 'book1',
      );

      await sweeper.sweep();

      // book1 plays (session guard), book2 is active, book3 is due.
      expect(deleted, ['book3']);
    });

    test('disabled sweeper never deletes', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));

      final deleted = <String>[];
      final sweeper = build(
        store: store,
        deleted: deleted,
        progress: () => progressFor(['book1'], finished8DaysAgo),
        enabled: false,
      );

      await sweeper.sweep();

      expect(deleted, isEmpty);
    });

    test('running deletion is not duplicated by a concurrent sweep', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));

      var deleteCount = 0;
      final gate = Completer<void>();
      final sweeper = build(
        store: store,
        progress: () => progressFor(['book1'], finished8DaysAgo),
        onDelete: (item) async {
          deleteCount++;
          await gate.future;
        },
      );

      final first = sweeper.sweep();
      await Future<void>.delayed(Duration.zero);
      final second = sweeper.sweep();
      gate.complete();
      await Future.wait([first, second]);

      expect(deleteCount, 1);
    });

    test('excluded or different user\'s download is never deleted', () async {
      final store = FakeDownloadsStore();
      await store.save(_item(libraryItemId: 'book1'));
      await store.save(_item(libraryItemId: 'book2', userId: 'user-2'));

      final deleted = <String>[];
      final sweeper = build(
        store: store,
        deleted: deleted,
        progress: () => progressFor(['book1', 'book2'], finished8DaysAgo),
        excluded: () => {'book1'},
        isOwner: (item) => item.userId == 'user-1',
      );

      await sweeper.sweep();

      expect(deleted, isEmpty);
      expect(store.get('book1'), isNotNull);
    });
  });

  group('timer', () {
    test('arms a one-shot timer for the nearest due and deletes on fire', () {
      fakeAsync((async) {
        var current = now;
        final store = FakeDownloadsStore()..save(_item(libraryItemId: 'book1'));
        final deleted = <String>[];
        final timerDurations = <Duration>[];

        build(
          store: store,
          deleted: deleted,
          progress: () => dueIn(const Duration(minutes: 30)),
          now: () => current,
          timerDurations: timerDurations,
        ).requestSweep();
        async.flushMicrotasks();

        expect(deleted, isEmpty);
        expect(timerDurations, [const Duration(minutes: 30)]);

        current = current.add(const Duration(minutes: 30));
        async.elapse(const Duration(minutes: 30));

        expect(deleted, ['book1']);
      });
    });

    test('a new trigger replaces the pending timer', () {
      fakeAsync((async) {
        var current = now;
        // due 30 minutes out at first, then 50 minutes out from the new now.
        var untilDue = const Duration(minutes: 30);
        final store = FakeDownloadsStore()..save(_item(libraryItemId: 'book1'));
        final deleted = <String>[];
        final timerDurations = <Duration>[];

        final sweeper = build(
          store: store,
          deleted: deleted,
          progress: () => dueIn(untilDue),
          now: () => current,
          timerDurations: timerDurations,
        )..requestSweep();
        async.flushMicrotasks();
        expect(timerDurations, [const Duration(minutes: 30)]);

        current = current.add(const Duration(minutes: 20));
        untilDue = const Duration(minutes: 70);
        sweeper.requestSweep();
        async.flushMicrotasks();
        expect(timerDurations, [
          const Duration(minutes: 30),
          const Duration(minutes: 50),
        ]);

        // If the old timer had survived, it would fire here and re-arm.
        async.elapse(const Duration(minutes: 30));
        expect(timerDurations, hasLength(2));

        current = current.add(const Duration(minutes: 50));
        async.elapse(const Duration(minutes: 20));
        expect(deleted, ['book1']);
      });
    });

    test('due-but-skipped item does not arm a timer (no hot loop)', () {
      fakeAsync((async) {
        final store = FakeDownloadsStore()..save(_item(libraryItemId: 'book1'));
        final timerDurations = <Duration>[];

        build(
          store: store,
          progress: () => progressFor(['book1'], finished8DaysAgo),
          isPlaying: (_) => true,
          now: () => now,
          timerDurations: timerDurations,
        ).requestSweep();
        async
          ..flushMicrotasks()
          ..flushTimers();

        expect(timerDurations, isEmpty);
      });
    });
  });
}
