import 'package:drift/drift.dart';
import 'package:storii/storage/drift/tables/authors.dart';
import 'package:storii/storage/drift/tables/libraries.dart';
import 'package:storii/storage/drift/tables/library_items.dart';

@DataClassName('AudiobookAuthorsLink')
class AudiobookAuthors extends Table {
  TextColumn get audiobookId => text().references(Audiobooks, #id)();
  TextColumn get authorId => text().references(Authors, #id)();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {audiobookId, authorId, libraryId};
}
