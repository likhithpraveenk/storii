import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';

class ButtonLayoutBig extends ConsumerWidget {
  const ButtonLayoutBig({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: const AppSeekButtonBig(isForward: false),
                  ),
                  SizedBox(
                    width: playWidth,
                    height: seekSize,
                    child: const PlayButtonBig(),
                  ),
                  SizedBox(
                    width: seekSize,
                    height: seekSize,
                    child: const AppSeekButtonBig(isForward: true),
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
                    child: const _SkipButtonBig(isForward: false),
                  ),
                  SizedBox(
                    width: playWidth,
                    height: height,
                    child: const FullPlayerActionsBig(),
                  ),
                  SizedBox(
                    width: skipWidth,
                    height: height,
                    child: const _SkipButtonBig(isForward: true),
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

  const _SkipButtonBig({required this.isForward});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNone = ref.watch(playerBackgroundThemeProvider) == .none;
    final scheme = Theme.of(context).colorScheme;

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
