import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/about_screen.dart';
import 'package:storii/l10n/l10n.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTargets = ref.watch(navTargetsProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // TODO: profile page
            const SizedBox(height: 48),
            Center(
              child: Image.asset(
                ImagePaths.appForeground,
                width: 100,
                height: 100,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 48),
            const Divider(),
            if (!navTargets.contains(NavTarget.downloads))
              ListTile(
                onTap: () => context.push(AppRoute.downloadsPush.path),
                leading: const Icon(Icons.download),
                title: Text(AppLocalizations.of(context)!.downloads),
              ),
            if (!navTargets.contains(NavTarget.collections))
              ListTile(
                onTap: () => context.push(AppRoute.collectionsPush.path),
                leading: const Icon(Icons.collections_bookmark),
                title: Text(AppLocalizations.of(context)!.collections),
              ),
            const Divider(),
            ListTile(
              onTap: () => context.push(AppRoute.settings.path),
              leading: const Icon(Icons.settings),
              title: Text(AppLocalizations.of(context)!.settings),
            ),
            ListTile(
              onTap: () => context.push(AppRoute.logs.path),
              leading: const Icon(Icons.bug_report),
              title: Text(AppLocalizations.of(context)!.logs),
            ),
            const AboutTile(),
          ],
        ),
      ),
    );
  }
}
