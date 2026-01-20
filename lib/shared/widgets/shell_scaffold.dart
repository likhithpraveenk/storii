import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/player.dart';
import 'package:storii/features/player/ui/player_screen.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ShellScaffold extends ConsumerWidget {
  const ShellScaffold(
    this.navigationShell, {
    super.key,
    required this.controller,
  });

  final StatefulNavigationShell navigationShell;
  final PlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTargets = ref.watch(navTargetsProvider);
    final path = GoRouter.of(context).state.matchedLocation;
    final target = navTargets.firstWhereOrNull(
      (t) => t.item.route.path == path,
    );

    final isPlayerFull = controller.state == .full;
    final showNav = target != null && !isPlayerFull;

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Column(
          mainAxisSize: .min,
          children: [
            const PlayerScreen(),
            _ShellBottomBar(
              showNav: showNav,
              target: target,
              navTargets: navTargets,
              factorListenable: controller.factorListenable,
            ),
          ],
        ),
        body: navigationShell,
      ),
    );
  }
}

class _ShellBottomBar extends StatelessWidget {
  const _ShellBottomBar({
    required this.showNav,
    required this.target,
    required this.navTargets,
    this.factorListenable,
  });

  final bool showNav;
  final NavTarget? target;
  final List<NavTarget> navTargets;
  final ValueListenable<double>? factorListenable;

  @override
  Widget build(BuildContext context) {
    if (factorListenable == null) {
      return AnimatedAlign(
        duration: const Duration(milliseconds: 200),
        heightFactor: showNav ? 1.0 : 0.0,
        alignment: .topCenter,
        child: _AnimatedNavBar(target: target, navTargets: navTargets),
      );
    }

    return ValueListenableBuilder<double>(
      valueListenable: factorListenable!,
      builder: (context, factor, child) {
        if (!showNav || factor >= 0.2) {
          return const SizedBox.shrink();
        }

        final f = factor.clamp(0.0, 0.2);

        return ClipRect(
          child: Align(
            alignment: .topCenter,
            heightFactor: (1.0 - (f / 0.2)).clamp(0.0, 1.0),
            child: FractionalTranslation(
              translation: Offset(0, f),
              child: child,
            ),
          ),
        );
      },
      child: _AnimatedNavBar(target: target, navTargets: navTargets),
    );
  }
}

class _AnimatedNavBar extends StatelessWidget {
  const _AnimatedNavBar({required this.target, required this.navTargets});

  final NavTarget? target;
  final List<NavTarget> navTargets;

  @override
  Widget build(BuildContext context) {
    final visible = target != null;

    return AnimatedSlide(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      offset: visible ? Offset.zero : const Offset(0, 1),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: visible ? 1 : 0,
        child: IgnorePointer(
          ignoring: !visible,
          child: NavBar(
            currentIndex: visible ? navTargets.indexOf(target!) : 0,
            onTap: (i) => context.go(navTargets[i].item.route.path),
          ),
        ),
      ),
    );
  }
}
