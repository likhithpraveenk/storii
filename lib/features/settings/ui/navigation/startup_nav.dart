import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class StartupNavTile extends ConsumerWidget {
  const StartupNavTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupNav = ref.watch(startupNavProvider).label;

    return ListTile(
      leading: const Icon(Icons.home),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.settingsStartupRouteTitle),
      subtitle: Text(startupNav),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.settingsStartupRouteTitle,
          body: Consumer(
            builder: (context, ref, _) {
              final navTargets = ref.read(navTargetsProvider);
              final startup = ref.watch(startupNavProvider);

              return RadioGroup<NavTarget>(
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
                      (nav) =>
                          RadioListTile(value: nav, title: Text(nav.label)),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
