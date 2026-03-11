import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/dashed_underline.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class CoverImageTitle extends StatelessWidget {
  const CoverImageTitle(this.item, {super.key});
  final LibraryItem item;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Stack(
      children: [
        Material(
          child: AspectRatio(
            aspectRatio: 1,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: ImageWidget(
                id: item.id,
                type: .item,
                updatedAt: item.updatedAt,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const .symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  margin: const .only(bottom: 16, top: kToolbarHeight + 16),
                  width: (size.width * 0.6).clamp(240, 360),
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: kBorderRadius,
                      child: ImageWidget(
                        id: item.id,
                        type: .item,
                        updatedAt: item.updatedAt,
                      ),
                    ),
                  ),
                ),
                MarqueeText(
                  item.title ?? l.noTitle,
                  style: theme.textTheme.headlineMedium,
                ),
                if (item.mediaType == .book) ...[
                  Wrap(
                    alignment: .center,
                    spacing: 16,
                    runSpacing: 8,
                    children: item.authors.map((author) {
                      return InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context.push(
                            AppRoute.authorDetail.path,
                            extra: author.id,
                          );
                        },
                        child: CustomPaint(
                          painter: DashedUnderlinePainter(
                            color: theme.colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.7),
                          ),
                          child: Text(
                            author.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: .w600,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                ],
                if (item.mediaType == .podcast && item.authorName != null)
                  MarqueeText(
                    item.authorName!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: .w600,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
