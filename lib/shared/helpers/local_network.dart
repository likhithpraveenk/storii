import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';

typedef HostLookup = Future<List<InternetAddress>> Function(String host);

extension UriLocalX on Uri {
  /// Literal check only: true when the host itself is a loopback/private
  /// address, an mDNS name or a bare (dotless) hostname. A regular domain
  /// name can still point at a LAN address; use [resolvesToLocalNetwork].
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

extension InternetAddressLocalX on InternetAddress {
  bool get isLocal {
    if (isLoopback || isLinkLocal) return true;

    final b = rawAddress;
    if (type == .IPv4) {
      if (b.length < 4) return false;
      if (b[0] == 10) return true;
      if (b[0] == 172 && b[1] >= 16 && b[1] <= 31) return true;
      if (b[0] == 192 && b[1] == 168) return true;
    }

    if (type == .IPv6) {
      if (b.length < 16) return false;
      // Unique local addresses fc00::/7.
      if ((b[0] & 0xfe) == 0xfc) return true;
      // IPv4-mapped (::ffff:a.b.c.d).
      final isMapped =
          b.sublist(0, 10).every((x) => x == 0) &&
          b[10] == 0xff &&
          b[11] == 0xff;
      if (isMapped) {
        return InternetAddress.fromRawAddress(b.sublist(12)).isLocal;
      }
    }

    return false;
  }
}

/// Whether connecting to [uri] would reach the local network, based on the
/// addresses its host resolves to right now. A split-horizon domain (LAN IP
/// at home, public IP elsewhere) is local only while on the home network.
Future<bool> resolvesToLocalNetwork(Uri uri, {HostLookup? lookup}) async {
  if (uri.isLocal) return true;
  final host = uri.host;
  if (host.isEmpty || InternetAddress.tryParse(host) != null) return false;

  try {
    final addresses = await (lookup ?? InternetAddress.lookup)(host)
        .timeout(const Duration(seconds: 3));
    return addresses.any((a) => a.isLocal);
  } catch (_) {
    return false;
  }
}

int? _sdkInt;
Future<bool>? _pendingRequest;
bool _deniedNoticeShown = false;

Future<bool> _needsLocalNetworkPermission() async {
  if (!Platform.isAndroid) return false;
  try {
    _sdkInt ??= (await DeviceInfoPlugin().androidInfo).version.sdkInt;
  } catch (_) {
    return false;
  }
  return _sdkInt! >= 37;
}

/// Makes sure Android 17+ local network access is granted when [uri]
/// currently resolves to a LAN address. Asks only while the app is in the
/// foreground; if the permission was permanently denied, shows a snackbar
/// (once per app run) that opens the app settings.
Future<bool> ensureLocalNetworkAccess(Uri uri) async {
  if (!await _needsLocalNetworkPermission()) return true;
  if (await Permission.accessLocalNetwork.isGranted) return true;
  if (!await resolvesToLocalNetwork(uri)) return true;

  return _pendingRequest ??= _requestLocalNetworkAccess(uri)
      .whenComplete(() => _pendingRequest = null);
}

Future<bool> _requestLocalNetworkAccess(Uri uri) async {
  var status = await Permission.accessLocalNetwork.status;
  final inForeground =
      WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;

  if (!status.isPermanentlyDenied && inForeground) {
    LogService.log(
      'requesting local network access for ${uri.host}',
      level: .info,
    );
    status = await Permission.accessLocalNetwork.request();
  }
  if (status.isGranted) return true;

  LogService.log(
    'local network access not granted ($status) for ${uri.host}',
    level: .warning,
  );
  if (status.isPermanentlyDenied && inForeground) _showDeniedNotice();
  return false;
}

void _showDeniedNotice() {
  if (_deniedNoticeShown) return;
  final messenger = globalMessengerKey.currentState;
  if (messenger == null) return;
  _deniedNoticeShown = true;
  messenger.showSnackBar(
    SnackBar(
      backgroundColor: _deniedNoticeColor,
      duration: const Duration(seconds: 10),
      // Message on the full width, settings button on its own row below.
      content: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            l10n.localNetworkAccessDenied,
            style: const TextStyle(color: Colors.white),
          ),
          Align(
            alignment: .centerRight,
            child: TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                messenger.hideCurrentSnackBar();
                unawaited(openAppSettings());
              },
              child: Text(l10n.openSettings),
            ),
          ),
        ],
      ),
    ),
  );
}

const _deniedNoticeColor = Color(0xFFDB294D);
