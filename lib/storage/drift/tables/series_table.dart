import 'package:drift/drift.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/storage/drift/tables/libraries.dart';

@UseRowClass(Series, generateInsertable: true)
class SeriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get nameIgnorePrefix => text().nullable()();
  TextColumn get description => text().nullable()();

  DateTimeColumn get addedAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  BoolColumn get isFinished => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, libraryId};
}
