import 'dart:io';

import 'package:storii/globals.dart';

String getDeviceInfo() {
  String osDetails = '';
  String deviceDetails = '';

  if (Platform.isAndroid) {
    osDetails =
        'Android version: ${androidDeviceInfo.version.release} (SDK ${androidDeviceInfo.version.sdkInt}; build ${androidDeviceInfo.display})';
    deviceDetails =
        '''
      Device brand: ${androidDeviceInfo.brand}
      Device manufacturer: ${androidDeviceInfo.manufacturer}
      Device name: ${androidDeviceInfo.device} (${androidDeviceInfo.product})
      Device model: ${androidDeviceInfo.model}
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
