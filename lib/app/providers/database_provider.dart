import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/drift/database.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase();

  ref.onDispose(db.close);
  return db;
}
