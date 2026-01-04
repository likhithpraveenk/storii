import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/image_cache.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/cover_url.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/dashed_underline.dart';

class CoverImage extends ConsumerWidget {
  const CoverImage(this.item, {super.key});
  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverUrl = ref.watch(currentUserProvider)?.serverUrl;
    final coverUrl = getCoverUrl(serverUrl, item.id, item.updatedAt, raw: true);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);
    final screenHeight = size.height;
    final screenWidth = size.width;

    Widget buildImage() {
      if (coverUrl == null) return PlaceholderImage(label: l.noImage);
      return CachedNetworkImage(
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
      );
    }

    return SliverAppBar(
      expandedHeight: screenHeight * 0.5,
      pinned: true,
      stretch: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

          final deltaExtent = settings.maxExtent - settings.minExtent;
          final rawT =
              ((settings.currentExtent - settings.minExtent) / deltaExtent)
                  .clamp(0.0, 1.0);
          final fadeT = rawT > 0.1 ? 0.0 : (1 - rawT);

          return FlexibleSpaceBar(
            titlePadding: .only(
              left: screenWidth * 0.14,
              bottom: screenWidth * 0.04,
            ),
            centerTitle: false,
            title: SafeArea(
              child: IgnorePointer(
                child: Opacity(
                  opacity: fadeT,
                  child: Text(
                    item.title ?? l.noTitle,
                    style: textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            background: Stack(
              fit: .expand,
              children: [
                if (coverUrl != null)
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 30,
                      sigmaY: 30,
                      tileMode: .clamp,
                    ),
                    child: buildImage(),
                  ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: .topCenter,
                      end: .bottomCenter,
                      colors: [
                        Colors.transparent,
                        scheme.surface.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: .fromLTRB(
                        screenWidth * 0.16,
                        screenHeight * 0.1,
                        screenWidth * 0.16,
                        0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: .circular(12),
                          child: buildImage(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const .symmetric(horizontal: 24),
                      child: Text(
                        item.title ?? l.noTitle,
                        style:
                            (item.title == null
                                    ? textTheme.labelSmall
                                    : textTheme.titleLarge)
                                ?.copyWith(
                                  shadows: [
                                    Shadow(
                                      color: scheme.onSurfaceVariant.withValues(
                                        alpha: 0.25,
                                      ),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                        textAlign: .center,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        alignment: .center,
                        children: [
                          InkWell(
                            onTap: () {
                              // TODO: join table get authors
                              debugPrint('Clicked author: ${item.authorName}');
                            },
                            borderRadius: .circular(4),
                            child: CustomPaint(
                              painter: DashedUnderlinePainter(
                                color: scheme.onSurfaceVariant,
                              ),
                              child: Padding(
                                padding: const .only(bottom: 2),
                                child: Text(
                                  item.authorName ?? l.noAuthor,
                                  style: textTheme.titleSmall?.copyWith(
                                    color: scheme.onSurface,
                                    shadows: [
                                      Shadow(
                                        color: scheme.onSurfaceVariant
                                            .withValues(alpha: 0.25),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
