import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class StackedImagesCard extends StatelessWidget {
  const new({
    required this.itemIds,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.progress,
    super.key,
  });
  final List<String> itemIds;
  final String title;
  final String? subtitle;
  final void Function() onTap;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          _ImageStack(itemIds: itemIds, progress: progress),
          const SizedBox(height: 8),
          Column(
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.titleSmall
                    ?.copyWith(fontWeight: .bold),
              ),
              if (subtitle != null && subtitle!.isNotEmpty)
                Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

const _kMinSpacingRatio = 0.2;
const _kMaxSpacingRatio = 0.7;
const _kImageSizeRatio = 0.5;

class _ImageStack extends ConsumerWidget {
  const new({required this.itemIds, this.progress});

  final List<String> itemIds;
  final double? progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final imagesVisible = ref.watch(stackedImagesVisibleProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (itemIds.isEmpty) {
          return ClipRRect(
            borderRadius: .circular(kRadius),
            child: PlaceholderImage(label: l10n.noImage),
          );
        }

        final maxWidth = constraints.maxWidth;
        final imageSize = maxWidth * _kImageSizeRatio;

        final visibleImages = itemIds.reversed.take(imagesVisible).toList();
        final count = visibleImages.length;
        final spacing = count <= 1
            ? 0.0
            : count == 2
            ? imageSize
            : ((maxWidth - imageSize) / (count - 1)).clamp(
                imageSize * _kMinSpacingRatio,
                imageSize * _kMaxSpacingRatio,
              );
        final start = -(count - 1) * spacing / 2;

        return Container(
          height: imageSize,
          width: double.infinity,
          decoration: BoxDecoration(
            color: scheme.primaryFixedDim.withValues(alpha: 0.2),
            borderRadius: .circular(kRadius),
          ),
          clipBehavior: .hardEdge,
          child: Stack(
            alignment: .center,
            children: [
              ...List.generate(count, (index) {
                final reverseIndex = count - 1 - index;
                final itemId = visibleImages[reverseIndex];
                final xOffset = start + reverseIndex * spacing;

                return Transform.translate(
                  offset: Offset(xOffset, 0),
                  child: SizedBox.square(
                    dimension: imageSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: .circular(kRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: reverseIndex == 0 ? 0.3 : 0.1,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: .circular(kRadius),
                        child: ImageWidget(id: itemId, type: .item),
                      ),
                    ),
                  ),
                );
              }),
              if (progress != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 2.4,
                    child: LinearProgressIndicator(
                      value: progress,
                      borderRadius: .circular(kRadius),
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress == 1.0 ? appGreenColor : appRedColor,
                      ),
                    ),
                  ),
                ),
              Positioned(top: 6, right: 6, child: StackBadge(itemIds.length)),
            ],
          ),
        );
      },
    );
  }
}
