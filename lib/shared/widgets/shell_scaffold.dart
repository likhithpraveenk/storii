import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/ui/player_screen.dart';
import 'package:storii/globals.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ShellScaffold extends ConsumerWidget {
  const ShellScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerState = GoRouter.of(context).state;
    final path = routerState.matchedLocation;

    final navTargets = ref.watch(navTargetsProvider);
    final target = navTargets.firstWhereOrNull(
      (t) => t.item.route.path == path,
    );

    return PopScope(
      canPop: path == AppRoute.home.path,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
          return;
        }

        context.go(AppRoute.home.path);
      },
      child: Scaffold(
        key: shellScaffoldKey,
        bottomNavigationBar: Column(
          mainAxisSize: .min,
          children: [
            const PlayerScreen(),
            _ShellBottomBar(target: target, navTargets: navTargets),
          ],
        ),
        body: child,
      ),
    );
  }
}

final lastNavIndexProvider = StateProvider<int>((ref) => 0);

class _ShellBottomBar extends ConsumerWidget {
  const _ShellBottomBar({required this.target, required this.navTargets});

  final NavTarget? target;
  final List<NavTarget> navTargets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factor = ref.watch(playerExpandFactorProvider);

    if (target != null) {
      final index = navTargets.indexOf(target!);
      Future.microtask(
        () => ref.read(lastNavIndexProvider.notifier).state = index,
      );
    }
    final displayIndex = ref.watch(lastNavIndexProvider);

    if (factor >= 0.4) return const SizedBox.shrink();

    final isTargetNull = target == null;
    final factorVisibility = (1.0 - (factor / 0.3)).clamp(0.0, 1.0);
    final targetHeightFactor = isTargetNull ? 0.0 : factorVisibility;

    return AnimatedAlign(
      alignment: .topCenter,
      heightFactor: targetHeightFactor,
      duration: (factor > 0)
          ? Duration.zero
          : const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: isTargetNull ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: RepaintBoundary(
          child: NavBar(
            currentIndex: displayIndex,
            onTap: (i) => context.go(navTargets[i].item.route.path),
          ),
        ),
      ),
    );
  }
}
