import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
final shellNavigatorKey = GlobalKey<StatefulNavigationShellState>(
  debugLabel: 'StatefulShellRoute',
);
final shellScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'ShellScaffold');
late final PackageInfo packageInfo;
late final AndroidDeviceInfo androidDeviceInfo;
