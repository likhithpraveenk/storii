import 'package:drift/drift.dart';
import 'package:storii/app/models/log_entry.dart';

@UseRowClass(LogEntry, generateInsertable: true)
class AppLogs extends Table {
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get message => text()();
  TextColumn get level =>
      text().map(const EnumNameConverter(LogLevel.values))();
  TextColumn get source => text().nullable()();
  TextColumn get stackTrace => text().nullable()();

  @override
  Set<Column> get primaryKey => {timestamp};
}
