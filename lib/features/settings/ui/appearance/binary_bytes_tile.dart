import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class BinaryBytesTile extends ConsumerWidget {
  const BinaryBytesTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useBinary = ref.watch(useBinaryBytesProvider);

    return SwitchListTile(
      title: Text(useBinary ? l10n.binaryUnits : l10n.decimalUnits),
      subtitle: Text(
        useBinary ? l10n.binaryUnitsSubtitle : l10n.decimalUnitsSubtitle,
      ),
      value: useBinary,
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setUseBinaryBytes(value);
      },
    );
  }
}
