import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/settings/logic/storage/hive_box_specs.dart';
import 'package:storii/features/settings/logic/storage/hive_storage_service.dart';

part 'hive_storage_provider.g.dart';

@immutable
class HiveBoxEntry {
  const new({required this.spec, required this.stats});

  final HiveBoxSpec spec;
  final HiveBoxStats stats;
}

@riverpod
HiveStorageService hiveStorageService(Ref ref) => const HiveStorageService();

@riverpod
class HiveStorage extends _$HiveStorage {
  @override
  List<HiveBoxEntry> build() {
    final service = ref.watch(hiveStorageServiceProvider);
    return [
      for (final spec in hiveBoxSpecs)
        HiveBoxEntry(spec: spec, stats: service.stats(spec.name)),
    ];
  }

  void refresh() => state = _snapshot();

  Future<void> compactAll() async {
    final service = ref.read(hiveStorageServiceProvider);
    for (final spec in hiveBoxSpecs) {
      await service.compact(spec.name);
    }
    refresh();
  }

  Future<void> reset(HiveBoxSpec spec) async {
    if (!spec.canReset) return;
    await ref.read(hiveStorageServiceProvider).clear(spec.name);
    refresh();
  }

  List<HiveBoxEntry> _snapshot() => [
    for (final spec in hiveBoxSpecs)
      HiveBoxEntry(
        spec: spec,
        stats: ref.read(hiveStorageServiceProvider).stats(spec.name),
      ),
  ];
}
