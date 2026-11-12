import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'auto_delete_exclusion_store.g.dart';

Box<bool> get _box => Hive.box(autoDeleteExclusionBoxName);

class AutoDeleteExclusionStore {
  const new();

  Set<String> getAll() => _box.keys.whereType<String>().toSet();

  bool contains(String mediaItemKey) => _box.containsKey(mediaItemKey);

  Future<void> add(String mediaItemKey) => _box.put(mediaItemKey, true);

  Future<void> remove(String mediaItemKey) => _box.delete(mediaItemKey);
}

@riverpod
AutoDeleteExclusionStore autoDeleteExclusionStore(Ref ref) =>
    const AutoDeleteExclusionStore();

@riverpod
Stream<Set<String>> autoDeleteExclusions(Ref ref) {
  final initial = ref.read(autoDeleteExclusionStoreProvider).getAll();
  return _box
      .watch()
      .map((_) => ref.read(autoDeleteExclusionStoreProvider).getAll())
      .startWith(initial);
}
