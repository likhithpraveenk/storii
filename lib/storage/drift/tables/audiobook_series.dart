import 'package:drift/drift.dart';
import 'package:storii/storage/drift/tables/libraries.dart';
import 'package:storii/storage/drift/tables/library_items.dart';
import 'package:storii/storage/drift/tables/series_table.dart';

@DataClassName('AudiobookSeriesLink')
class AudiobookSeries extends Table {
  TextColumn get audiobookId => text().references(Audiobooks, #id)();
  TextColumn get seriesId => text().references(SeriesTable, #id)();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {audiobookId, seriesId, libraryId};
}
