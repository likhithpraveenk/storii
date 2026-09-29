import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/settings/logic/settings_reset.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class SettingsResetButton extends ConsumerWidget {
  const new({super.key, required this.category, this.icon = Icons.refresh});

  final SettingsCategory category;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () async {
        await AppDialog.show(
          context,
          title: l10n.resetSettingsQ,
          body: Text(
            l10n.resetSettingsTxt,
            style: bottomSheetSubtitleTextStyle(context),
          ),
          actionLabel: l10n.reset,
          onTap: () async {
            await ref.resetCategory(category);
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l10n.settingsReset)));
            }
          },
        );
      },
    );
  }
}
