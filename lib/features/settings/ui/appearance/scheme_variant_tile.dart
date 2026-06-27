import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class SchemeVariantTile extends StatelessWidget {
  const SchemeVariantTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(l10n.schemeVariant),
      subtitle: Text(l10n.schemeVariantSubtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.schemeVariant,
          body: const _SchemeVariantSheet(),
        );
      },
    );
  }
}

class _SchemeVariantSheet extends ConsumerStatefulWidget {
  const _SchemeVariantSheet();

  @override
  ConsumerState<_SchemeVariantSheet> createState() =>
      _SchemeVariantSheetState();
}

class _SchemeVariantSheetState extends ConsumerState<_SchemeVariantSheet> {
  static const List<DynamicSchemeVariant> _values = [
    .tonalSpot,
    .fidelity,
    .monochrome,
    .neutral,
    .vibrant,
    .expressive,
  ];
  late DynamicSchemeVariant _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(schemeVariantProvider);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final useDynamic = ref.watch(useDynamicColorProvider);
    final systemColor = ref.watch(systemColorProvider);

    return Column(
      mainAxisSize: .min,
      children: [
        ..._values.map((v) {
          final isSelected = _selected == v;
          final scheme = useDynamic && systemColor != null
              ? ColorScheme.fromSeed(
                  seedColor: systemColor,
                  brightness: brightness,
                  dynamicSchemeVariant: v,
                )
              : ColorScheme.fromSeed(
                  seedColor: appPrimaryColor,
                  brightness: brightness,
                  dynamicSchemeVariant: v,
                  surface: appSlateColor,
                );

          return ListTile(
            title: Text(v.label),
            subtitle: Text(v.subtitle),
            leading: _SchemeSwatch(scheme),
            trailing: isSelected ? const Icon(Icons.check) : null,
            onTap: () => setState(() => _selected = v),
          );
        }),
        Padding(
          padding: const .all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                ref
                    .read(appSettingsProvider.notifier)
                    .setSchemeVariant(_selected);
                Navigator.pop(context);
              },
              child: Text(l10n.save),
            ),
          ),
        ),
      ],
    );
  }
}

class _SchemeSwatch extends StatelessWidget {
  const _SchemeSwatch(this.scheme);
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: .circular(8),
        border: .all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 6,
        children: [
          _Dot(color: scheme.primary),
          _Dot(color: scheme.tertiary),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, shape: .circle),
    );
  }
}
