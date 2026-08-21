import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class PlaybackControlsLayoutTile extends ConsumerWidget {
  const PlaybackControlsLayoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = ref.watch(playbackControlsLayoutProvider);
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.playbackControlsLayout),
      subtitle: Text(layout.label),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.playbackControlsLayout,
          body: Consumer(
            builder: (context, ref, _) {
              final layout = ref.watch(playbackControlsLayoutProvider);

              return RadioGroup<PlaybackControlsLayout>(
                groupValue: layout,
                onChanged: (target) {
                  if (target != null) {
                    ref
                        .read(userSettingsProvider.notifier)
                        .setPlaybackControlsLayout(target);
                  }
                },
                child: Column(
                  children: [
                    ...PlaybackControlsLayout.values.map(
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
