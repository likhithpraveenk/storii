import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/player/logic/dominant_color.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/settings/logic/app_cache.dart';
import 'package:storii/shared/helpers/color_shading.dart';

class ThemedBackground extends ConsumerWidget {
  const ThemedBackground({super.key, this.miniplayer = false, this.child});

  final Widget? child;
  final bool miniplayer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundTheme = ref.watch(playerBackgroundThemeProvider);
    final itemId = ref.watch(sessionProvider.select((s) => s?.libraryItemId));

    final surface = Theme.of(context).colorScheme.surface;
    final brightness = Theme.of(context).brightness;

    String? coverUrl;
    if (itemId != null && backgroundTheme != .none) {
      coverUrl = ref.watch(coverUrlProvider(itemId, type: .item, width: 600));
    }

    final dominant = coverUrl != null
        ? ref.watch(dominantColorProvider(coverUrl)).value
        : null;

    final decoration = switch (backgroundTheme) {
      .none => BoxDecoration(color: surface),
      .colored => BoxDecoration(
        color: dominant != null
            ? shadeForBrightness(dominant, brightness)
            : surface,
      ),
      .gradient => BoxDecoration(
        gradient: miniplayer
            ? LinearGradient(
                begin: .centerLeft,
                end: .centerRight,
                colors: [
                  dominant != null
                      ? shadeForBrightness(dominant, brightness)
                      : surface,
                  surface,
                ],
              )
            : LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  dominant ?? surface,
                  dominant != null ? darken(dominant, 0.2) : surface,
                  surface,
                ],
              ),
      ),
      .blur => BoxDecoration(
        color: surface,
        image: coverUrl != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(
                  coverUrl,
                  cacheManager: AppImageCacheManager.instance,
                ),
                fit: .cover,
              )
            : null,
      ),
    };

    Widget background = AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      decoration: decoration,
    );

    if (backgroundTheme == .blur && coverUrl != null) {
      background = Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: .blur(sigmaX: 40, sigmaY: 40),
            child: background,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  surface.withValues(alpha: 0.4),
                  surface.withValues(alpha: 0.85),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Stack(
      fit: .passthrough,
      children: [
        Positioned.fill(child: background),
        ?child,
      ],
    );
  }
}
