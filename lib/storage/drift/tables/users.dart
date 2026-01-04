import 'package:drift/drift.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/drift/converters.dart';
import 'package:storii/storage/drift/tables/servers.dart';

@UseRowClass(User, generateInsertable: true)
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get userType => text()();
  TextColumn get serverUrl => text()
      .map(const UriConverter())
      .references(Servers, #url, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
