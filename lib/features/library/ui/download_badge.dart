import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';

class DownloadBadge extends ConsumerWidget {
  const new({
    super.key,
    required this.itemId,
    this.episodeId,
    this.fillColor = true,
  });

  final String itemId;
  final String? episodeId;
  final bool fillColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadStatus = ref.watch(
      downloadItemProvider(itemId, episodeId).select((s) => s?.status),
    );
    if (downloadStatus == null) return const SizedBox.shrink();

    final scheme = Theme.of(context).colorScheme;
    final isError = downloadStatus == .failed;
    final isNeutral = switch (downloadStatus) {
      .queued || .waiting || .paused => true,
      _ => false,
    };

    final baseColor = isError
        ? scheme.error
        : isNeutral
        ? scheme.outline
        : scheme.primary;
    final containerColor = isError
        ? scheme.errorContainer
        : isNeutral
        ? scheme.surfaceContainerHighest
        : scheme.primaryContainer;
    final contentColor = isError
        ? scheme.onErrorContainer
        : isNeutral
        ? scheme.onSurfaceVariant
        : scheme.onPrimaryContainer;
    final iconColor = fillColor ? contentColor : baseColor;

    final iconData = switch (downloadStatus) {
      .completed => Icons.file_download_outlined,
      .downloading || .paused => Icons.downloading_outlined,
      .queued => Icons.schedule_outlined,
      .waiting => Icons.wifi_off_outlined,
      .failed => Icons.error_outline_outlined,
    };

    return Tooltip(
      message: downloadStatus.label,
      child: Container(
        alignment: .center,
        padding: const .all(4),
        decoration: BoxDecoration(
          color: fillColor ? containerColor : Colors.transparent,
          borderRadius: .circular(kRadiusSm),
          border: fillColor ? null : .all(width: 1, color: baseColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(iconData, size: 16, color: iconColor),
      ),
    );
  }
}
