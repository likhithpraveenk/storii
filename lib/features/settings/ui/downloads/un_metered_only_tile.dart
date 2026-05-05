import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class UnMeteredOnlyTile extends ConsumerWidget {
  const UnMeteredOnlyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unMeteredOnly = ref.watch(downloadOnUnMeteredOnlyProvider);

    return SwitchListTile(
      title: Text(l10n.avoidMobileData),
      subtitle: Text(l10n.avoidMobileDataSubtitle),
      value: unMeteredOnly,
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setDownloadOnUnMeteredOnly(value);
      },
    );
  }
}
