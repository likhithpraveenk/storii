import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class FontScaleTile extends ConsumerWidget {
  const FontScaleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontScale = ref.watch(fontScaleProvider);

    return ListTile(
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [Text(AppLocalizations.of(context)!.fontScale)],
      ),
      subtitle: Text('${(fontScale * 100).toInt()}%'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          showDragHandle: true,
          builder: (context) => const FontScaleSheet(),
        );
      },
    );
  }
}

class FontScaleSheet extends ConsumerStatefulWidget {
  const FontScaleSheet({super.key});

  @override
  ConsumerState<FontScaleSheet> createState() => _FontScaleSheetState();
}

class _FontScaleSheetState extends ConsumerState<FontScaleSheet> {
  double? _currentScale;

  @override
  Widget build(BuildContext context) {
    final fontScale = ref.watch(fontScaleProvider);
    final displayScale = _currentScale ?? (fontScale * 20);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.fontScale,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '${(displayScale * 5).round()}%',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: displayScale,
          min: 16,
          max: 30,
          divisions: 14,
          onChanged: (value) {
            setState(() => _currentScale = value);
          },
          onChangeEnd: (value) {
            ref.read(appSettingsProvider.notifier).setFontScale(value / 20);
          },
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
