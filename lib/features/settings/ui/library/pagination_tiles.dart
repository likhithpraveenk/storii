import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class PaginationListTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.pages_outlined),
      title: Text(l10n.pagination),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.pagination,
          body: const _PaginationTiles(),
        );
      },
    );
  }
}

class _PaginationTiles extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final librarySize = ref.watch(libraryPageSizeProvider);
    final seriesSize = ref.watch(seriesPageSizeProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Column(
      children: [
        SettingSlider(
          title: l10n.library,
          trailing: '$librarySize',
          value: librarySize.toDouble(),
          min: 20,
          max: 200,
          divisions: 9,
          labelBuilder: (v) => '${v.round()}',
          onChangeEnd: (value) => notifier.setLibraryPageSize(value.round()),
        ),
        SettingSlider(
          title: l10n.series,
          trailing: '$seriesSize',
          value: seriesSize.toDouble(),
          min: 10,
          max: 100,
          divisions: 9,
          labelBuilder: (v) => '${v.round()}',
          onChangeEnd: (value) => notifier.setSeriesPageSize(value.round()),
        ),
      ],
    );
  }
}
