import 'dart:async';

import 'package:dlna_dart/dlna.dart';
import 'package:storii/features/cast/logic/dlna/dlna_cast_device.dart';
import 'package:storii/features/cast/models/cast_device.dart';

class DlnaDeviceScanner implements CastDeviceScanner {
  DlnaDeviceScanner() {
    _deviceMapStream = _buildStream();
  }

  final _searcher = DLNAManager();
  late final Stream<Map<String, CastDevice>> _deviceMapStream;

  Stream<Map<String, CastDevice>> _buildStream() async* {
    final manager = await _searcher.start();
    yield _filter(manager.deviceList);
    yield* manager.devices.stream.map(_filter);
  }

  Map<String, CastDevice> _filter(Map<String, DLNADevice> devices) => {
    for (final entry in devices.entries)
      if (isRenderer(entry.value)) entry.key: DlnaCastDevice(entry.value),
  };

  @override
  Stream<List<CastDevice>> get devices =>
      _deviceMapStream.map((map) => map.values.toList());

  @override
  void dispose() => _searcher.stop();
}

bool isRenderer(DLNADevice device) {
  return device.info.serviceList.any((service) {
    final serviceId = service is Map ? service['serviceId'] as String? : null;
    return serviceId?.contains('AVTransport') ?? false;
  });
}
