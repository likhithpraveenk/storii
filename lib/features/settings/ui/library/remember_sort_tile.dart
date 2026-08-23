import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class RememberSortTile extends ConsumerWidget {
  const RememberSortTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rememberSort = ref.watch(rememberSortProvider);

    return SwitchListTile(
      title: Text(l10n.rememberSort),
      subtitle: Text(l10n.rememberSortSubtitle),
      value: rememberSort,
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setRememberSort(value);
      },
    );
  }
}
