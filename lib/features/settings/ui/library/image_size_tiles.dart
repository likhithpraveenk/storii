import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class ImageSizeListTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.photo_size_select_large),
      title: Text(l10n.coverImageSizes),
      onTap: () => AppBottomSheet.show(
        context,
        title: l10n.coverImageSizes,
        body: const _ImageSizeTiles(),
      ),
    );
  }
}

class _ImageSizeTiles extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width - 32; //* padding
    final imageMaxSize = ref.watch(imageMaxSizeProvider);
    final stackedImagesCardMaxWidth = ref.watch(
      stackedImagesCardMaxWidthProvider,
    );
    final listViewImageSize = ref.watch(listViewImageSizeProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    final imagePercent = (imageMaxSize * 100 / screenWidth).toStringAsFixed(1);
    final stackImagePercent = (stackedImagesCardMaxWidth * 100 / screenWidth)
        .toStringAsFixed(1);

    return Column(
      children: [
        SettingSlider(
          title: l10n.maxImageSize,
          trailing: '${imageMaxSize.round()}px',
          subtitle: l10n.percentOfScreenWidth(imagePercent),
          value: imageMaxSize,
          min: 80,
          max: 400,
          labelBuilder: (value) => value.toStringAsFixed(0),
          onChangeEnd: notifier.setImageMaxSize,
          padding: const .fromLTRB(16, 0, 16, 0),
        ),
        _PresetChips(
          currentValue: imageMaxSize,
          min: 80,
          max: 400,
          screenWidth: screenWidth,
          percents: const [0.25, 0.33, 0.5],
          onSelected: notifier.setImageMaxSize,
        ),
        SettingSlider(
          title: l10n.stackedImagesCardMaxWidth,
          subtitle: l10n.percentOfScreenWidth(stackImagePercent),
          trailing: '${stackedImagesCardMaxWidth.round()}px',
          value: stackedImagesCardMaxWidth,
          min: 200,
          max: 600,
          labelBuilder: (value) => value.toStringAsFixed(0),
          onChangeEnd: notifier.setStackedImagesCardMaxWidth,
          padding: const .fromLTRB(16, 12, 16, 0),
        ),
        _PresetChips(
          currentValue: stackedImagesCardMaxWidth,
          min: 200,
          max: 600,
          screenWidth: screenWidth,
          percents: const [0.5, 0.75, 1.0],
          onSelected: notifier.setStackedImagesCardMaxWidth,
        ),
        SettingSlider(
          title: l10n.imageSizeListTile,
          trailing: '${listViewImageSize.round()}px',
          value: listViewImageSize,
          min: 40,
          max: 120,
          labelBuilder: (value) => value.toStringAsFixed(0),
          onChangeEnd: notifier.setListViewImageSize,
        ),
      ],
    );
  }
}

class _PresetChips extends StatelessWidget {
  const new({
    required this.currentValue,
    required this.min,
    required this.max,
    required this.screenWidth,
    required this.percents,
    required this.onSelected,
  });

  final double currentValue;
  final double min;
  final double max;
  final double screenWidth;
  final List<double> percents;
  final void Function(double) onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: .center,
      children: percents.map((percent) {
        final presetValue = screenWidth * percent;
        return ChoiceChip(
          label: Text('${(percent * 100).toInt()}%'),
          selected: currentValue == presetValue,
          onSelected: (selected) {
            if (selected) onSelected(presetValue.clamp(min, max));
          },
        );
      }).toList(),
    );
  }
}
