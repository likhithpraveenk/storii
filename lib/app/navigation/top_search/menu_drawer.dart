import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/top_search/library_switcher.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/home/logic/user_session_controller.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/waveform.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      shape: BoxBorder.all(),
      child: SafeArea(
        child: Column(
          children: [
            ListTile(title: Text('Storii', style: textTheme.titleLarge)),
            if (user != null) ...[
              ListTile(
                title: Text(
                  l10n.welcome(user.username),
                  style: textTheme.titleMedium,
                ),
              ),
              const Divider(),
              LibrarySwitcher(user: user),
            ],
            ListTile(
              leading: const Icon(Icons.download),
              title: Text(l10n.downloads),
              onTap: () {
                Navigator.of(context).pop();
                context.push(AppRoute.downloads.path);
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(l10n.settings),
              onTap: () {
                Navigator.of(context).pop();
                context.push(AppRoute.settings.path);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                context.push(AppRoute.logs.path);
              },
              title: Text(l10n.logs),
              leading: const Icon(Icons.notes_sharp),
            ),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(userSessionControllerProvider);
                return ListTile(
                  leading: const Icon(Icons.logout),
                  title: state == .loading
                      ? const RandomWaveform()
                      : Text(l10n.logout),
                  onTap: state == .loading
                      ? null
                      : () {
                          if (user != null) {
                            ref
                                .read(userSessionControllerProvider.notifier)
                                .logout(user);
                          }
                        },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.switch_account),
              title: Text(l10n.switchAccount),
              onTap: () {
                ref.read(appSettingsProvider.notifier).setCurrentUser(null);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.about),
              onTap: () {
                Navigator.of(context).pop();
                context.push(AppRoute.about.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
