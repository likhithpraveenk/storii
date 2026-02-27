import 'dart:io';

import 'package:storii/globals.dart';

String getDeviceInfo() {
  String osDetails = '';
  String deviceDetails = '';

  if (Platform.isAndroid) {
    final info = androidDeviceInfo;
    osDetails =
        'Android version: ${info.version.release}'
        ' (SDK ${info.version.sdkInt}; build ${info.display})';
    deviceDetails =
        '''
      Device brand: ${info.brand}
      Device manufacturer: ${info.manufacturer}
      Device name: ${info.device} (${info.product})
      Device model: ${info.model}
    ''';
  }

  return '''
    App ID: ${packageInfo.packageName}
    App version: ${packageInfo.version} (${packageInfo.buildNumber})
    $osDetails
    $deviceDetails'''
      .split('\n')
      .map((line) => line.trim())
      .join('\n')
      .trim();
}
