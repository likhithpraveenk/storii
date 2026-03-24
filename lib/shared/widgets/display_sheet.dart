import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';

class DisplayBottomSheet extends ConsumerWidget {
  const DisplayBottomSheet(this.screen, this.controller, {super.key});
  final CurrentScreen screen;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(libraryFiltersProvider(screen));
    final notifier = ref.read(libraryFiltersProvider(screen).notifier);

    final List<DisplayMode> displayModes = switch (screen) {
      .library => [.comfortable, .compact, .coverOnly, .listView],
      _ => [.comfortable, .listView],
    };

    final l10n = AppLocalizations.of(context)!;
    final DisplayMode currentMode = !filterState.isGridView
        ? .listView
        : !filterState.showTitle
        ? .coverOnly
        : filterState.stackTitle
        ? .compact
        : .comfortable;

    return SingleChildScrollView(
      padding: const .fromLTRB(24, 24, 24, 0),
      controller: controller,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Text(l10n.displayMode, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: displayModes.map((mode) {
              return ChoiceChip(
                label: Text(switch (mode) {
                  .coverOnly => l10n.coverOnly,
                  .compact => l10n.compact,
                  .comfortable => l10n.comfortable,
                  .listView => l10n.listView,
                }),
                selected: currentMode == mode,
                onSelected: (selected) {
                  if (selected) notifier.setDisplayMode(mode);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
