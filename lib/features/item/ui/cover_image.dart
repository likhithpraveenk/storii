import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/dashed_underline.dart';

class CoverImage extends ConsumerWidget {
  const CoverImage(this.item, {super.key});
  final ItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);

    return SliverAppBar(
      expandedHeight: (size.height * 0.54).clamp(450.0, 600.0),
      pinned: true,
      stretch: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
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
            titlePadding: const .only(left: 54, bottom: 16),
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
                ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 30,
                    tileMode: .clamp,
                  ),
                  child: ImageWidget(
                    id: item.id,
                    type: .item,
                    updatedAt: item.updatedAt,
                  ),
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
                Padding(
                  padding: const .symmetric(vertical: 24),
                  child: Column(
                    mainAxisAlignment: .end,
                    children: [
                      SizedBox(
                        width: (size.width * 0.8).clamp(0.0, 360),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: AppStyles.circularRadius,
                            child: ImageWidget(
                              id: item.id,
                              type: .item,
                              updatedAt: item.updatedAt,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const .symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.1,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              item.title ?? l.noTitle,
                              style: textTheme.titleLarge?.copyWith(
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
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: switch (item) {
                          final Audiobook a => Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            alignment: .center,
                            children: a.authors
                                .map(
                                  (author) => InkWell(
                                    onTap: () {
                                      context.push(
                                        AppRoute.authors.withId(author.id),
                                      );
                                    },
                                    borderRadius: .circular(4),
                                    child: CustomPaint(
                                      painter: DashedUnderlinePainter(
                                        color: scheme.onSurfaceVariant,
                                      ),
                                      child: Padding(
                                        padding: const .only(bottom: 2),
                                        child: Text(
                                          author.name,
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
                                )
                                .toList(),
                          ),
                          final Podcast _ => CustomPaint(
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
                                      color: scheme.onSurfaceVariant.withValues(
                                        alpha: 0.25,
                                      ),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
