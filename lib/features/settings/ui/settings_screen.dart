import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/settings/ui/datetime_format_setting.dart';
import 'package:storii/features/settings/ui/font_picker_setting.dart';
import 'package:storii/features/settings/ui/language_selector_setting.dart';
import 'package:storii/features/settings/ui/log_retention_setting.dart';
import 'package:storii/features/settings/ui/reset_settings_action.dart';
import 'package:storii/features/settings/ui/theme_setting_card.dart';
import 'package:storii/l10n/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [const ResetSettingsAction()],
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView(
        children: [
          const ThemeSettingCard(),
          const LanguageSelectorSetting(),
          const LogRetentionSetting(),
          const DateTimeFormatSetting(),
          // const ClearCache(),
          Card(
            shape: AppStyles.roundedRect,
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            child: ListTile(
              leading: const Icon(Icons.explore),
              title: Text(
                AppLocalizations.of(context)!.configNav,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onTap: () {
                context.push(AppRoute.navigationSettings.path);
              },
            ),
          ),
          const FontPickerSetting(),
        ],
      ),
    );
  }
}
