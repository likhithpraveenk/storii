import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        debugPrint('[PopScope]: $child');
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
          return;
        }

        final location = GoRouter.of(context).state.matchedLocation;
        debugPrint('[PopScope]: didn\'t pop "$location", going home');

        if (location == AppRoute.home.path) {
          await SystemNavigator.pop();
        } else {
          context.go(AppRoute.home.path);
        }
      },
      child: child,
    );
  }
}
