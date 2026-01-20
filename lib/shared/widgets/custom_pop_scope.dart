import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/player/ui/player.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({
    super.key,
    required this.child,
    required this.controller,
  });

  final Widget child;
  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (controller.state == .full) {
          controller.toMini();
          return;
        }

        if (GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
          return;
        }

        final location = GoRouter.of(context).state.matchedLocation;
        if (location == AppRoute.home.path) {
          SystemNavigator.pop();
        } else {
          GoRouter.of(context).go(AppRoute.home.path);
        }
      },
      child: child,
    );
  }
}
