import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/image_cache.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/cover_url.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';

class LibraryItemCard extends ConsumerWidget {
  const LibraryItemCard(this.item, {super.key});
  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    final serverUrl = ref.watch(currentUserProvider)?.serverUrl;
    final coverUrl = getCoverUrl(
      serverUrl,
      item.id,
      item.updatedAt,
      width: 400,
    );

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
                  coverUrl != null
                      ? CachedNetworkImage(
                          cacheManager: imageCacheManager,
                          imageUrl: coverUrl,
                          fit: BoxFit.cover,
                          placeholder: (_, _) => const PlaceholderImage(),
                          errorWidget: (context, url, error) {
                            if (kDebugMode) {
                              debugPrint('CachedNetworkImage: $error');
                            }
                            if (error.toString().contains('404')) {
                              return PlaceholderImage(label: l.noImage);
                            }
                            return PlaceholderImage(label: l.errorImage);
                          },
                        )
                      : PlaceholderImage(label: l.noImage),
                  if (item.progress > 0)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 6,
                        child: LinearProgressIndicator(
                          value: item.progress * 100,
                          borderRadius: .circular(16),
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            item.isFinished ? scheme.primary : scheme.error,
                          ),
                        ),
                      ),
                    ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () =>
                            context.push(AppRoute.item.withId(item.id)),
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
                item.title ?? l.noTitle,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                item.authorName ?? l.noAuthor,
                maxLines: 1,
                overflow: .ellipsis,
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

class LibraryItemCardListView extends ConsumerWidget {
  const LibraryItemCardListView(this.item, {super.key});
  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    final serverUrl = ref.watch(currentUserProvider)?.serverUrl;
    final coverUrl = getCoverUrl(serverUrl, item.id, item.updatedAt, width: 72);

    return Padding(
      padding: const .symmetric(vertical: 8),
      child: ListTile(
        onTap: () => context.push(AppRoute.item.withId(item.id)),
        leading: AspectRatio(
          aspectRatio: 1,
          child: coverUrl != null
              ? ClipRRect(
                  borderRadius: .circular(4),
                  child: CachedNetworkImage(
                    cacheManager: imageCacheManager,
                    imageUrl: coverUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => const PlaceholderImage(),
                    errorWidget: (context, url, error) {
                      if (kDebugMode) {
                        debugPrint('CachedNetworkImage: $error');
                      }
                      if (error.toString().contains('404')) {
                        return PlaceholderImage(label: l.noImage);
                      }
                      return PlaceholderImage(label: l.errorImage);
                    },
                  ),
                )
              : PlaceholderImage(label: l.noImage),
        ),
        title: Padding(
          padding: const .only(top: 8, left: 4),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                item.title ?? l.noTitle,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                item.authorName ?? l.noAuthor,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              if (item.progress > 0)
                Text(
                  l.percentCompleted((item.progress * 100).toStringAsFixed(1)),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
