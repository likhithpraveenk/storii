import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class ShowSeekButtonsTile extends ConsumerWidget {
  const ShowSeekButtonsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSeekButtons = ref.watch(showMiniPlayerSeekButtonsProvider);

    return SwitchListTile(
      value: showSeekButtons,
      secondary: Icon(
        showSeekButtons
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
      title: Text(l10n.showButtonsMiniplayer),
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setShowMiniPlayerSeekButtons(value);
      },
    );
  }
}
