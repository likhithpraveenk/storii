import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/connection_info_tile.dart';
import 'package:storii/features/more/ui/logout_tile.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/logo_header.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
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
            const Divider(),
            const ConnectionInfoTile(),
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
              title: Text(l.profile),
            ),
            ListTile(
              onTap: () => context.push(AppRoute.settings.path),
              leading: const Icon(Icons.settings),
              title: Text(l.settings),
            ),
            ListTile(
              onTap: () => context.push(AppRoute.logs.path),
              leading: const Icon(Icons.bug_report),
              title: Text(l.logs),
            ),
            const LogoutTile(),
            ListTile(
              leading: const Icon(Icons.switch_account),
              title: Text(l.switchAccount),
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
