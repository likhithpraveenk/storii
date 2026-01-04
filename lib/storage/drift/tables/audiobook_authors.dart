import 'package:drift/drift.dart';
import 'package:storii/storage/drift/tables/authors.dart';
import 'package:storii/storage/drift/tables/library_items.dart';

class AudiobookAuthors extends Table {
  TextColumn get audiobookId => text().references(Audiobooks, #id)();
  TextColumn get authorId => text().references(Authors, #id)();

  @override
  Set<Column> get primaryKey => {audiobookId, authorId};
}
