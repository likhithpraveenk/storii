import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/features/settings/ui/appearance_screen.dart';
import 'package:storii/features/settings/ui/config_nav_screen.dart';
import 'package:storii/features/settings/ui/datetime_format_tile.dart';
import 'package:storii/features/settings/ui/font_family.dart';
import 'package:storii/features/settings/ui/font_scale.dart';
import 'package:storii/features/settings/ui/http_logs.dart';
import 'package:storii/features/settings/ui/language_selector.dart';
import 'package:storii/features/settings/ui/log_retention.dart';
import 'package:storii/features/settings/ui/reset_settings_action.dart';
import 'package:storii/l10n/l10n.dart';

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
        actionsPadding: const .only(right: 16),
      ),
      body: ListView(
        children: [
          const AppearanceTile(),
          const LanguageSelectorTile(),
          const LogRetentionTile(),
          const DateTimeFormatTile(),
          const ConfigNavTile(),
          const FontFamilyTile(),
          const FontScaleTile(),
          const HttpLogsTile(),
        ],
      ),
    );
  }
}
