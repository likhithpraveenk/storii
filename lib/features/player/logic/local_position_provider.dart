import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'local_position_provider.g.dart';

@riverpod
class LocalPositionNotifier extends _$LocalPositionNotifier {
  late Box<Duration> _box;

  @override
  Duration? build(String sessionId) {
    _box = Hive.box(localPositionBox);

    return _box.get(sessionId);
  }

  Future<void> save(Duration position) async {
    state = position;
    await _box.put(sessionId, position);
  }

  Future<void> clear() async {
    state = null;
    await _box.delete(sessionId);
  }
}
