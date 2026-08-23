import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ReorderNavTabsTile extends StatelessWidget {
  const ReorderNavTabsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.settingsReorderNavTitle),
      subtitle: Text(l10n.settingsReorderNavSubtitle),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.settingsReorderNavTitle,
          body: const ReorderNavTabs(),
        );
      },
    );
  }
}

class ReorderNavTabs extends ConsumerStatefulWidget {
  const ReorderNavTabs({super.key});

  @override
  ConsumerState<ReorderNavTabs> createState() => _ReorderNavTabsState();
}

class _ReorderNavTabsState extends ConsumerState<ReorderNavTabs> {
  late List<NavTarget> _masterOrder;
  late Set<NavTarget> _activeDraft;

  @override
  void initState() {
    super.initState();
    final initiallyActive = ref.read(navTargetsProvider);
    final allPossible = NavTarget.values.toList();

    _masterOrder = [
      ...initiallyActive,
      ...allPossible.where((t) => !initiallyActive.contains(t)),
    ];

    _activeDraft = Set.from(initiallyActive);
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = _masterOrder.removeAt(oldIndex);
      _masterOrder.insert(newIndex, item);
    });
  }

  void _disable(NavTarget target) {
    if (target == .home || target == .more) return;
    setState(() => _activeDraft.remove(target));
  }

  void _enable(NavTarget target) {
    setState(() => _activeDraft.add(target));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: .circular(kRadius),
            color: scheme.surfaceContainerLowest,
            border: .all(width: 1, color: scheme.outlineVariant),
          ),
          margin: const .symmetric(horizontal: 16, vertical: 12),
          child: ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _masterOrder.length,
            onReorderItem: _onReorder,
            buildDefaultDragHandles: false,
            proxyDecorator: (child, index, animation) => Material(
              color: scheme.surfaceContainerHighest,
              borderRadius: .circular(kRadius),
              child: child,
            ),
            itemBuilder: (context, index) {
              final target = _masterOrder[index];
              final isEnabled = _activeDraft.contains(target);
              if (!isEnabled) return SizedBox.shrink(key: ValueKey(target));

              return DecoratedBox(
                key: ValueKey(target),
                decoration: BoxDecoration(borderRadius: .circular(kRadius)),
                child: ListTile(
                  contentPadding: const .symmetric(horizontal: 16, vertical: 4),
                  visualDensity: .compact,
                  leading: Icon(target.item.selectedIcon),
                  title: Text(
                    target.label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: .w600,
                      color: scheme.onSurface,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: .min,
                    children: [
                      IconButton(
                        onPressed: () => _disable(target),
                        icon: const Icon(Icons.remove_circle),
                      ),
                      const SizedBox(width: 8),
                      ReorderableDragStartListener(
                        index: index,
                        child: Icon(
                          Icons.drag_indicator_rounded,
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Wrap(
          spacing: 12,
          children: [
            ..._masterOrder
                .where((t) => !_activeDraft.contains(t))
                .map(
                  (t) => TextButton(
                    onPressed: () => _enable(t),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(t.item.icon),
                        const SizedBox(width: 4),
                        Text(t.label),
                        const SizedBox(width: 4),
                        const Icon(Icons.add_circle),
                      ],
                    ),
                  ),
                ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              onPressed: () async {
                final finalOrder = _masterOrder
                    .where((t) => _activeDraft.contains(t))
                    .toList();
                await ref
                    .read(userSettingsProvider.notifier)
                    .setNavTargets(finalOrder);
                if (context.mounted) {
                  context.pop();
                }
              },
              text: l10n.save,
            ),
          ),
        ),
      ],
    );
  }
}
