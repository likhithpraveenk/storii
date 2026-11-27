import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/widget_config.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/widget/logic/widget_controller.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/press_feedback.dart';

class WidgetGridCard extends ConsumerWidget {
  const new(this.widgetId, {super.key, this.config});

  final WidgetConfig? config;
  final int widgetId;

  bool get _isNowPlaying => config?.source == .nowPlaying;

  bool get _isBound => _isNowPlaying || config?.itemId != null;

  Future<void> _showOptions(BuildContext context, WidgetRef ref) async {
    await AppBottomSheet.show(
      context,
      title: l10n.more,
      body: Builder(
        builder: (sheetCtx) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(
                  _isBound ? l10n.widgetRebind : l10n.widgetTapToBind,
                ),
                onTap: () async {
                  Navigator.of(sheetCtx).pop();
                  await ref
                      .read(widgetControllerProvider.notifier)
                      .prepareWidgetForBinding(widgetId);
                  ref.invalidate(availableWidgetConfigsProvider);
                },
              ),
              if (!_isNowPlaying)
                ListTile(
                  leading: const Icon(Icons.play_circle_outline),
                  title: Text(l10n.widgetFollowNowPlaying),
                  onTap: () async {
                    Navigator.of(sheetCtx).pop();
                    await ref
                        .read(widgetControllerProvider.notifier)
                        .bindWidgetToNowPlaying(widgetId);
                    ref.invalidate(availableWidgetConfigsProvider);
                  },
                ),
              const SizedBox(height: kSpacingXl),
            ],
          );
        },
      ),
    );
  }

  Widget _coverFor(String itemId) {
    final localPath = config?.coverPath;
    if (localPath != null) {
      return Image.file(
        File(localPath),
        fit: .cover,
        errorBuilder: (context, _, _) => _networkCover(itemId),
      );
    }
    return _networkCover(itemId);
  }

  Widget _networkCover(String itemId) {
    return ImageWidget(
      id: itemId,
      type: .item,
      updatedAt: config?.updatedAt,
      inList: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final itemId = _isNowPlaying
        ? ref.watch(sessionProvider.select((s) => s?.libraryItemId)) ??
              config?.itemId
        : config?.itemId;
    return PressFeedback(
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: .circular(kRadius),
          child: Material(
            color: theme.colorScheme.surface,
            child: InkWell(
              onTap: () => _showOptions(context, ref),
              onLongPress: () => _showOptions(context, ref),
              child: Stack(
                fit: .expand,
                children: [
                  if (itemId == null || itemId.isEmpty)
                    ColoredBox(
                      color: theme.colorScheme.surfaceContainerHigh,
                      child: Center(
                        child: Padding(
                          padding: const .all(kSpacingSm),
                          child: Text(
                            itemId == null
                                ? l10n.widgetUnbound
                                : l10n.nowPlaying,
                            textAlign: .center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    _coverFor(itemId),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Material(
                      color: theme.colorScheme.primaryFixedDim,
                      borderRadius: .circular(kRadiusXs),
                      child: Padding(
                        padding: const .all(4),
                        child: Icon(
                          Icons.more_vert,
                          size: 18,
                          color: theme.colorScheme.onPrimaryFixed,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
