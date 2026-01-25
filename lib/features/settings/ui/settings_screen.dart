import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/features/settings/ui/appearance_screen.dart';
import 'package:storii/features/settings/ui/datetime_format_setting.dart';
import 'package:storii/features/settings/ui/font_picker_setting.dart';
import 'package:storii/features/settings/ui/font_scale_setting.dart';
import 'package:storii/features/settings/ui/http_logs_setting.dart';
import 'package:storii/features/settings/ui/language_selector_setting.dart';
import 'package:storii/features/settings/ui/log_retention_setting.dart';
import 'package:storii/features/settings/ui/nav_setting_screen.dart';
import 'package:storii/features/settings/ui/reset_settings_action.dart';
import 'package:storii/l10n/l10n.dart';

// TODO: no more drop downs!
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        actions: [const ResetSettingsAction()],
      ),
      body: ListView(
        children: [
          const AppearanceTile(),
          const LanguageSelectorSetting(),
          const LogRetentionSetting(),
          const DateTimeFormatSetting(),
          const ConfigNavSetting(),
          const FontPickerSetting(),
          const FontScaleSetting(),
          const HttpLogsSetting(),
        ],
      ),
    );
  }
}
