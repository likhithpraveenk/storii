import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/settings/ui/navigation/reorder_nav_tabs.dart';
import 'package:storii/features/settings/ui/navigation/startup_nav.dart';
import 'package:storii/l10n/l10n.dart';

class ConfigNavTile extends StatelessWidget {
  const ConfigNavTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.explore_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(AppLocalizations.of(context)!.configNav),
      onTap: () {
        context.push(AppRoute.navigationSettings.path);
      },
    );
  }
}

class ConfigNavScreen extends StatelessWidget {
  const ConfigNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l.configNav, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: ListView(children: const [StartupNavTile(), ReorderNavTabsTile()]),
    );
  }
}
