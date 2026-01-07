import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class FontScaleSetting extends ConsumerWidget {
  const FontScaleSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontScale = ref.watch(fontScaleProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    final l = AppLocalizations.of(context)!;

    return Card(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: AppStyles.roundedRect,
      child: ListTile(
        leading: const Icon(Icons.font_download_outlined),
        title: Text(l.fontScale, style: Theme.of(context).textTheme.titleSmall),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slider(
              value: fontScale,
              min: 0.8,
              max: 1.4,
              divisions: 6,
              label: fontScale.toStringAsFixed(1),
              onChanged: notifier.setFontScale,
            ),
          ],
        ),
        trailing: Text(
          '${(fontScale * 100).toInt()}%',
          style: const TextStyle(fontWeight: .bold),
        ),
        shape: AppStyles.roundedRect,
      ),
    );
  }
}
