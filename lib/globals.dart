import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:package_info_plus/package_info_plus.dart';

final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ShellRoute');
final shellScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'ShellScaffold');
late final PackageInfo packageInfo;
late final AndroidDeviceInfo androidDeviceInfo;
late final HiveCacheStore dioCacheStore;
