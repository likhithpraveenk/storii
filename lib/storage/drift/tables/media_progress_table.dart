import 'package:drift/drift.dart';
import 'package:storii/app/models/media_progress.dart';
import 'package:storii/storage/drift/converters.dart';
import 'package:storii/storage/drift/tables/library_items.dart';
import 'package:storii/storage/drift/tables/users.dart';

@UseRowClass(MediaProgress, generateInsertable: true)
class MediaProgressTable extends Table {
  TextColumn get libraryItemId =>
      text().references(Audiobooks, #id, onDelete: KeyAction.cascade)();
  TextColumn get userId =>
      text().references(Users, #id, onDelete: KeyAction.cascade)();

  IntColumn get duration => integer().map(const DurationConverter())();
  RealColumn get progress => real()();
  IntColumn get currentDuration =>
      integer().map(const DurationConverter()).nullable()();

  BoolColumn get isFinished => boolean().withDefault(const Constant(false))();
  BoolColumn get hideFromContinueListening =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get lastUpdate => dateTime().nullable()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get finishedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {userId, libraryItemId};
}
