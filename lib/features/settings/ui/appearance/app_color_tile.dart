import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class AppColorTile extends ConsumerWidget {
  const AppColorTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorProvider);

    return ListTile(
      title: Text(l10n.appColor),
      subtitle: Text(appColor.toHexNoAlpha(addHash: true)),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: appColor, shape: .circle),
      ),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.appColor,
          body: const _AppColorSheet(),
        );
      },
    );
  }
}

class _AppColorSheet extends ConsumerStatefulWidget {
  const _AppColorSheet();

  @override
  ConsumerState<_AppColorSheet> createState() => _AppColorSheetState();
}

class _AppColorSheetState extends ConsumerState<_AppColorSheet> {
  late TextEditingController _controller;
  late Color _previewColor;
  String? _error;

  @override
  void initState() {
    super.initState();
    _previewColor = ref.read(appColorProvider);
    _controller = TextEditingController(text: _previewColor.toHexNoAlpha());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _error = null;
      try {
        _previewColor = ColorExtensions.fromHex(value);
      } catch (_) {
        _error = l10n.invalidHex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final scheme = ColorScheme.fromSeed(
      seedColor: _previewColor,
      brightness: brightness,
      surface: getSurfaceColor(_previewColor, brightness),
    );

    return Column(
      mainAxisSize: .min,
      children: [
        Padding(
          padding: const .fromLTRB(24, 0, 24, 16),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: l10n.hexColor,
              hintText: 'AAAAFF',
              errorText: _error,
              prefixText: '#',
              helperText: l10n.hexFormatHint,
              suffixIcon: Container(
                margin: const .only(right: 12),
                decoration: BoxDecoration(color: _previewColor, shape: .circle),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 48,
                maxHeight: 48,
              ),
            ),
            onChanged: _onChanged,
          ),
        ),
        Container(
          margin: const .symmetric(horizontal: 24),
          padding: const .all(24),
          decoration: BoxDecoration(
            color: scheme.surface,
            border: .all(width: 2, color: scheme.outline),
            borderRadius: .circular(kRadius),
          ),
          child: Row(
            spacing: 12,
            mainAxisAlignment: .center,
            children: [
              _PreviewDot(
                color: scheme.primary,
                label: l10n.primary,
                outline: scheme.primaryContainer,
              ),
              _PreviewDot(
                color: scheme.secondary,
                label: l10n.secondary,
                outline: scheme.secondaryContainer,
              ),
              _PreviewDot(
                color: scheme.tertiary,
                label: l10n.tertiary,
                outline: scheme.tertiaryContainer,
              ),
              _PreviewDot(
                color: scheme.error,
                label: l10n.error,
                outline: scheme.errorContainer,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const .all(16),
          child: SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              onPressed: _error == null
                  ? () {
                      ref
                          .read(appSettingsProvider.notifier)
                          .setAppColor(_previewColor);
                      ref
                          .read(appSettingsProvider.notifier)
                          .setUseDynamicColor(false);
                      Navigator.pop(context);
                    }
                  : null,
              text: l10n.save,
            ),
          ),
        ),
      ],
    );
  }
}

class _PreviewDot extends StatelessWidget {
  const _PreviewDot({
    required this.color,
    required this.label,
    required this.outline,
  });

  final Color color;
  final Color outline;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: .circle,
            border: .all(color: outline, width: 4),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
