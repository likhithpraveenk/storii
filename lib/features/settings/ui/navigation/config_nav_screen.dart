import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/navigation/nav_label_tile.dart';
import 'package:storii/features/settings/ui/navigation/reorder_nav_tabs.dart';
import 'package:storii/features/settings/ui/navigation/startup_nav.dart';

class ConfigNavTile extends StatelessWidget {
  const ConfigNavTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.explore_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.configNav),
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          l10n.configNav,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [StartupNavTile(), ReorderNavTabsTile(), NavLabelTile()],
        ),
      ),
    );
  }
}
