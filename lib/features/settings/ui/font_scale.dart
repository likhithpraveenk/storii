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
    final l = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.font_download),
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [Text(l.fontScale)],
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
    final displayScale = _currentScale ?? fontScale;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${(displayScale * 100).toInt()}%',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Slider(
          value: displayScale,
          min: 0.8,
          max: 1.5,
          divisions: 7,
          onChanged: (value) {
            setState(() => _currentScale = value);
          },
          onChangeEnd: (value) {
            ref.read(appSettingsProvider.notifier).setFontScale(value);
          },
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
