import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/settings/logic/app_cache.dart';

class ThemedBackground extends ConsumerWidget {
  const ThemedBackground({super.key, this.miniplayer = false, this.child});

  final Widget? child;
  final bool miniplayer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundTheme = ref.watch(playerBackgroundThemeProvider);
    final scheme = Theme.of(context).colorScheme;

    final itemId = ref.watch(sessionProvider.select((s) => s?.libraryItemId));
    String? coverUrl;
    if (itemId != null && backgroundTheme != .none) {
      coverUrl = ref.watch(coverUrlProvider(itemId, type: .item, width: 600));
    }

    final decoration = switch (backgroundTheme) {
      .none => BoxDecoration(color: scheme.surface),
      .colored => BoxDecoration(color: scheme.surface),
      .gradient => BoxDecoration(
        gradient: miniplayer
            ? LinearGradient(
                begin: .centerLeft,
                end: .centerRight,
                colors: [scheme.onPrimary, scheme.surface],
              )
            : LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [scheme.onPrimary, scheme.surface],
              ),
      ),
      .blur => BoxDecoration(
        color: scheme.surface,
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
        fit: .expand,
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
                  scheme.surface.withValues(alpha: 0.4),
                  scheme.surface.withValues(alpha: 0.85),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return ClipRRect(
      child: Stack(
        fit: .passthrough,
        children: [
          Positioned.fill(child: background),
          ?child,
        ],
      ),
    );
  }
}
