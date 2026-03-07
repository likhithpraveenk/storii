import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';

class DisplayButton extends ConsumerWidget {
  const DisplayButton(this.screen, {super.key});

  final CurrentScreen screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.grid_view),
      onPressed: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => _DisplayBottomSheet(screen),
        );
      },
    );
  }
}

class _DisplayBottomSheet extends ConsumerWidget {
  const _DisplayBottomSheet(this.screen);
  final CurrentScreen screen;

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

    return DraggableScrollableSheet(
      minChildSize: 0.1,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const .fromLTRB(16, 12, 16, 8),
              child: Text(
                AppLocalizations.of(context)!.display,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    l10n.displayMode,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
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
            ),
          ],
        );
      },
    );
  }
}
