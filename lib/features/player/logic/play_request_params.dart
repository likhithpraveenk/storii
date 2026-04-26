import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/device_info_provider.dart';
import 'package:storii/shared/helpers/audio_mime_helper.dart';

part 'play_request_params.g.dart';

@Riverpod(keepAlive: true)
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
  ) = switch (device) {
    AndroidDeviceInfo d => (
      '$appName just_audio',
      d.id,
      '${d.brand} ${d.name}',
      d.manufacturer,
      d.model,
      d.version.sdkInt.toString(),
    ),
    IosDeviceInfo d => (
      '$appName just_audio',
      d.identifierForVendor ?? '',
      (d.name),
      'Apple',
      d.model,
      d.systemVersion,
    ),
    _ => ('unknown', '', '', '', '', ''),
  };

  return PlayItemRequestParams(
    mediaPlayer: mediaPlayer,
    supportedMimeTypes: AudioMimeHelper.platformSupportedMimeTypes,
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
