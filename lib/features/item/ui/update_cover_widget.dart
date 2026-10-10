import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/item/logic/item_metadata_notifier.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class UpdateCoverWidget extends ConsumerWidget {
  const new(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final orientation = MediaQuery.orientationOf(context);
    final imageSize = orientation == .portrait
        ? screenWidth * 0.7
        : screenWidth * 0.5;
    final editorState = ref.watch(itemMetadataProvider(id));
    final updatedAt = editorState.value?.updatedAt;
    final notifier = ref.read(itemMetadataProvider(id).notifier);

    return Stack(
      alignment: .center,
      children: [
        Padding(
          padding: const .all(24),
          child: SizedBox.square(
            dimension: imageSize,
            child: ClipRRect(
              borderRadius: .circular(kRadius),
              child: ImageWidget(
                id: id,
                type: .item,
                isRaw: true,
                updatedAt: updatedAt,
              ),
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 12,
          child: Column(
            spacing: 4,
            children: [
              Material(
                color: theme.colorScheme.surfaceContainerHighest,
                shape: const CircleBorder(),
                elevation: 2,
                child: IconButton(
                  onPressed: () async {
                    final msg = await notifier.pickAndUploadCover();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showAppSnackBar(msg);
                    }
                  },
                  icon: const Icon(Icons.file_upload_outlined, size: 18),
                  tooltip: l10n.upload,
                  visualDensity: .compact,
                ),
              ),
              const SizedBox(width: 4),
              Material(
                color: theme.colorScheme.surfaceContainerHighest,
                shape: const CircleBorder(),
                elevation: 2,
                child: IconButton(
                  onPressed: () => AppDialog.show(
                    context,
                    title: l10n.confirmRemoveCoverQ,
                    actionLabel: l10n.remove,
                    isDestructive: true,
                    onTap: () async {
                      final success = await notifier.removeCover();
                      if (!success && context.mounted) {
                        ScaffoldMessenger.of(context)
                            .showAppSnackBar(l10n.failed, isError: true);
                      }
                    },
                  ),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  tooltip: l10n.remove,
                  visualDensity: .compact,
                ),
              ),
              // TODO: add cover url via provider(all, best, specific) or textfield
            ],
          ),
        ),
      ],
    );
  }
}
