import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

extension UriLocalX on Uri {
  bool get isLocal {
    final host = this.host.toLowerCase();
    if (host.isEmpty) return false;
    if (host == 'localhost' || host == '::1') return true;
    if (host.endsWith('.local')) return true;

    final ip = InternetAddress.tryParse(host);
    if (ip != null) return ip.isLocal;

    if (!host.contains('.')) return true;

    return false;
  }
}

extension on InternetAddress {
  bool get isLocal {
    if (isLoopback || isLinkLocal) return true;

    if (type == .IPv4) {
      final b = rawAddress;
      if (b.length < 4) return false;
      if (b[0] == 10) return true;
      if (b[0] == 172 && b[1] >= 16 && b[1] <= 31) return true;
      if (b[0] == 192 && b[1] == 168) return true;
    }

    return false;
  }
}

Future<bool> ensureLocalNetworkAccess(Uri uri) async {
  if (!Platform.isAndroid) return true;
  if (!uri.isLocal) return true;

  try {
    final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
    if (sdkInt < 37) return true;
  } catch (_) {}

  final status = await Permission.accessLocalNetwork.status;
  if (status.isGranted) return true;

  final result = await Permission.accessLocalNetwork.request();
  return result.isGranted;
}
