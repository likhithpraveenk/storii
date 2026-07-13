import 'package:dlna_dart/dlna.dart';
import 'package:dlna_dart/xmlParser.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/cast/models/cast_device.dart';
import 'package:storii/features/cast/models/cast_device_info.dart';
import 'package:storii/shared/helpers/extensions.dart';

class DlnaCastDevice implements CastDevice {
  DlnaCastDevice(this._device);

  final DLNADevice _device;

  @override
  String get id => _device.info.URLBase;

  @override
  String get name => _device.info.friendlyName;

  @override
  String get subtitle => _device.info.URLBase;

  @override
  CastDeviceInfo get info =>
      CastDeviceInfo.dlna(id: id, name: name, subtitle: subtitle);

  @override
  Future<void> setUrl(String url, {required String title}) =>
      _device.setUrl(url, title: title, type: AudioMime.any);

  @override
  Future<void> play() => _device.play();

  @override
  Future<void> pause() => _device.pause();

  @override
  Future<void> stop() => _device.stop();

  @override
  Future<void> seek(Duration position) =>
      _device.seek(position.toTime(padHours: true));

  @override
  void startPositionTracking() => _device.positionPoller.start();

  @override
  void stopPositionTracking() => _device.positionPoller.stop();

  @override
  Stream<CastPositionUpdate> get positionUpdates => _device.currPosition.stream
      .map(
        (info) => CastPositionUpdate(
          trackUrl: info.TrackURI,
          position: Duration(seconds: info.RelTimeInt),
        ),
      )
      .throttleTime(const Duration(seconds: 1))
      .distinct();

  @override
  String toString() => 'id: $id\nname: $name\nsubtitle: $subtitle';
}
