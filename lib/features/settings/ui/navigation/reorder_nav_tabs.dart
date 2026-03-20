import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ReorderNavTabsTile extends StatelessWidget {
  const ReorderNavTabsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return ListTile(
      leading: const Icon(Icons.swap_vert),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l.settingsReorderNavTitle),
      subtitle: Text(l.settingsReorderNavSubtitle),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l.settingsReorderNavTitle,
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
      if (oldIndex < newIndex) newIndex -= 1;
      final item = _masterOrder.removeAt(oldIndex);
      _masterOrder.insert(newIndex, item);
    });
  }

  void _onToggle(NavTarget target, bool isEnabled) {
    if (target == .home || target == .more) return;
    setState(() {
      if (isEnabled) {
        _activeDraft.add(target);
      } else if (_activeDraft.length > 2) {
        _activeDraft.remove(target);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const .symmetric(horizontal: 16, vertical: 12),
          itemCount: _masterOrder.length,
          onReorder: _onReorder,
          proxyDecorator: (child, index, animation) =>
              Material(type: .transparency, child: child),
          itemBuilder: (context, index) {
            final target = _masterOrder[index];
            final isEnabled = _activeDraft.contains(target);

            return Container(
              key: ValueKey(target),
              margin: const .only(bottom: 12),
              decoration: BoxDecoration(
                color: isEnabled
                    ? scheme.surfaceContainerHighest.withValues(alpha: 0.5)
                    : scheme.surface.withValues(alpha: 0.3),
                borderRadius: .circular(kRadius),
                border: Border.all(
                  color: isEnabled
                      ? scheme.outlineVariant.withValues(alpha: 0.5)
                      : Colors.transparent,
                ),
              ),
              child: ListTile(
                contentPadding: const .symmetric(horizontal: 16, vertical: 4),
                title: Text(
                  target.label(context),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: .w600,
                    color: isEnabled
                        ? scheme.onSurface
                        : scheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: .min,
                  children: [
                    Switch.adaptive(
                      value: isEnabled,
                      activeTrackColor: scheme.primary,
                      onChanged: (value) => _onToggle(target, value),
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
        const SizedBox(height: 16),
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
              text: l.save,
            ),
          ),
        ),
      ],
    );
  }
}
