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
      title: Text(l10n.extraControls),
      subtitle: Text(l10n.extraControlsSubtitle),
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setShowMiniPlayerSeekButtons(value);
      },
    );
  }
}
