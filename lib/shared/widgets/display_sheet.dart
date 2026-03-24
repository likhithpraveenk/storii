import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';

class DisplayBottomSheet extends ConsumerWidget {
  const DisplayBottomSheet(this.screen, this.controller, {super.key});
  final CurrentScreen screen;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(screenDisplayModeProvider(screen));
    final notifier = ref.read(userSettingsProvider.notifier);

    final List<DisplayMode> displayModes = switch (screen) {
      .library => [.comfortable, .compact, .coverOnly, .listView],
      _ => [.comfortable, .listView],
    };

    final l = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const .fromLTRB(24, 24, 24, 0),
      controller: controller,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Text(l.displayMode, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: displayModes.map((mode) {
              return ChoiceChip(
                label: Text(switch (mode) {
                  .coverOnly => l.coverOnly,
                  .compact => l.compact,
                  .comfortable => l.comfortable,
                  .listView => l.listView,
                }),
                selected: currentMode == mode,
                onSelected: (selected) {
                  if (selected) {
                    switch (screen) {
                      case .library:
                        notifier.setLibraryDisplayMode(mode);
                      case .series:
                        notifier.setSeriesDisplayMode(mode);
                      case .authors:
                        notifier.setAuthorDisplayMode(mode);
                    }
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
