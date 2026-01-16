import 'package:drift/drift.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/storage/drift/converters.dart';
import 'package:storii/storage/drift/tables/servers.dart';

@UseRowClass(LibraryDomain, generateInsertable: true)
class Libraries extends Table {
  TextColumn get id => text()();
  TextColumn get serverUrl => text()
      .map(const UriConverter())
      .references(Servers, #url, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get mediaContent =>
      text().map(const EnumNameConverter(MediaContent.values))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
