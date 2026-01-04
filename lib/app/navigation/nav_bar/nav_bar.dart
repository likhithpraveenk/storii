import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targets = ref.watch(navTargetsProvider);
    final scheme = Theme.of(context).colorScheme;

    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: scheme.surfaceContainer,
      elevation: 2,
      labelBehavior: .alwaysShow,
      onDestinationSelected: (index) {
        if (index == currentIndex) return;
        onTap(index);
      },
      destinations: [
        for (final target in targets)
          NavigationDestination(
            icon: Icon(target.item.icon),
            label: target.item.label,
            selectedIcon: Icon(target.item.selectedIcon),
          ),
      ],
    );
  }
}
