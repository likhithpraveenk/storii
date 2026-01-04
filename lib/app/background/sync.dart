import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/endpoints/library_api.dart';
import 'package:storii/app/config/sync_config.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/storage/drift/database.dart';

Future<void> startBackgroundSync(SyncConfig config) async {
  final connection = await config.driftIsolate.connect();
  final db = AppDatabase(connection);

  final api = ApiClient(
    baseUrl: config.serverUrl,
    getAccessToken: () => config.tokenStorage.getAccessToken(config.userId),
    getRefreshToken: () => config.tokenStorage.getRefreshToken(config.userId),
  );

  try {
    final syncManager = SyncManager(db, api);
    await syncManager.performFullSync(config.libraryId);
  } finally {
    await db.close();
  }
}

class SyncManager {
  final AppDatabase db;
  final ApiClient api;
  final LibraryApi libraryApi;

  SyncManager(this.db, this.api) : libraryApi = LibraryApi(api);

  Future<void> performFullSync(String libraryId) async {
    final libraries = await LibraryApi(api).getAll();
    await db.batch(
      (batch) => batch.insertAllOnConflictUpdate(
        db.libraries,
        libraries.map((e) => e.toDomain(api.baseUrl).toInsertable()),
      ),
    );
    await Future.wait([
      _syncItems(libraryId),
      _syncSeries(libraryId),
      _syncAuthors(libraryId),
    ]);
  }

  Future<void> _syncItems(String libId) async {
    // TODO: Pagination
    final response = await libraryApi.getItems(libId, null);
    final items = response.results.map((e) => e.toDomain()).toList();

    await db.batch((batch) {
      final firstItem = items.first;
      switch (firstItem) {
        case Audiobook():
          batch.insertAllOnConflictUpdate(
            db.audiobooks,
            items.cast<Audiobook>().map((item) => item.toInsertable()),
          );
        case Podcast():
          batch.insertAllOnConflictUpdate(
            db.podcasts,
            items.cast<Podcast>().map((item) => item.toInsertable()),
          );
      }
    });
  }

  Future<void> _syncSeries(String libId) async {
    // TODO: Pagination
    final response = await libraryApi.getSeries(libId, null);
    await db.batch(
      (batch) => batch.insertAllOnConflictUpdate(
        db.seriesTable,
        response.results.map((e) => e.toDomain().toInsertable()),
      ),
    );
  }

  Future<void> _syncAuthors(String libId) async {
    final response = await libraryApi.getAuthors(libId);
    await db.batch(
      (batch) => batch.insertAllOnConflictUpdate(
        db.audiobooks,
        response.map((e) => e.toDomain(libId).toInsertable()),
      ),
    );
  }
}
