import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';

class SeriesCard extends ConsumerWidget {
  const SeriesCard(this.series, {super.key});
  final SeriesDomain series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(12),
              boxShadow: [
                BoxShadow(
                  color: scheme.onSurface.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: .circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // TODO: series covers overlaping thing
                  // CachedNetworkImage(
                  //   cacheManager: imageCacheManager,
                  //   imageUrl: coverUrl,
                  //   fit: BoxFit.cover,
                  //   placeholder: (_, _) => const PlaceholderImage(),
                  //   errorWidget: (context, url, error) {
                  //     if (kDebugMode) {
                  //       debugPrint('CachedNetworkImage: $error');
                  //     }
                  //     if (error.toString().contains('404')) {
                  //       return PlaceholderImage(label: l.noImage);
                  //     }
                  //     return PlaceholderImage(label: l.errorImage);
                  //   },
                  // ),
                  PlaceholderImage(label: l.noImage),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () =>
                            context.push(AppRoute.seriesId.path, extra: series),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const .only(top: 8, left: 4),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                series.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              if (series.books != null)
                Text(
                  series.books!.length.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
