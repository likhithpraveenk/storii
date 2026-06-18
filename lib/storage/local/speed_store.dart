import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'speed_store.g.dart';

@Riverpod(keepAlive: true)
class SpeedStore extends _$SpeedStore {
  Box<double> get _box => Hive.box<double>(speedsBox);

  @override
  void build() {}

  double? getSpeed(String libraryItemId) => _box.get(libraryItemId);

  Future<void> saveSpeed(String libraryItemId, double speed) async {
    await _box.put(libraryItemId, speed);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
