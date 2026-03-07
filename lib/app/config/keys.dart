import 'package:flutter/material.dart';

final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ShellRoute');
final shellScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'ShellScaffold');
