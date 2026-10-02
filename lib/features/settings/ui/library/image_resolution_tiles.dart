import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

const _listMin = 100;
const _listMax = 500;
const _coverMin = 300;
const _coverMax = 1000;

class ImageResolutionListTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.photo_outlined),
      title: Text(l10n.imageResolution),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.imageResolution,
          body: const _ImageResolutionTiles(),
        );
      },
    );
  }
}

class _ImageResolutionTiles extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listViewQuality = ref.watch(imageResolutionListViewProvider);
    final gridViewQuality = ref.watch(imageResolutionGridViewProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Column(
      children: [
        SettingSlider(
          title: l10n.imageResolutionGridView,
          trailing: '${gridViewQuality}px',
          value: gridViewQuality.toDouble(),
          min: _coverMin.toDouble(),
          max: _coverMax.toDouble(),
          divisions: (_coverMax - _coverMin) ~/ 100,
          labelBuilder: (value) => value.toStringAsFixed(0),
          onChangeEnd: (value) =>
              notifier.setImageResolutionGridView(value.round()),
        ),
        SettingSlider(
          title: l10n.imageResolutionListView,
          trailing: '${listViewQuality}px',
          value: listViewQuality.toDouble(),
          min: _listMin.toDouble(),
          max: _listMax.toDouble(),
          divisions: (_listMax - _listMin) ~/ 50,
          labelBuilder: (value) => value.toStringAsFixed(0),
          onChangeEnd: (value) =>
              notifier.setImageResolutionListView(value.round()),
        ),
      ],
    );
  }
}
