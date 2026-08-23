import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class PlayerBackgroundThemeTile extends ConsumerWidget {
  const PlayerBackgroundThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(playerBackgroundThemeProvider);
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.playerBackgroundTheme),
      subtitle: Text(theme.label),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.playerBackgroundTheme,
          body: Consumer(
            builder: (context, ref, _) {
              final theme = ref.watch(playerBackgroundThemeProvider);

              return RadioGroup<PlayerBackgroundTheme>(
                groupValue: theme,
                onChanged: (target) {
                  if (target != null) {
                    ref
                        .read(userSettingsProvider.notifier)
                        .setPlayerBackgroundTheme(target);
                  }
                },
                child: Column(
                  children: [
                    ...PlayerBackgroundTheme.values.map(
                      (b) => RadioListTile(value: b, title: Text(b.label)),
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
