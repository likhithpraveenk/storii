import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';

class CoverImage extends StatelessWidget {
  const CoverImage(this.item, {super.key});
  final ItemDomain item;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);

    return SliverAppBar(
      expandedHeight: (size.width * 0.8).clamp(320.0, 480.0),
      pinned: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: LayoutBuilder(
        builder: (context, constraints) {
          final settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
          final deltaExtent = settings!.maxExtent - settings.minExtent;
          final t =
              (1.0 -
                      (settings.currentExtent - settings.minExtent) /
                          deltaExtent)
                  .clamp(0.0, 1.0);
          final isCollapsed = t == 1;

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isCollapsed ? 1.0 : 0.0,
            child: Text(
              item.title ?? l.noTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),
      titleSpacing: 0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [.zoomBackground],
        background: Stack(
          fit: .expand,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: ImageWidget(
                id: item.id,
                type: .item,
                updatedAt: item.updatedAt,
              ),
            ),
            Center(
              child: SafeArea(
                child: Padding(
                  padding: const .symmetric(vertical: 24),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      margin: const .all(16),
                      decoration: BoxDecoration(
                        borderRadius: AppStyles.circularRadius,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
