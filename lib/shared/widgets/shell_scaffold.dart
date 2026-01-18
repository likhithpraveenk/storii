import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
import 'package:storii/shared/widgets/shell_app_bar.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold(this.child, this.navTargets, {super.key});

  final Widget child;
  final List<NavTarget> navTargets;

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final target = navTargets.firstWhere(
      (t) => t.item.route.path == state.matchedLocation,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (state.matchedLocation != AppRoute.home.path) {
          context.go(AppRoute.home.path);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: ShellAppBar(target),
        bottomNavigationBar: NavBar(
          currentIndex: navTargets.indexOf(target),
          onTap: (i) => context.go(navTargets[i].item.route.path),
        ),
        body: Stack(
          children: [
            child,
            // const Positioned(left: 0, right: 0, bottom: 0, child: Player()),
          ],
        ),
      ),
    );
  }
}
