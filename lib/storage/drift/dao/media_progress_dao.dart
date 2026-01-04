import 'package:drift/drift.dart';
import 'package:storii/app/models/media_progress.dart';
import 'package:storii/storage/drift/database.dart';
import 'package:storii/storage/drift/tables/library_items.dart';
import 'package:storii/storage/drift/tables/media_progress_table.dart';

part 'media_progress_dao.g.dart';

@DriftAccessor(tables: [MediaProgressTable, Audiobooks])
class MediaProgressDao extends DatabaseAccessor<AppDatabase>
    with _$MediaProgressDaoMixin {
  MediaProgressDao(super.db);

  Stream<MediaProgress?> watchProgress(String userId, String itemId) {
    return (select(mediaProgressTable)..where(
          (t) => t.userId.equals(userId) & t.libraryItemId.equals(itemId),
        ))
        .watchSingleOrNull();
  }

  Future<void> saveProgress({
    required String userId,
    required String itemId,
    required Duration currentDuration,
    required double progress,
    bool isFinished = false,
  }) async {
    return transaction(() async {
      await into(mediaProgressTable).insert(
        MediaProgressTableCompanion(
          userId: Value(userId),
          libraryItemId: Value(itemId),
          currentDuration: Value(currentDuration),
          progress: Value(progress),
          isFinished: Value(isFinished),
          lastUpdate: Value(DateTime.now()),
        ),
        mode: InsertMode.insertOrReplace,
      );

      await (update(audiobooks)..where((t) => t.id.equals(itemId))).write(
        AudiobooksCompanion(
          progress: Value(progress),
          isFinished: Value(isFinished),
        ),
      );
    });
  }

  Future<void> batchSyncFromLogin(List<MediaProgress> progressList) async {
    await transaction(() async {
      await customStatement('PRAGMA foreign_keys = OFF;');
      await batch((b) {
        b.insertAll(
          mediaProgressTable,
          progressList.map(
            (p) => p.toInsertable(),
          ), // will replace any existing unsynced sessions
          mode: InsertMode.insertOrReplace,
        );
      });

      for (var progress in progressList) {
        await (update(
          audiobooks,
        )..where((t) => t.id.equals(progress.libraryItemId))).write(
          AudiobooksCompanion(
            progress: Value(progress.progress),
            isFinished: Value(progress.isFinished),
            hideFromContinueListening: Value(
              progress.hideFromContinueListening,
            ),
          ),
        );
      }
      await customStatement('PRAGMA foreign_keys = ON;');
    });
  }

  Future<void> syncFromServer(MediaProgress remote) async {
    await into(
      mediaProgressTable,
    ).insertOnConflictUpdate(remote.toInsertable());

    await (update(
      audiobooks,
    )..where((t) => t.id.equals(remote.libraryItemId))).write(
      AudiobooksCompanion(
        progress: Value(remote.progress),
        isFinished: Value(remote.isFinished),
      ),
    );
  }

  Future<List<MediaProgress>> getUnsyncedProgress(DateTime lastSyncTime) {
    return (select(
      mediaProgressTable,
    )..where((t) => t.lastUpdate.isBiggerThanValue(lastSyncTime))).get();
  }
}
