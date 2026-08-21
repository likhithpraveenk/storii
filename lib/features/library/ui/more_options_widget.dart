import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/admin/logic/item_actions_provider.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/item/logic/user_progress_actions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

Future<void> showMoreItemOptionsSheet(
  BuildContext context, {
  required String itemId,
  String? episodeId,
  bool inDetailScreen = false,
  bool fromContinueListening = false,
  bool fromContinueSeries = false,
  String? seriesId,
}) => AppBottomSheet.show(
  context,
  title: l10n.more,
  body: _MoreOptionsWidget(
    itemId: itemId,
    episodeId: episodeId,
    inDetailScreen: inDetailScreen,
    fromContinueListening: fromContinueListening,
    fromContinueSeries: fromContinueSeries,
    seriesId: seriesId,
  ),
);

typedef _Option = ({
  String title,
  IconData icon,
  Future<void> Function() onTap,
});

class _MoreOptionsWidget extends ConsumerStatefulWidget {
  const _MoreOptionsWidget({
    required this.itemId,
    this.episodeId,
    required this.inDetailScreen,
    required this.fromContinueListening,
    required this.fromContinueSeries,
    this.seriesId,
  });

  final String itemId;
  final String? episodeId;
  final bool inDetailScreen;
  final bool fromContinueListening;
  final bool fromContinueSeries;
  final String? seriesId;

  @override
  ConsumerState<_MoreOptionsWidget> createState() => _MoreOptionsWidgetState();
}

class _MoreOptionsWidgetState extends ConsumerState<_MoreOptionsWidget> {
  var _isBusy = false;

  Future<void> _runWithLoading(
    Future<bool> Function() action,
    String success,
    String failure,
  ) async {
    if (_isBusy) return;
    setState(() => _isBusy = true);
    final successResult = await action();
    if (!mounted) return;
    setState(() => _isBusy = false);
    globalMessengerKey.currentState?.hideCurrentSnackBar();
    globalMessengerKey.currentState?.showAppSnackBar(
      successResult ? success : failure,
      isError: !successResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = ref.watch(isUserAdminProvider);
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(widget.itemId, widget.episodeId))
        .value;

    final options = <_Option>[];
    if (mediaProgress != null &&
        mediaProgress.isFinished == true &&
        !widget.inDetailScreen) {
      options.add((
        title: l10n.removeProgress,
        icon: Icons.delete_outline,
        onTap: () => _runWithLoading(
          () => ref
              .read(
                userProgressActionsProvider(
                  widget.itemId,
                  widget.episodeId,
                ).notifier,
              )
              .remove(mediaProgress.id),
          l10n.progressRemoved,
          l10n.progressRemoveFailed,
        ),
      ));
    }

    if (mediaProgress?.isFinished != true && !widget.inDetailScreen) {
      options.add((
        title: l10n.markAsComplete,
        icon: Icons.beenhere_outlined,
        onTap: () => _runWithLoading(
          () => ref
              .read(
                userProgressActionsProvider(
                  widget.itemId,
                  widget.episodeId,
                ).notifier,
              )
              .markComplete(),
          l10n.progressMarkedComplete,
          l10n.progressMarkCompleteFailed,
        ),
      ));
    }

    if (widget.fromContinueListening && mediaProgress != null) {
      options.add((
        title: l10n.removeFromContinueListening,
        icon: Icons.playlist_remove,
        onTap: () => _runWithLoading(
          () => ref
              .read(
                userProgressActionsProvider(
                  widget.itemId,
                  widget.episodeId,
                ).notifier,
              )
              .removeFromContinueListening(mediaProgress.id),
          l10n.removedFromContinueListening,
          l10n.removeFromContinueListeningFailed,
        ),
      ));
    }

    if (widget.fromContinueSeries && widget.seriesId != null) {
      options.add((
        title: l10n.removeSeriesFromContinueListening,
        icon: Icons.playlist_remove,
        onTap: () => _runWithLoading(
          () => ref
              .read(
                userProgressActionsProvider(
                  widget.itemId,
                  widget.episodeId,
                ).notifier,
              )
              .removeSeriesFromContinueListening(widget.seriesId!),
          l10n.seriesRemovedFromContinueListening,
          l10n.removeSeriesFromContinueListeningFailed,
        ),
      ));
    }

    final downloaded = ref.watch(
      downloadItemProvider(widget.itemId, widget.episodeId),
    );
    if (downloaded != null) {
      options.add((
        title: l10n.removeDownloadQ,
        icon: Icons.delete_outline,
        onTap: () async {
          await ref
              .read(downloadQueueProvider.notifier)
              .delete(widget.itemId, widget.episodeId);
        },
      ));
    }

    if (isAdmin) {
      options.add((
        title: l10n.reScan,
        icon: Icons.refresh,
        onTap: () async {
          if (_isBusy) return;
          setState(() => _isBusy = true);
          final message = await ref
              .read(scanItemProvider.notifier)
              .scan(widget.itemId);
          if (!mounted) return;
          setState(() => _isBusy = false);
          globalMessengerKey.currentState?.hideCurrentSnackBar();
          if (message != null) {
            globalMessengerKey.currentState?.showAppSnackBar(message);
          }
        },
      ));
    }

    return Column(
      children: [
        if (_isBusy)
          const Padding(
            padding: .only(bottom: 8),
            child: LinearProgressIndicator(),
          ),
        ...options.map(
          (e) => ListTile(
            title: Text(e.title),
            leading: Icon(e.icon),
            enabled: !_isBusy,
            onTap: _isBusy
                ? null
                : () async {
                    await e.onTap.call();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
          ),
        ),
      ],
    );
  }
}
