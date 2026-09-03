import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class ReorderHomeShelvesTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.settingsHomeShelvesTitle),
      subtitle: Text(l10n.settingsHomeShelvesSubtitle),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.settingsHomeShelvesTitle,
          body: const _ReorderHomeShelves(),
        );
      },
    );
  }
}

class _ReorderHomeShelves extends ConsumerStatefulWidget {
  const new();

  @override
  ConsumerState<_ReorderHomeShelves> createState() =>
      _ReorderHomeShelvesState();
}

class _ReorderHomeShelvesState extends ConsumerState<_ReorderHomeShelves> {
  late List<ShelfIdentity> _masterOrder;
  late Set<ShelfIdentity> _activeDraft;

  @override
  void initState() {
    super.initState();
    final initiallyActive = ref.read(homeShelvesProvider);
    final allPossible = ShelfIdentity.values.toList();

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

  void _disable(ShelfIdentity identity) {
    setState(() => _activeDraft.remove(identity));
  }

  void _enable(ShelfIdentity identity) {
    setState(() => _activeDraft.add(identity));
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
          child: Builder(
            builder: (context) {
              if (_activeDraft.isEmpty) {
                return const SizedBox(
                  height: 120,
                  child: Center(child: EmptyState()),
                );
              }

              return ReorderableListView.builder(
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
                  final identity = _masterOrder[index];
                  final isEnabled = _activeDraft.contains(identity);
                  if (!isEnabled) {
                    return SizedBox.shrink(key: ValueKey(identity));
                  }

                  return DecoratedBox(
                    key: ValueKey(identity),
                    decoration: BoxDecoration(borderRadius: .circular(kRadius)),
                    child: ListTile(
                      contentPadding: const .symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      visualDensity: .compact,
                      title: Text(identity.label),
                      trailing: Row(
                        mainAxisSize: .min,
                        children: [
                          IconButton(
                            onPressed: () => _disable(identity),
                            icon: const Icon(Icons.remove_circle),
                          ),
                          const SizedBox(width: 8),
                          ReorderableDragStartListener(
                            index: index,
                            child: Icon(
                              Icons.drag_indicator_rounded,
                              color: scheme.onSurfaceVariant.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                    .setHomeShelves(finalOrder);
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
