import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class PlaylistCard extends StatelessWidget {
  const new(this.playlist, {super.key});
  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () =>
          context.push(AppRoute.playlistDetail.path, extra: playlist.id),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: .min,
        children: [
          _PlaylistStack(playlist),
          const SizedBox(height: 8),
          Text(
            playlist.name,
            maxLines: 1,
            overflow: .ellipsis,
            style: textTheme.titleSmall?.copyWith(fontWeight: .bold),
          ),
        ],
      ),
    );
  }
}

const _kMinSpacingRatio = 0.2;
const _kMaxSpacingRatio = 0.7;
const _kItemSizeRatio = 0.5;

class _PlaylistStack extends StatelessWidget {
  const new(this.playlist);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (playlist.items.isEmpty) {
          return ClipRRect(
            borderRadius: .circular(kRadius),
            child: PlaceholderImage(label: l10n.noImage),
          );
        }

        final maxWidth = constraints.maxWidth;
        final itemSize = maxWidth * _kItemSizeRatio;

        final visibleItems = playlist.items.reversed.take(4).toList();
        final count = visibleItems.length;
        final spacing = count <= 1
            ? 0.0
            : count == 2
            ? itemSize
            : ((maxWidth - itemSize) / (count - 1)).clamp(
                itemSize * _kMinSpacingRatio,
                itemSize * _kMaxSpacingRatio,
              );
        final start = -(count - 1) * spacing / 2;

        return Container(
          height: itemSize,
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
                final item = visibleItems[reverseIndex];
                final xOffset = start + reverseIndex * spacing;

                return Transform.translate(
                  offset: Offset(xOffset, 0),
                  child: Container(
                    width: itemSize,
                    height: itemSize,
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
                      child: ImageWidget(id: item.libraryItemId, type: .item),
                    ),
                  ),
                );
              }),
              Positioned(
                top: 6,
                right: 6,
                child: StackBadge(playlist.items.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
