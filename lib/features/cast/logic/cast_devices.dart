import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/cast/logic/dlna/dlna_device_scanner.dart';
import 'package:storii/features/cast/models/cast_device.dart';

part 'cast_devices.g.dart';

@riverpod
CastDeviceScanner castDeviceScanner(Ref ref) {
  final dlnaScanner = DlnaDeviceScanner();
  ref.onDispose(dlnaScanner.dispose);

  // extend for other casts

  return dlnaScanner;
}

@riverpod
class CastDevices extends _$CastDevices {
  @override
  Stream<List<CastDevice>> build() {
    final scanner = ref.watch(castDeviceScannerProvider);
    return scanner.devices;
  }

  void refresh() => ref.invalidateSelf();
}
