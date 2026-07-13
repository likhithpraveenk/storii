import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class MoreActionsSheet extends ConsumerStatefulWidget {
  const MoreActionsSheet({
    required this.remaining,
    required this.session,
    super.key,
  });

  final List<FullPlayerActions> remaining;
  final PlaybackSession session;

  @override
  ConsumerState<MoreActionsSheet> createState() => _MoreActionsSheetState();
}

class _MoreActionsSheetState extends ConsumerState<MoreActionsSheet> {
  var _editMode = false;
  late List<FullPlayerActions> _masterOrder;
  late Set<FullPlayerActions> _pinnedDraft;

  @override
  void initState() {
    super.initState();
    final initiallyPinned = ref.read(pinnedPlayerActionsProvider);
    final allActions = FullPlayerActions.values.toList();

    _masterOrder = [
      ...initiallyPinned,
      ...allActions.where((a) => !initiallyPinned.contains(a)),
    ];
    _pinnedDraft = Set.from(initiallyPinned);
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = _masterOrder.removeAt(oldIndex);
      _masterOrder.insert(newIndex, item);
    });
  }

  void _onToggle(FullPlayerActions action, bool isEnabled) {
    setState(() {
      if (isEnabled) {
        _pinnedDraft.add(action);
      } else if (_pinnedDraft.length > 1) {
        _pinnedDraft.remove(action);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: bottomSheetDecoration(context),
      child: Column(
        mainAxisSize: .min,
        children: [
          Padding(
            padding: const .all(16),
            child: Stack(
              alignment: .center,
              children: [
                Align(
                  alignment: .center,
                  child: Text(
                    l10n.more,
                    style: bottomSheetTitleTextStyle(context),
                  ),
                ),
                Align(
                  alignment: .centerRight,
                  child: IconButton(
                    tooltip: _editMode ? l10n.cancel : l10n.edit,
                    onPressed: () {
                      setState(() => _editMode = !_editMode);
                    },
                    icon: Icon(_editMode ? Icons.cancel : Icons.edit),
                  ),
                ),
              ],
            ),
          ),
          if (!_editMode) ...[
            if (widget.remaining.isEmpty) const EmptyState(),
            ...widget.remaining
                .map((a) => a.widget(context, widget.session, inOverflow: true))
                .whereType<Widget>(),
          ],
          if (_editMode) ...[
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const .symmetric(horizontal: 16, vertical: 12),
              itemCount: _masterOrder.length,
              onReorderItem: _onReorder,
              buildDefaultDragHandles: false,
              proxyDecorator: (child, index, animation) =>
                  Material(type: .transparency, child: child),
              itemBuilder: (context, index) {
                final action = _masterOrder[index];
                final isEnabled = _pinnedDraft.contains(action);

                return Container(
                  key: ValueKey(action),
                  margin: const .only(bottom: 8),
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
                    contentPadding: const .symmetric(horizontal: 16),
                    title: Text(
                      action.label,
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
                          onChanged: (value) => _onToggle(action, value),
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
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const .symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  onPressed: () async {
                    final finalOrder = _masterOrder
                        .where((a) => _pinnedDraft.contains(a))
                        .toList();
                    await ref
                        .read(userSettingsProvider.notifier)
                        .setPinnedPlayerActions(finalOrder);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  text: l10n.save,
                ),
              ),
            ),
          ],
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
