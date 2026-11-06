import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';

class ParallelDownloadsTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parallelDownloads = ref.watch(parallelDownloadsProvider);

    return SettingSlider(
      title: l10n.parallelDownloads,
      subtitle: l10n.parallelDownloadsSubtitle,
      value: parallelDownloads.toDouble(),
      trailing: '$parallelDownloads',
      min: 1,
      max: 5,
      divisions: 4,
      onChangeEnd: (v) {
        ref.read(userSettingsProvider.notifier).setParallelDownloads(v.toInt());
      },
    );
  }
}
