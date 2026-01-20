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
    final remainingTargets = NavTarget.values
        .where((target) => !navTargets.contains(target))
        .toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoute.profile.path),
            icon: const Icon(Icons.query_stats),
            tooltip: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              alignment: .center,
              width: double.infinity,
              child: Image.asset(
                LocalAssets.appForeground,
                width: 100,
                height: 100,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            if (remainingTargets.isNotEmpty) ...[
              const Divider(),
              ...remainingTargets.map((target) {
                return ListTile(
                  onTap: () {
                    context.push(target.item.route.path);
                  },
                  leading: Icon(target.item.selectedIcon),
                  title: Text(target.label(context)),
                );
              }),
            ],
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
