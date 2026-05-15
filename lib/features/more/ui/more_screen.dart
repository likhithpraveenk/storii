import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/logout_tile.dart';
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
            const SizedBox(height: 48),
            Stack(
              children: [
                const LogoHeader(),
                Positioned(
                  top: 0,
                  right: 16,
                  child: IconButton(
                    tooltip: l10n.logs,
                    onPressed: () {
                      context.push(AppRoute.logs.path);
                    },
                    icon: const Icon(Icons.bug_report),
                  ),
                ),
              ],
            ),
            if (remainingTargets.isNotEmpty) ...[
              const Divider(),
              ...remainingTargets.map((target) {
                return ListTile(
                  onTap: () {
                    context.push(target.item.route.path);
                  },
                  leading: Icon(target.item.selectedIcon),
                  title: Text(target.label),
                );
              }),
            ],
            const Divider(),
            ListTile(
              onTap: () => context.push(AppRoute.profile.path),
              leading: const Icon(Icons.query_stats),
              title: Text(l10n.profile),
            ),
            ListTile(
              onTap: () => context.push(AppRoute.settings.path),
              leading: const Icon(Icons.settings),
              title: Text(l10n.settings),
            ),
            const LogoutTile(),
            ListTile(
              leading: const Icon(Icons.switch_account),
              title: Text(l10n.switchAccount),
              onTap: () {
                ref.read(userSessionControllerProvider.notifier).switchUser();
              },
            ),
            const AboutTile(),
          ],
        ),
      ),
    );
  }
}
