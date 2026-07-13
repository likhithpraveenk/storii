import 'package:storii/features/cast/models/cast_device_info.dart';

class CastPositionUpdate {
  const CastPositionUpdate({required this.trackUrl, required this.position});

  final String trackUrl;
  final Duration position;

  @override
  bool operator ==(Object other) =>
      other is CastPositionUpdate &&
      other.trackUrl == trackUrl &&
      other.position == position;

  @override
  int get hashCode => Object.hash(trackUrl, position);

  @override
  String toString() => 'trackUrl: $trackUrl\nposition: $position';
}

abstract class CastDeviceScanner {
  Stream<List<CastDevice>> get devices;
  void dispose();
}

abstract class CastDevice {
  String get id;
  String get name;
  String get subtitle;
  CastDeviceInfo get info;

  Future<void> setUrl(String url, {required String title});
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> seek(Duration position);

  void startPositionTracking();
  void stopPositionTracking();

  Stream<CastPositionUpdate> get positionUpdates;
}
