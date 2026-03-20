import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';

class NavBar extends ConsumerWidget {
  const NavBar({required this.currentIndex, required this.onTap, super.key});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targets = ref.watch(navTargetsProvider);
    final scheme = Theme.of(context).colorScheme;
    final labelBehavior = ref.watch(navLabelBehaviorProvider);

    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: scheme.surfaceContainer,
      elevation: 2,
      labelBehavior: labelBehavior,
      onDestinationSelected: (index) {
        if (index == currentIndex) return;
        onTap(index);
      },
      destinations: [
        for (final target in targets)
          NavigationDestination(
            icon: Icon(target.item.icon),
            label: target.label(context),
            selectedIcon: Icon(target.item.selectedIcon),
          ),
      ],
    );
  }
}
