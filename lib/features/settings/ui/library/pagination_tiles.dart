import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class PaginationTiles extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final librarySize = ref.watch(libraryPageSizeProvider);
    final seriesSize = ref.watch(seriesPageSizeProvider);
    final notifier = ref.read(userSettingsProvider.notifier);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.libraryPageSize,
                  style: textTheme.bodyLarge,
                  softWrap: true,
                ),
              ),
              WheelPicker.fromIntRange(
                initialValue: librarySize,
                min: 20,
                max: 200,
                step: 20,
                visibleItems: 2,
                onChangedEnd: notifier.setLibraryPageSize,
                labelBuilder: (v) => '$v',
                wheelWidth: 80,
              ),
            ],
          ),
        ),
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.seriesPageSize,
                  style: textTheme.bodyLarge,
                  softWrap: true,
                ),
              ),
              WheelPicker.fromIntRange(
                initialValue: seriesSize,
                min: 10,
                max: 100,
                step: 10,
                visibleItems: 2,
                onChangedEnd: notifier.setSeriesPageSize,
                labelBuilder: (v) => '$v',
                wheelWidth: 80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
