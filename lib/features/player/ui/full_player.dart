import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/player/logic/active_item_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/l10n/l10n.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(activeItemProvider);
    if (item == null) return const SizedBox.shrink();

    final isPlaying = ref.watch(playbackStateProvider).value?.playing ?? false;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const .all(16),
      child: Column(
        children: [
          GestureDetector(
            child: Text(
              item.title ?? AppLocalizations.of(context)!.noTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              ref.read(playerControllerProvider.notifier).toMini();
              context.go(AppRoute.itemDetail.withId(item.id));
            },
          ),
          Text(
            item.authorName ?? AppLocalizations.of(context)!.noAuthor,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: .center,
          ),
          BookSlider(
            totalDuration: item.map(
              audiobook: (a) => a.duration,
              podcast: (_) => Duration.zero,
            ),
          ),
          Padding(
            padding: const .symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const CurrentTimeText(),
                Text(
                  _formatDuration(
                    item.map(
                      audiobook: (a) => a.duration,
                      podcast: (_) => Duration.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, size: 36),
                onPressed: audioHandler.skipToNext,
              ),
              IconButton(
                icon: const Icon(Icons.replay_10, size: 36),
                onPressed: audioHandler.rewind,
              ),
              IconButton(
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: 72,
                ),
                onPressed: audioHandler.togglePlay,
              ),
              IconButton(
                icon: const Icon(Icons.forward_10, size: 36),
                onPressed: audioHandler.fastForward,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, size: 36),
                onPressed: audioHandler.skipToNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurrentTimeText extends ConsumerWidget {
  const CurrentTimeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(lowResPositionProvider).value ?? Duration.zero;
    return Text(_formatDuration(position));
  }
}

String _formatDuration(Duration d) {
  final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '${d.inHours}:$minutes:$seconds';
}
