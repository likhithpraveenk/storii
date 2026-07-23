import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/themed_background.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemId = ref.watch(sessionProvider.select((s) => s?.libraryItemId));
    if (itemId == null) {
      return const SizedBox.shrink();
    }
    final displayTitle = ref.watch(
      sessionProvider.select((s) => s?.displayTitle),
    );

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isPlaying = ref.watch(isPlayingProvider);
    final playbackStatus = ref.watch(playbackStatusProvider).value;
    final isLoading = playbackStatus == .buffering;

    final totalDuration = ref.watch(totalDurationProvider);
    final globalPosition =
        ref.watch(globalPositionProvider).value ?? Duration.zero;
    final remaining = totalDuration - globalPosition;
    final remainingStr = remaining.toReadableDuration(isLeft: true);
    final showSeekButtons = ref.watch(showMiniPlayerSeekButtonsProvider);

    return ThemedBackground(
      miniplayer: true,
      child: Padding(
        padding: const .all(8),
        child: Row(
          children: [
            const SizedBox(width: imgSizeInMiniPlayer),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  MarqueeText(
                    displayTitle ?? l10n.noTitle,
                    style: textTheme.labelLarge?.copyWith(fontWeight: .bold),
                  ),
                  Text(
                    remainingStr,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            ),
            if (showSeekButtons)
              IconButton(
                icon: const Icon(Icons.replay, size: 20),
                onPressed: audioHandler.rewind,
              ),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 30),
              onPressed: isLoading ? null : audioHandler.togglePlay,
            ),
            if (showSeekButtons)
              IconButton(
                onPressed: audioHandler.fastForward,
                icon: Transform.flip(
                  flipX: true,
                  child: const Icon(Icons.replay, size: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
