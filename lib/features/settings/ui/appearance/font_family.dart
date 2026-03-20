import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/user_fonts.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/waveform.dart';
import 'package:storii/storage/local/font_service.dart';

class FontFamilyTile extends ConsumerWidget {
  const FontFamilyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontFamily = ref.watch(fontFamilyProvider);
    final l = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(l.fontFamily),
      subtitle: Text(fontFamily ?? l.system),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l.fontFamily,
          body: const FontFamilySheet(),
        );
      },
    );
  }
}

class FontFamilySheet extends ConsumerStatefulWidget {
  const FontFamilySheet({super.key});
  @override
  ConsumerState<FontFamilySheet> createState() => _FontFamilySheetState();
}

class _FontFamilySheetState extends ConsumerState<FontFamilySheet> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final currentFont = ref.watch(fontFamilyProvider);
    final userFontsAsync = ref.watch(userFontsProvider);
    _selected ??= currentFont ?? 'system';
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const .fromLTRB(24, 0, 24, 24),
          child: Text(
            l.sampleText,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: _selected,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: .center,
          ),
        ),
        _FontTile(
          label: l.system,
          value: 'system',
          selected: _selected,
          onTap: (v) => setState(() => _selected = v),
        ),
        _FontTile(
          label: 'AtkinsonHyperlegibleNext',
          value: 'AtkinsonHyperlegibleNext',
          selected: _selected,
          onTap: (v) => setState(() => _selected = v),
        ),
        userFontsAsync.when(
          data: (fonts) => Column(
            children: fonts
                .map(
                  (font) => _FontTile(
                    label: font,
                    value: font,
                    selected: _selected,
                    onTap: (v) => setState(() => _selected = v),
                  ),
                )
                .toList(),
          ),
          loading: () => const Center(child: RandomWaveform()),
          error: (_, _) => const SizedBox.shrink(),
        ),
        Padding(
          padding: const .fromLTRB(24, 16, 24, 0),
          child: SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              text: l.save,
              onPressed: () async {
                final val = _selected;
                await ref
                    .read(appSettingsProvider.notifier)
                    .setFontFamily(val == 'system' ? null : val);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const .fromLTRB(24, 8, 24, 24),
          child: Row(
            children: [
              Expanded(
                child: AppOutlinedButton(
                  text: l.remove,
                  isDestructive: true,
                  icon: Icon(Icons.delete, color: theme.colorScheme.error),
                  onPressed: () async {
                    await FontService.clearFonts();
                    ref.invalidate(userFontsProvider);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppOutlinedButton(
                  text: l.addFonts,
                  icon: const Icon(Icons.folder_open),
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      await Permission.storage.request();
                    }
                    await FontService.importFonts();
                    ref.invalidate(userFontsProvider);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FontTile extends StatelessWidget {
  const _FontTile({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String value;
  final String? selected;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(fontFamily: value),
      ),
      trailing: selected == value ? const Icon(Icons.check) : null,
      contentPadding: const .symmetric(horizontal: 24),
      onTap: () => onTap(value),
    );
  }
}
