import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/logic/storage_locations_provider.dart';
import 'package:storii/features/downloads/ui/download_widgets.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class ActiveDownloadsButton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeDownloads = ref.watch(activeDownloadsProvider);
    final activeCount = activeDownloads.length;
    if (activeDownloads.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        IconButton(
          tooltip: l10n.downloads,
          onPressed: () {
            context.push(
              AppRoute.downloads.path,
              extra: DownloadsScreenTab.active,
            );
          },
          icon: const Icon(Icons.file_download_outlined),
        ),
        if (activeCount > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const .all(3),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: .circle,
              ),
              child: Text(
                '$activeCount',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 9,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class DownloadButton extends ConsumerWidget {
  const new({
    super.key,
    required this.libraryItemId,
    this.episodeId,
    this.mediaType = .book,
  });

  final String libraryItemId;
  final String? episodeId;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canDownload =
        ref.watch(userPermissionsProvider).value?.download ?? false;
    if (!canDownload) return const SizedBox.shrink();

    final item = ref.watch(downloadItemProvider(libraryItemId, episodeId));
    final queue = ref.read(downloadQueueProvider.notifier);
    final scheme = Theme.of(context).colorScheme;

    return switch (item?.status) {
      null => IconButton(
        tooltip: l10n.download,
        icon: const Icon(Icons.file_download_outlined),
        onPressed: () async {
          final availableLocations = ref.read(
            storageLocationsByTypeProvider(mediaType),
          );
          final defaultUri = mediaType == .book
              ? ref.read(defaultDownloadsLocationAudiobooksProvider)
              : ref.read(defaultDownloadsLocationPodcastsProvider);
          final defaultLocation = availableLocations.firstWhereOrNull(
            (l) => l.uri == defaultUri,
          );
          if (defaultLocation != null) {
            return queue.enqueue(
              libraryItemId: libraryItemId,
              episodeId: episodeId,
              location: defaultLocation,
            );
          }
          if (availableLocations.length == 1) {
            return queue.enqueue(
              libraryItemId: libraryItemId,
              episodeId: episodeId,
              location: availableLocations.first,
            );
          }
          final location = await showDialog<StorageLocation?>(
            context: context,
            builder: (_) => ChooseLocationDialog(mediaType),
          );
          if (location != null) {
            return queue.enqueue(
              libraryItemId: libraryItemId,
              episodeId: episodeId,
              location: location,
            );
          }
        },
      ),
      .queued => IconButton(
        tooltip: l10n.queued,
        icon: Icon(Icons.schedule, color: scheme.outline),
        onPressed: () => queue.delete(libraryItemId, episodeId),
      ),
      .waiting => IconButton(
        tooltip: l10n.waitingForNetwork,
        icon: Icon(Icons.wifi_off, color: scheme.outline),
        onPressed: () => queue.delete(libraryItemId, episodeId),
      ),
      .downloading => _ProgressButton(
        progress: item!.progress,
        onCancel: () => queue.delete(libraryItemId, episodeId),
      ),
      .completed => IconButton(
        tooltip: l10n.downloaded,
        icon: const Icon(
          Icons.download_for_offline_outlined,
          color: appGreenColor,
        ),
        onPressed: () =>
            showDownloadsDeleteDialog(context, item: item!, ref: ref),
      ),
      .failed => IconButton(
        tooltip: l10n.downloadFailed,
        icon: Icon(Icons.refresh, color: scheme.error),
        onPressed: () => queue.resumeOrRetry(libraryItemId, episodeId),
      ),
      .paused => IconButton(
        tooltip: l10n.resumeDownload,
        icon: Icon(Icons.play_circle_outline, color: scheme.tertiary),
        onPressed: () => queue.resumeOrRetry(libraryItemId, episodeId),
      ),
    };
  }
}

class _ProgressButton extends StatelessWidget {
  const new({required this.progress, required this.onCancel});

  final double progress;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: '${(progress * 100).toStringAsFixed(0)}%',
      onPressed: onCancel,
      icon: Stack(
        alignment: .center,
        children: [
          SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(
              value: progress > 0 ? progress : null,
              strokeWidth: 2.5,
              color: scheme.primary,
            ),
          ),
          Icon(Icons.close, size: 12, color: scheme.onSurface),
        ],
      ),
    );
  }
}

class ChooseLocationDialog extends ConsumerStatefulWidget {
  const new(this.mediaType, {super.key});

  final MediaType mediaType;

  @override
  ConsumerState<ChooseLocationDialog> createState() =>
      _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends ConsumerState<ChooseLocationDialog> {
  bool _setAsDefault = false;

  @override
  Widget build(BuildContext context) {
    final locations = ref.watch(
      storageLocationsByTypeProvider(widget.mediaType),
    );
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const .symmetric(horizontal: 24, vertical: 40),
      child: Material(
        clipBehavior: .hardEdge,
        color: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(24),
          side: .new(
            width: 0.5,
            strokeAlign: BorderSide.strokeAlignInside,
            color: theme.colorScheme.primary,
          ),
        ),
        child: Padding(
          padding: const .symmetric(vertical: 24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                l10n.downloadLocation,
                style: bottomSheetTitleTextStyle(context),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              ...locations.map(
                (l) => ListTile(
                  leading: Icon(
                    l.isInternal ? Icons.memory : Icons.sd_card_outlined,
                  ),
                  title: Text(l.isInternal ? l10n.internalAppStorage : l.name),
                  subtitle: Text(l.uri.toUiPath(context)),
                  contentPadding: const .symmetric(horizontal: 16),
                  onTap: () async {
                    if (_setAsDefault) {
                      final notifier = ref.read(userSettingsProvider.notifier);
                      if (widget.mediaType == .book) {
                        await notifier.setDefaultDownloadsLocationAudiobooks(
                          l.uri,
                        );
                      } else {
                        await notifier.setDefaultDownloadsLocationPodcasts(
                          l.uri,
                        );
                      }
                    }
                    if (context.mounted) {
                      Navigator.of(context).pop(l);
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Icon(
                  _setAsDefault
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  size: 20,
                  color: _setAsDefault
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                onTap: () => setState(() => _setAsDefault = !_setAsDefault),
                title: Text(l10n.setAsDefault),
                subtitle: Text(l10n.removeDefaultLocationNote),
                visualDensity: .compact,
                contentPadding: const .symmetric(horizontal: 16),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const .symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.cancel),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
