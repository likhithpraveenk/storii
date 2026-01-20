import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/player.dart';
import 'package:storii/storage/drift/database.dart';

part 'current_item_provider.g.dart';

final playerControllerProvider = Provider((ref) => PlayerController());

@riverpod
class CurrentItemNotifier extends _$CurrentItemNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<ItemDomain?> build() async* {
    final user = ref.watch(currentUserProvider);
    if (user == null) {
      yield null;
    } else {
      final itemId = ref.watch(currentItemIdProvider(user.id));
      final audiobook = await _db.managers.audiobooks
          .filter((f) => f.id.equals(itemId))
          .getSingleOrNull();
      yield audiobook;
    }
  }

  // TODO: helper
  void setItem(ItemDomain item) {
    state = AsyncValue.data(item);
  }
}
