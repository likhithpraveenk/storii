import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/appearance/scroll_thumb_picker_tiles.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class ScrollThumbTile extends ConsumerWidget {
  const ScrollThumbTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(scrollThumbVisibilityProvider);

    return ListTile(
      title: Text(l10n.scrollThumbSettings),
      subtitle: Text(visible ? l10n.scrollThumbVisibilitySubtitle : l10n.off),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.scrollThumbSettings,
          subtitle: l10n.scrollThumbVisibilitySubtitle,
          body: const ScrollThumbSettings(),
        );
      },
    );
  }
}

class ScrollThumbSettings extends ConsumerWidget {
  const ScrollThumbSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(scrollThumbVisibilityProvider);
    final duration = ref.watch(scrollThumbDurationProvider);
    final height = ref.watch(scrollThumbHeightProvider);
    final width = ref.watch(scrollThumbWidthProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          _ScrollThumbPreview(visible: visible, height: height, width: width),
          const SizedBox(height: 16),
          SwitchListTile(
            contentPadding: .zero,
            title: Text(l10n.scrollThumbVisibility),
            secondary: const Icon(Icons.swap_vert),
            value: visible,
            onChanged: notifier.setScrollThumbVisibility,
          ),
          ListTile(
            contentPadding: .zero,
            leading: const Icon(Icons.timelapse),
            title: Text(l10n.scrollThumbDuration),
            subtitle: Text(_labelDuration(duration.inMilliseconds)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => AppBottomSheet.show(
              context,
              title: l10n.scrollThumbDuration,
              subtitle: l10n.scrollThumbDurationDescription,
              body: const ScrollThumbDurationTile(),
            ),
          ),
          ListTile(
            contentPadding: .zero,
            leading: const Icon(Icons.height),
            title: Text(l10n.scrollThumbHeight),
            subtitle: Text('${height.toInt()} px'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => AppBottomSheet.show(
              context,
              title: l10n.scrollThumbHeight,
              subtitle: l10n.scrollThumbHeightDescription,
              body: const ScrollThumbHeightTile(),
            ),
          ),
          ListTile(
            contentPadding: .zero,
            leading: const Icon(Icons.horizontal_rule),
            title: Text(l10n.scrollThumbWidth),
            subtitle: Text('${width.toInt()} px'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => AppBottomSheet.show(
              context,
              title: l10n.scrollThumbWidth,
              subtitle: l10n.scrollThumbWidthDescription,
              body: const ScrollThumbWidthTile(),
            ),
          ),
        ],
      ),
    );
  }
}

String _labelDuration(int ms) =>
    '${(ms / Duration.millisecondsPerSecond).toStringAsFixed(1)}s';

class _ScrollThumbPreview extends StatelessWidget {
  const _ScrollThumbPreview({
    required this.visible,
    required this.height,
    required this.width,
  });

  final bool visible;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      height: 200,
      padding: const .all(16),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: .circular(kRadius),
      ),
      child: Stack(
        children: [
          ...List.generate(
            6,
            (i) => Positioned(
              left: 0,
              right: 48,
              top: 24 + i * 28,
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: scheme.onSurfaceVariant.withValues(alpha: 0.2),
                  borderRadius: .circular(6),
                ),
              ),
            ),
          ),
          if (visible)
            Positioned(
              right: 0,
              top: (200 - 32 - height) / 2,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: .horizontal(left: .circular(height)),
                ),
                child: Icon(
                  Icons.unfold_more,
                  color: scheme.onPrimaryContainer,
                  size: (height * 0.5).clamp(12, 36),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
