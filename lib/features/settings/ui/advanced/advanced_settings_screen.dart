import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/advanced/app_cache_tile.dart';
import 'package:storii/features/settings/ui/advanced/backup_settings_tile.dart';
import 'package:storii/features/settings/ui/advanced/http_logs.dart';
import 'package:storii/features/settings/ui/advanced/trust_all_certificates_tile.dart';

class AdvancedSettingsTile extends StatelessWidget {
  const AdvancedSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.code),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.advanced),
      onTap: () {
        context.push(AppRoute.advancedSettings.path);
      },
    );
  }
}

class AdvancedSettingsScreen extends StatelessWidget {
  const AdvancedSettingsScreen({super.key});

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
          l10n.advanced,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        children: const [
          BackupSettingsTile(),
          HttpLogsTile(),
          TrustAllCertificatesTile(),
          AppCacheTile(),
        ],
      ),
    );
  }
}
