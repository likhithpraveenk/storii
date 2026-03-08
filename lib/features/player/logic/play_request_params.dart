import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/device_info_provider.dart';

part 'play_request_params.g.dart';

@riverpod
Future<PlayItemRequestParams> playRequestParams(Ref ref) async {
  final package = await ref.watch(packageInfoProvider.future);
  final device = await ref.watch(deviceInfoProvider.future);

  final (
    mediaPlayer,
    deviceId,
    deviceName,
    manufacturer,
    model,
    sdkVersion,
    mimeTypes,
  ) = switch (device) {
    AndroidDeviceInfo d => (
      'ExoPlayer',
      d.id,
      '${d.brand} ${d.name}',
      d.manufacturer,
      d.model,
      d.version.sdkInt.toString(),
      _androidSupportedMimeTypes,
    ),
    _ => ('unknown', '', '', '', '', '', <String>[]),
  };

  return PlayItemRequestParams(
    mediaPlayer: mediaPlayer,
    supportedMimeTypes: mimeTypes,
    deviceInfo: ClientDeviceInfo(
      clientName: 'storii',
      clientVersion: package.version,
      deviceId: deviceId,
      deviceName: deviceName,
      manufacturer: manufacturer,
      model: model,
      sdkVersion: sdkVersion,
    ),
  );
}

const _androidSupportedMimeTypes = [
  'audio/mpeg',
  'audio/aac',
  'audio/mp4',
  'audio/flac',
  'audio/x-flac',
  'audio/ogg',
  'audio/opus',
  'audio/wav',
  'audio/x-wav',
  'application/x-mpegURL',
  'application/dash+xml',
];
