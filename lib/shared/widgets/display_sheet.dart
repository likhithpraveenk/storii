import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';

class DisplayBottomSheet extends ConsumerWidget {
  const new(this.screen, this.controller, {super.key});
  final CurrentScreen screen;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(screenDisplayModeProvider(screen));
    final notifier = ref.read(userSettingsProvider.notifier);

    final imageMaxSize = ref.watch(imageMaxSizeProvider);
    final stackedImagesCardMaxWidth = ref.watch(
      stackedImagesCardMaxWidthProvider,
    );
    final listViewImageSize = ref.watch(listViewImageSizeProvider);

    final List<DisplayMode> displayModes = switch (screen) {
      .library => DisplayMode.values,
      _ => [.comfortable, .listView],
    };

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
                label: Text(mode.label),
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
          const SizedBox(height: 16),
          if (currentMode == .listView)
            SettingSlider(
              title: l10n.imageSizeListTile,
              trailing: '${listViewImageSize.round()}px',
              value: listViewImageSize,
              min: 40,
              max: 120,
              labelBuilder: (value) => value.toStringAsFixed(0),
              onChangeEnd: notifier.setListViewImageSize,
              padding: .zero,
            )
          else if (screen == .series)
            SettingSlider(
              title: l10n.stackedImagesCardMaxWidth,
              trailing: '${stackedImagesCardMaxWidth.round()}px',
              value: stackedImagesCardMaxWidth,
              min: 200,
              max: 600,
              labelBuilder: (value) => value.toStringAsFixed(0),
              onChangeEnd: notifier.setStackedImagesCardMaxWidth,
              padding: .zero,
            )
          else
            SettingSlider(
              title: l10n.maxImageSize,
              trailing: '${imageMaxSize.round()}px',
              value: imageMaxSize,
              min: 80,
              max: 400,
              labelBuilder: (value) => value.toStringAsFixed(0),
              onChangeEnd: notifier.setImageMaxSize,
              padding: .zero,
            ),
        ],
      ),
    );
  }
}
