import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/storage/hive_box_specs.dart';
import 'package:storii/features/settings/logic/storage/hive_storage_provider.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class AppDataManagerTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.sd_storage_outlined),
      trailing: const Icon(Icons.chevron_right),
      title: Text(l10n.appDataManager),
      onTap: () => context.push(AppRoute.storage.path),
    );
  }
}

class AppDataManagerScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(hiveStorageProvider);
    final total = entries.fold<int>(0, (sum, e) => sum + e.stats.bytes);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          l10n.appDataManager,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            tooltip: l10n.refresh,
            onPressed: () => ref.read(hiveStorageProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView(
        children: [
          _TotalSizeHeader(bytes: total, count: entries.length),
          const Divider(thickness: 1.5),
          ...entries.map((entry) => _BoxTile(entry: entry)),
        ],
      ),
    );
  }
}

class _TotalSizeHeader extends ConsumerWidget {
  const new({required this.bytes, required this.count});

  final int bytes;
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final useBinary = ref.watch(useBinaryBytesProvider);

    return Padding(
      padding: const .symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: scheme.onSurface, shape: .circle),
            child: Padding(
              padding: const .all(12),
              child: Icon(
                Icons.storage_rounded,
                color: scheme.surfaceContainerLow,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              formatBytes(bytes, useBinary: useBinary),
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: .w600,
                fontFeatures: const [.tabularFigures()],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              borderRadius: .circular(kRadiusLg),
            ),
            child: Padding(
              padding: const .symmetric(horizontal: 12, vertical: 6),
              child: Text(
                l10n.entries(count),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: scheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BoxTile extends ConsumerWidget {
  const new({required this.entry});

  final HiveBoxEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final useBinary = ref.watch(useBinaryBytesProvider);
    final spec = entry.spec;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .fromLTRB(16, 16, 16, 0),
          child: Row(
            spacing: 12,
            children: [
              Icon(spec.icon, size: 24, color: scheme.onSurfaceVariant),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(spec.label, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(
                      spec.description,
                      maxLines: 2,
                      overflow: .ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: .end,
                children: [
                  Text(
                    formatBytes(entry.stats.bytes, useBinary: useBinary),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontFeatures: const [.tabularFigures()],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.entries(entry.stats.entries),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const .fromLTRB(16, 0, 4, 4),
          child: Row(
            mainAxisAlignment: .end,
            children: [
              if (spec.canReset) ...[
                AppTextButton(
                  onPressed: () => _handleAction(context, ref, spec, .reset),
                  text: l10n.delete,
                ),
              ],
              AppTextButton(
                onPressed: () => _handleAction(context, ref, spec, .compact),
                text: l10n.shrink,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

enum _BoxAction { compact, reset }

Future<void> _handleAction(
  BuildContext context,
  WidgetRef ref,
  HiveBoxSpec spec,
  _BoxAction action,
) async {
  switch (action) {
    case .compact:
      await ref.read(hiveStorageProvider.notifier).compact(spec);
    case .reset:
      final confirmed = await AppDialog.show<bool>(
        context,
        title: spec.label,
        body: Text(
          spec.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actionLabel: l10n.delete,
        actionIcon: Icons.delete_sweep_outlined,
        isDestructive: true,
        onTap: () async {},
      );
      if (confirmed != true || !context.mounted) return;
      await ref.read(hiveStorageProvider.notifier).reset(spec);
  }
}
