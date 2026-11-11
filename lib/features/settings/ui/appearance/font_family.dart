import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/user_fonts.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/waveform.dart';
import 'package:storii/storage/local/font_service.dart';

class FontFamilyTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontFamily = ref.watch(fontFamilyProvider);

    return ListTile(
      title: Text(l10n.fontFamily),
      subtitle: Text(fontFamily == systemFont ? l10n.system : fontFamily),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: .vertical(top: .circular(kRadiusXl)),
          ),
          builder: (_) => DecoratedBox(
            decoration: bottomSheetDecoration(context),
            child: const _FontFamilySheet(),
          ),
        );
      },
    );
  }
}

class _FontFamilySheet extends ConsumerStatefulWidget {
  const new();
  @override
  ConsumerState<_FontFamilySheet> createState() => _FontFamilySheetState();
}

class _FontFamilySheetState extends ConsumerState<_FontFamilySheet> {
  late String _selected = ref.read(fontFamilyProvider);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FontService.loadFonts(loadAll: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userFontsAsync = ref.watch(userFontsProvider);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: const .fromLTRB(24, 24, 24, 16),
          child: Column(
            children: [
              Text(
                l10n.fontFamily,
                style: bottomSheetTitleTextStyle(context),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.sampleText,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: _selected,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: .center,
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              _FontTile(
                label: l10n.system,
                value: systemFont,
                selected: _selected,
                onTap: (v) => setState(() => _selected = v),
              ),
              _FontTile(
                label: DefaultUserSettings.fontFamily,
                value: DefaultUserSettings.fontFamily,
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
                          onDelete: () => _deleteFont(font),
                        ),
                      )
                      .toList(),
                ),
                loading: () => const Center(child: RandomWaveform()),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const .fromLTRB(24, 16, 24, 0),
          child: SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              text: l10n.save,
              onPressed: () {
                ref
                    .read(userSettingsProvider.notifier)
                    .setFontFamily(_selected);
                Navigator.pop(context);
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
                  text: l10n.remove,
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
                  text: l10n.addFonts,
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

  Future<void> _deleteFont(String font) async {
    final confirmed = await AppDialog.show<bool>(
      context,
      title: l10n.deleteUserQ(font),
      isDestructive: true,
      actionLabel: l10n.delete,
      onTap: () async {},
    );
    if (confirmed != true) return;
    await FontService.deleteFont(font);
    ref.invalidate(userFontsProvider);
    if (_selected == font) {
      setState(() => _selected = DefaultUserSettings.fontFamily);
    }
    if (ref.read(fontFamilyProvider) == font) {
      await ref
          .read(userSettingsProvider.notifier)
          .setFontFamily(DefaultUserSettings.fontFamily);
    }
  }
}

class _FontTile extends StatelessWidget {
  const new({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
    this.onDelete,
  });

  final String label;
  final String value;
  final String? selected;
  final ValueChanged<String> onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(fontFamily: value),
      ),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          if (selected == value) const Icon(Icons.check),
          if (onDelete != null)
            IconButton(
              visualDensity: .compact,
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
            ),
        ],
      ),
      contentPadding: const .symmetric(horizontal: 24),
      onTap: () => onTap(value),
    );
  }
}
