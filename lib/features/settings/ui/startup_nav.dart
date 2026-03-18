import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class StartupNavTile extends ConsumerWidget {
  const StartupNavTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final startupNav = ref.watch(startupNavProvider).label(context);

    return ListTile(
      leading: const Icon(Icons.home),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l.settingsStartupRouteTitle),
      subtitle: Text(startupNav),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Consumer(
              builder: (context, ref, _) {
                final navTargets = ref.read(navTargetsProvider);
                final startup = ref.watch(startupNavProvider);

                return Column(
                  children: [
                    Padding(
                      padding: const .fromLTRB(24, 16, 24, 16),
                      child: Text(
                        l.settingsStartupRouteTitle,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(fontSize: 20),
                      ),
                    ),
                    RadioGroup<NavTarget>(
                      groupValue: startup,
                      onChanged: (target) {
                        if (target != null) {
                          ref
                              .read(userSettingsProvider.notifier)
                              .setStartupNav(target);
                        }
                      },
                      child: Column(
                        children: [
                          ...navTargets.map(
                            (nav) => RadioListTile(
                              value: nav,
                              title: Text(nav.label(context)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
