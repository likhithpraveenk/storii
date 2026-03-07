import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/logout_tile.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/logo_header.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTargets = ref.watch(navTargetsProvider);
    final remainingTargets = NavTarget.values
        .where((target) => !navTargets.contains(target))
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 64),
            const LogoHeader(),
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
              onTap: () => context.push(AppRoute.profile.path),
              leading: const Icon(Icons.query_stats),
              title: Text(AppLocalizations.of(context)!.profile),
            ),
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
            const LogoutTile(),
            ListTile(
              leading: const Icon(Icons.switch_account),
              title: Text(AppLocalizations.of(context)!.switchAccount),
              onTap: () {
                ref.read(appSettingsProvider.notifier).setCurrentUser(null);
              },
            ),
            const AboutTile(),
          ],
        ),
      ),
    );
  }
}
