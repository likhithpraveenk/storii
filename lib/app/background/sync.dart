import 'package:drift/drift.dart';
import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/endpoints/author_api.dart';
import 'package:storii/api/endpoints/library_api.dart';
import 'package:storii/api/models/requests/series_request_params.dart';
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
    await syncManager.performLibrarySync(config.libraryId);
  } finally {
    await db.close();
  }
}

class SyncManager {
  final AppDatabase db;
  final Uri baseUrl;
  final LibraryApi libraryApi;
  final AuthorApi authorApi;

  SyncManager(this.db, ApiClient api)
    : baseUrl = api.baseUrl,
      libraryApi = LibraryApi(api),
      authorApi = AuthorApi(api);

  Future<void> performLibrarySync(String libraryId) async {
    final itemsFuture = libraryApi.getItems(libraryId, null);
    final items = (await itemsFuture).results.map((e) => e.toDomain());
    if (items.isEmpty) return;

    final books = items.whereType<Audiobook>().toList();
    final podcasts = items.whereType<Podcast>().toList();

    if (podcasts.isNotEmpty) {
      await db.transaction(() async {
        await db.podcasts.deleteWhere((t) => t.libraryId.equals(libraryId));

        await db.batch((batch) {
          batch.insertAllOnConflictUpdate(
            db.podcasts,
            podcasts.map((item) => item.toInsertable()),
          );
        });
      });
    } else {
      final seriesFuture = libraryApi.getSeries(
        libraryId,
        const SeriesRequestParams(limit: 9999),
      );
      final authorsFuture = libraryApi.getAuthors(libraryId);
      final seriesL = (await seriesFuture).results.map(
        (e) => e.toDomain(libraryId),
      );
      final authorsList = (await authorsFuture).map(
        (e) => e.toDomain(libraryId),
      );

      final audiobookSeriesLinks = <AudiobookSeriesLink>[];
      for (final s in seriesL) {
        for (final book in s.books ?? <LibraryItem>[]) {
          audiobookSeriesLinks.add(
            AudiobookSeriesLink(
              seriesId: s.id,
              audiobookId: book.id,
              libraryId: libraryId,
            ),
          );
        }
      }

      final audiobookAuthorLinks = <AudiobookAuthorsLink>[];
      for (final a in authorsList) {
        for (final book in a.libraryItems ?? <LibraryItem>[]) {
          audiobookAuthorLinks.add(
            AudiobookAuthorsLink(
              authorId: a.id,
              audiobookId: book.id,
              libraryId: libraryId,
            ),
          );
        }
      }

      await db.transaction(() async {
        await db.audiobookSeries.deleteWhere(
          (t) => t.libraryId.equals(libraryId),
        );
        await db.audiobookAuthors.deleteWhere(
          (t) => t.libraryId.equals(libraryId),
        );
        await db.audiobooks.deleteWhere((t) => t.libraryId.equals(libraryId));
        await db.seriesTable.deleteWhere((t) => t.libraryId.equals(libraryId));
        await db.authors.deleteWhere((t) => t.libraryId.equals(libraryId));

        await db.batch((batch) {
          batch.insertAll(db.audiobooks, books.map((e) => e.toInsertable()));
          batch.insertAll(db.seriesTable, seriesL.map((e) => e.toInsertable()));
          batch.insertAll(db.authors, authorsList.map((e) => e.toInsertable()));
          batch.insertAll(db.audiobookSeries, audiobookSeriesLinks);
          batch.insertAll(db.audiobookAuthors, audiobookAuthorLinks);
        });
      });
    }

    // download images service?
  }
}
