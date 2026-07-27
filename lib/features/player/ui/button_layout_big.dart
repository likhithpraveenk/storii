import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/player_theme.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';

class ButtonLayoutBig extends ConsumerWidget {
  const ButtonLayoutBig({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTheme = Theme.of(context);
    final scheme =
        ref.watch(playerThemeProvider(defaultTheme.brightness))?.colorScheme ??
        defaultTheme.colorScheme;

    return Padding(
      padding: const .symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: .min,
        children: [
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              const gaps = 8 * 2;
              final totalWidth = constraints.maxWidth - gaps;
              final unit = totalWidth / 13;
              final seekSize = unit * 4;
              final playWidth = unit * 5;

              return Row(
                spacing: 8,
                children: [
                  SizedBox(
                    width: seekSize,
                    height: seekSize,
                    child: AppSeekButtonBig(isForward: false, scheme: scheme),
                  ),
                  SizedBox(
                    width: playWidth,
                    height: seekSize,
                    child: PlayButtonBig(scheme: scheme),
                  ),
                  SizedBox(
                    width: seekSize,
                    height: seekSize,
                    child: AppSeekButtonBig(isForward: true, scheme: scheme),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              const gaps = 8 * 2;
              final totalWidth = constraints.maxWidth - gaps;
              final unit = totalWidth / 13;
              final skipWidth = unit * 4;
              final playWidth = unit * 5;
              final height = skipWidth / 1.5;

              return Row(
                spacing: 8,
                children: [
                  SizedBox(
                    width: skipWidth,
                    height: height,
                    child: _SkipButtonBig(isForward: false, scheme: scheme),
                  ),
                  SizedBox(
                    width: playWidth,
                    height: height,
                    child: FullPlayerActionsBig(scheme: scheme),
                  ),
                  SizedBox(
                    width: skipWidth,
                    height: height,
                    child: _SkipButtonBig(isForward: true, scheme: scheme),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkipButtonBig extends ConsumerWidget {
  final bool isForward;

  final ColorScheme scheme;

  const _SkipButtonBig({required this.isForward, required this.scheme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNone = ref.watch(playerBackgroundThemeProvider) == .none;
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      clipBehavior: .antiAlias,
      child: InkWell(
        onTap: () {
          if (isForward) {
            audioHandler.skipToNext();
          } else {
            audioHandler.skipToPrevious();
          }
        },
        child: Icon(
          isForward ? Icons.skip_next : Icons.skip_previous,
          size: 40,
          color: isNone ? scheme.onSurface : scheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
