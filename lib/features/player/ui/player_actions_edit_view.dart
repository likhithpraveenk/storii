import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class PlayerActionsEditView extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<PlayerActionsEditView> createState() =>
      _PlayerActionsEditViewState();
}

class _PlayerActionsEditViewState extends ConsumerState<PlayerActionsEditView> {
  static const _itemSize = 48.0;

  late List<FullPlayerActions> _active;
  late List<FullPlayerActions> _inactive;

  FullPlayerActions? _dragging;
  int? _activeHoverIndex;

  @override
  void initState() {
    super.initState();
    final pinned = ref.read(pinnedPlayerActionsProvider);
    final pinnedSet = pinned.toSet();
    _active = List.of(pinned);
    _inactive = FullPlayerActions.values
        .where((a) => !pinnedSet.contains(a))
        .toList();
  }

  List<FullPlayerActions> get _previewActive {
    final d = _dragging;
    if (d == null || _activeHoverIndex == null) {
      return _active;
    }
    final preview = List.of(_active)..remove(d);
    preview.insert(_activeHoverIndex!.clamp(0, preview.length), d);
    return preview;
  }

  void _clearDrag() {
    _dragging = null;
    _activeHoverIndex = null;
  }

  void _removeEverywhere(FullPlayerActions action) {
    _active.remove(action);
    _inactive.remove(action);
  }

  void _moveToActive(FullPlayerActions action, int index) {
    setState(() {
      final wasActive = _active.contains(action);
      final oldIndex = _active.indexOf(action);
      _removeEverywhere(action);
      var target = index;
      if (wasActive && oldIndex >= 0 && oldIndex < index) target -= 1;
      _active.insert(target.clamp(0, _active.length), action);
    });
  }

  void _moveToInactive(FullPlayerActions action) {
    setState(() {
      _removeEverywhere(action);
      _inactive.add(action);
    });
  }

  void _commitActive() {
    final d = _dragging;
    if (d == null) return;
    setState(() {
      _active = _previewActive;
      _inactive.remove(d);
      _clearDrag();
    });
  }

  void _commitInactive() {
    final d = _dragging;
    if (d == null) return;
    setState(() {
      _removeEverywhere(d);
      _inactive.add(d);
      _clearDrag();
    });
  }

  Future<void> _save() async {
    final navigator = Navigator.of(context);
    await ref
        .read(userSettingsProvider.notifier)
        .setPinnedPlayerActions(_active);
    if (mounted) {
      navigator.pop();
    }
  }

  Widget _draggable(FullPlayerActions action, Widget child) {
    final scheme = Theme.of(context).colorScheme;
    return Draggable<FullPlayerActions>(
      data: action,
      maxSimultaneousDrags: 1,
      feedback: Material(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
        child: SizedBox.square(
          dimension: _itemSize,
          child: Icon(action.icon, color: scheme.onSurface),
        ),
      ),
      onDragStarted: () => setState(() {
        _dragging = action;
        _activeHoverIndex = _active.indexOf(action);
      }),
      onDragEnd: (_) => setState(_clearDrag),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final preview = _previewActive;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: .circular(kRadius),
            color: scheme.surface,
            border: .all(width: 1, color: scheme.outlineVariant),
          ),
          padding: const .symmetric(vertical: 8),
          child: DragTarget<FullPlayerActions>(
            onAcceptWithDetails: (_) => _commitActive(),
            onMove: (_) => setState(() {
              _activeHoverIndex ??= preview.length;
            }),
            builder: (context, _, _) => Row(
              mainAxisAlignment: .spaceAround,
              children: [
                ...preview.asMap().entries.map(
                  (entry) => DragTarget<FullPlayerActions>(
                    onAcceptWithDetails: (_) => _commitActive(),
                    onMove: (_) =>
                        setState(() => _activeHoverIndex = entry.key),
                    builder: (context, _, _) {
                      final action = entry.value;
                      final isPlaceholder = action == _dragging;
                      return _draggable(
                        action,
                        IconButton(
                          onPressed: isPlaceholder
                              ? null
                              : () => _moveToInactive(action),
                          icon: Icon(
                            action.icon,
                            color: isPlaceholder
                                ? scheme.primary.withValues(alpha: 0.4)
                                : scheme.onSurface,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  tooltip: l10n.more,
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
        ),
        DragTarget<FullPlayerActions>(
          onAcceptWithDetails: (_) => _commitInactive(),
          onMove: (_) => setState(() => _activeHoverIndex = null),
          builder: (_, _, _) => SizedBox(
            width: double.infinity,
            height: 100,
            child: Wrap(
              runAlignment: .center,
              alignment: .center,
              spacing: 12,
              children: [
                ..._inactive.map(
                  (a) => _draggable(
                    a,
                    IconButton(
                      onPressed: () => _moveToActive(a, _active.length),
                      icon: Icon(a.icon),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: AppFilledButton(onPressed: _save, text: l10n.save),
          ),
        ),
      ],
    );
  }
}
