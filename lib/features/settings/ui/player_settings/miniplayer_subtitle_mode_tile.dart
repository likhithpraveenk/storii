import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class MiniplayerSubtitleModeTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(miniplayerSubtitleModeProvider);
    return ListTile(
      leading: const Icon(Icons.text_fields),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.miniplayerSubtitle),
      subtitle: Text(mode.label),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.miniplayerSubtitle,
          body: Consumer(
            builder: (context, ref, _) {
              final mode = ref.watch(miniplayerSubtitleModeProvider);

              return RadioGroup<MiniplayerSubtitleMode>(
                groupValue: mode,
                onChanged: (target) {
                  if (target != null) {
                    ref
                        .read(userSettingsProvider.notifier)
                        .setMiniplayerSubtitleMode(target);
                  }
                },
                child: Column(
                  children: [
                    ...MiniplayerSubtitleMode.values.map(
                      (m) => RadioListTile(value: m, title: Text(m.label)),
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
