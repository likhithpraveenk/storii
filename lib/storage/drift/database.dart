import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:storii/api/models/audio/audio_file.dart';
import 'package:storii/api/models/audio/audio_track.dart';
import 'package:storii/api/models/books/book_chapter.dart';
import 'package:storii/api/models/podcasts/podcast_episode.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/models/media_progress.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/drift/converters.dart';
import 'package:storii/storage/drift/dao/media_progress_dao.dart';
import 'package:storii/storage/drift/tables/app_logs.dart';
import 'package:storii/storage/drift/tables/audiobook_authors.dart';
import 'package:storii/storage/drift/tables/audiobook_series.dart';
import 'package:storii/storage/drift/tables/authors.dart';
import 'package:storii/storage/drift/tables/libraries.dart';
import 'package:storii/storage/drift/tables/library_items.dart';
import 'package:storii/storage/drift/tables/media_progress_table.dart';
import 'package:storii/storage/drift/tables/series_table.dart';
import 'package:storii/storage/drift/tables/servers.dart';
import 'package:storii/storage/drift/tables/settings.dart';
import 'package:storii/storage/drift/tables/users.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Servers,
    AppLogs,
    Settings,
    Libraries,
    Audiobooks,
    Podcasts,
    MediaProgressTable,
    SeriesTable,
    AudiobookSeries,
    Authors,
    AudiobookAuthors,
  ],
  daos: [MediaProgressDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // future migrations
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'storii_db',
      native: const DriftNativeOptions(shareAcrossIsolates: true),
    );
  }

  Future<DriftIsolate> createIsolate() => DriftIsolate.spawn(_openConnection);
}
