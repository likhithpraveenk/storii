import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/drift/database.dart';

part 'current_item_provider.g.dart';

@riverpod
class CurrentItemNotifier extends _$CurrentItemNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<ItemDomain?> build() async* {
    final itemId = ref.watch(currentItemIdProvider);
    final audiobook = await _db.managers.audiobooks
        .filter((f) => f.id.equals(itemId))
        .getSingleOrNull();
    yield audiobook;
  }

  // TODO: helper
  void setItem(ItemDomain item) {
    state = AsyncValue.data(item);
  }
}
