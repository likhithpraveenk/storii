import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/speed_button.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class SpeedTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(speedProvider);

    return ListTile(
      leading: const Icon(Icons.speed_rounded),
      title: Text(l10n.playbackSpeed),
      subtitle: Text(speed.speedLabel),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.playbackSpeed,
          body: Consumer(
            builder: (_, ref, _) => SpeedSheet(
              speed: ref.watch(speedProvider),
              onChanged: (value) => ref
                  .read(userSettingsProvider.notifier)
                  .setSpeed(value.fixed2.clamp(speedMin, speedMax)),
            ),
          ),
        );
      },
    );
  }
}
