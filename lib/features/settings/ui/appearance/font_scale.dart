import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class FontScaleTile extends ConsumerWidget {
  const FontScaleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontScale = ref.watch(fontScaleProvider);
    final percent = '${(fontScale * 100).round()}%';

    return ListTile(
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [Text(l10n.fontScale)],
      ),
      subtitle: Text(percent),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l10n.fontScale,
          body: const _FontScaleSheet(),
        );
      },
    );
  }
}

class _FontScaleSheet extends ConsumerStatefulWidget {
  const _FontScaleSheet();

  @override
  ConsumerState<_FontScaleSheet> createState() => _FontScaleSheetState();
}

class _FontScaleSheetState extends ConsumerState<_FontScaleSheet> {
  late double _scale;

  @override
  void initState() {
    super.initState();
    _scale = ref.read(fontScaleProvider) * 20;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final globalScale = ref.watch(fontScaleProvider) * 20;

    return Column(
      children: [
        Text(
          '${_display(globalScale)}%',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 28,
            fontWeight: .bold,
            letterSpacing: -0.5,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Slider(
          value: _scale,
          min: 16,
          max: 40,
          divisions: 12,
          label: _display(_scale),
          onChanged: (value) {
            setState(() => _scale = value);
          },
          onChangeEnd: (value) {
            ref.read(userSettingsProvider.notifier).setFontScale(value / 20);
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const .symmetric(horizontal: 24),
          child: MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: .linear(_scale / 20)),
            child: Text(
              l10n.sampleText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: .center,
            ),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

String _display(double scale) {
  return '${(scale * 5).round()}';
}
