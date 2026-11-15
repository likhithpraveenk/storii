import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class ShowCoverInFullPlayerTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showCover = ref.watch(showCoverInFullPlayerProvider);

    return SwitchListTile(
      value: showCover,
      secondary: const Icon(Icons.album),
      title: Text(l10n.coverImage),
      onChanged: ref
          .read(userSettingsProvider.notifier)
          .setShowCoverInFullPlayer,
    );
  }
}
