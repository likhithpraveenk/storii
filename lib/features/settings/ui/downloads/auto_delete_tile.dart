import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class AutoDeleteTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(autoDeleteListenedDownloadsProvider);

    return SwitchListTile(
      title: Text(l10n.autoDeleteListenedDownloads),
      subtitle: Text(l10n.autoDeleteListenedDownloadsSubtitle),
      value: enabled,
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setAutoDeleteListenedDownloads(value);
      },
    );
  }
}

class AutoDeleteDelayTile extends ConsumerWidget {
  const new({super.key});

  static const _presets = [
    Duration(minutes: 5),
    Duration(hours: 1),
    Duration(hours: 24),
    Duration(days: 3),
    Duration(days: 7),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(autoDeleteListenedDownloadsProvider);
    if (!enabled) return const SizedBox.shrink();

    final delay = ref.watch(autoDeleteListenedDelayProvider);

    return ListTile(
      leading: const Icon(Icons.schedule),
      title: Text(l10n.deleteDelay),
      subtitle: Text(delay.toMinimal()),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.deleteDelay,
          body: Consumer(
            builder: (context, ref, _) {
              final delay = ref.watch(autoDeleteListenedDelayProvider);

              return RadioGroup<Duration>(
                groupValue: delay,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(userSettingsProvider.notifier)
                        .setAutoDeleteListenedDelay(value);
                  }
                },
                child: Column(
                  children: [
                    ..._presets.map(
                      (d) =>
                          RadioListTile(value: d, title: Text(d.toMinimal())),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
