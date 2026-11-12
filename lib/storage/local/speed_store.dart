import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'speed_store.g.dart';

class SpeedStore {
  const new();

  Box<double> get _box => Hive.box(speedsBoxName);

  double? getSpeed(String libraryItemId) => _box.get(libraryItemId);

  Future<void> saveSpeed(String libraryItemId, double speed) async {
    await _box.put(libraryItemId, speed);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}

@riverpod
SpeedStore speedStore(Ref ref) => const SpeedStore();
