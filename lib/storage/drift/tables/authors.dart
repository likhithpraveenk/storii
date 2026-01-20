import 'package:drift/drift.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/storage/drift/tables/libraries.dart';

@UseRowClass(AuthorDomain, generateInsertable: true)
class Authors extends Table {
  TextColumn get id => text()();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get addedAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
