import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/downloads/unmetered_only_tile.dart';

class DownloadsTile extends StatelessWidget {
  const DownloadsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.download_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.downloads),
      onTap: () {
        context.push(AppRoute.downloadsSettings.path);
      },
    );
  }
}

class DownloadsSettingsScreen extends StatelessWidget {
  const DownloadsSettingsScreen({super.key});

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
          l10n.downloads,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [UnmeteredOnlyTile()]),
      ),
    );
  }
}
