import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'auto_delete_exclusion_store.g.dart';

class AutoDeleteExclusionStore {
  const new();

  Set<String> getAll() =>
      autoDeleteExclusionBox.keys.whereType<String>().toSet();

  bool contains(String mediaItemKey) =>
      autoDeleteExclusionBox.containsKey(mediaItemKey);

  Future<void> add(String mediaItemKey) =>
      autoDeleteExclusionBox.put(mediaItemKey, true);

  Future<void> remove(String mediaItemKey) =>
      autoDeleteExclusionBox.delete(mediaItemKey);
}

@riverpod
AutoDeleteExclusionStore autoDeleteExclusionStore(Ref ref) =>
    const AutoDeleteExclusionStore();

@riverpod
Stream<Set<String>> autoDeleteExclusions(Ref ref) {
  final initial = ref.read(autoDeleteExclusionStoreProvider).getAll();
  return autoDeleteExclusionBox
      .watch()
      .map((_) => ref.read(autoDeleteExclusionStoreProvider).getAll())
      .startWith(initial);
}
