import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/nav_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/admin/ui/admin_tile.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/changelog_screen.dart';
import 'package:storii/shared/widgets/logo_header.dart';
import 'package:storii/storage/local/session_store.dart';

class MoreScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingTargets = ref.watch(remainingNavTargetsProvider);
    final hasUnsyncedSessions =
        (ref.watch(localSessionsProvider).value ?? []).isNotEmpty;
    final offlineMode = ref.watch(offlineModeProvider);

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
            SwitchListTile(
              title: Text(l10n.offlineMode),
              secondary: const Icon(Icons.wifi_off),
              value: offlineMode,
              onChanged: (v) =>
                  ref.read(userSettingsProvider.notifier).setOfflineMode(v),
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
              onTap: () => context.push(AppRoute.playbackHistory.path),
              leading: const Icon(Icons.history),
              title: Text(l10n.playbackHistory),
            ),
            if (hasUnsyncedSessions)
              ListTile(
                onTap: () => context.push(AppRoute.localSessions.path),
                leading: const Icon(Icons.sync_disabled),
                title: Text(l10n.unsyncedSessions),
              ),
            ListTile(
              onTap: () => context.push(AppRoute.stats.path),
              leading: const Icon(Icons.query_stats),
              title: Text(l10n.stats),
            ),
            const AdminTile(),
            const Divider(),
            ListTile(
              onTap: () => context.push(AppRoute.settings.path),
              leading: const Icon(Icons.settings),
              title: Text(l10n.settings),
            ),
            const ChangelogTile(),
            const AboutTile(),
          ],
        ),
      ),
    );
  }
}
