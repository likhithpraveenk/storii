import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/account_section.dart';
import 'package:storii/features/settings/ui/advanced/advanced_settings_screen.dart';
import 'package:storii/features/settings/ui/appearance/appearance_screen.dart';
import 'package:storii/features/settings/ui/library/library_settings_screen.dart';
import 'package:storii/features/settings/ui/player_settings/player_settings_screen.dart';
import 'package:storii/features/settings/ui/reset_settings_action.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.settings,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),

        actions: const [ResetSettingsAction()],
        actionsPadding: const .only(right: 16),
      ),
      body: ListView(
        children: const [
          AppearanceTile(),
          PlayerSettingsTile(),
          LibrarySettingsTile(),
          // DownloadsSettingsTile(),
          AdvancedSettingsTile(),
          AccountSection(),
        ],
      ),
    );
  }
}
