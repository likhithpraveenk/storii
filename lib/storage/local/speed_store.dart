import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'speed_store.g.dart';

@Riverpod(keepAlive: true)
class SpeedStore extends _$SpeedStore {
  @override
  void build() {}

  double? getSpeed(String libraryItemId) => speedsBox.get(libraryItemId);

  Future<void> saveSpeed(String libraryItemId, double speed) async {
    await speedsBox.put(libraryItemId, speed);
  }

  Future<void> clear() async {
    await speedsBox.clear();
  }
}
