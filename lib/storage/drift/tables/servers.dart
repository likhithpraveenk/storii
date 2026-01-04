import 'package:drift/drift.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/storage/drift/converters.dart';

@UseRowClass(Server, generateInsertable: true)
class Servers extends Table {
  TextColumn get url => text().map(const UriConverter())();

  @override
  Set<Column> get primaryKey => {url};
}
