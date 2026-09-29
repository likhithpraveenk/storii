import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class PlayOnStartupTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playOnStartup = ref.watch(playOnStartupProvider);

    return SwitchListTile(
      value: playOnStartup,
      title: Text(l10n.playOnStartup),
      subtitle: Text(l10n.playOnStartupSubtitle),
      secondary: const Icon(Icons.play_circle_outline),
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setPlayOnStartup(value);
      },
    );
  }
}
