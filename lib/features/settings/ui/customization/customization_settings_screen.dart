import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/customization/nav_label_tile.dart';
import 'package:storii/features/settings/ui/customization/reorder_nav_tabs.dart';
import 'package:storii/features/settings/ui/customization/scroll_thumb_tile.dart';
import 'package:storii/features/settings/ui/customization/startup_nav.dart';
import 'package:storii/features/settings/ui/settings_header.dart';

class CustomizationSettingsTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.dashboard_customize_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.customization),
      onTap: () {
        context.push(AppRoute.customizationSettings.path);
      },
    );
  }
}

class CustomizationSettingsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          l10n.customization,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        children: [
          SettingsHeader(title: l10n.navBar),
          const StartupNavTile(),
          const ReorderNavTabsTile(),
          const NavLabelTile(),
          SettingsHeader(title: l10n.lists),
          const ScrollThumbTile(),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
