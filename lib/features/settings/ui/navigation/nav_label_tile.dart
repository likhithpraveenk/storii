import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class NavLabelTile extends ConsumerWidget {
  const NavLabelTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final labelBehavior = ref.watch(navLabelBehaviorProvider);
    final label = _behaviorString(context, labelBehavior);

    return ListTile(
      leading: const Icon(Icons.label_important),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l.settingsNavLabelBehavior),
      subtitle: Text(label),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l.settingsNavLabelBehavior,
          body: Consumer(
            builder: (context, ref, _) {
              final behavior = ref.watch(navLabelBehaviorProvider);

              return RadioGroup<NavigationDestinationLabelBehavior>(
                groupValue: behavior,
                onChanged: (target) {
                  if (target != null) {
                    ref
                        .read(userSettingsProvider.notifier)
                        .setNavLabelBehavior(target);
                  }
                },
                child: Column(
                  children: [
                    ...NavigationDestinationLabelBehavior.values.map(
                      (b) => RadioListTile(
                        value: b,
                        title: Text(_behaviorString(context, b)),
                      ),
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

  String _behaviorString(
    BuildContext context,
    NavigationDestinationLabelBehavior b,
  ) {
    final l = AppLocalizations.of(context)!;
    return switch (b) {
      .alwaysHide => l.alwaysHide,
      .alwaysShow => l.alwaysShow,
      .onlyShowSelected => l.onlyShowSelected,
    };
  }
}
