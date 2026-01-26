import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final itemAsync = ref.watch(currentItemProvider);
    final playbackState = ref.watch(audioPlayerProvider).value;

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      padding: const .all(16),
      child: itemAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, stackTrace) => ErrorRetryWidget('$e'),
        data: (item) {
          if (item == null) return const SizedBox.shrink();

          final isPlaying = playbackState?.playing ?? false;
          final position =
              ref.watch(globalPositionProvider).value ?? Duration.zero;

          final totalDuration = ref.watch(totalBookDurationProvider);

          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  item.title ?? l.noTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  item.authorName ?? l.noAuthor,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 32),
                const BookSlider(),
                Padding(
                  padding: const .symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(_formatDuration(position)),
                      Text(_formatDuration(totalDuration)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 36),
                      onPressed: ref
                          .read(audioPlayerProvider.notifier)
                          .skipToStartOfChapter,
                    ),
                    IconButton(
                      icon: const Icon(Icons.replay_10, size: 36),
                      onPressed: ref.read(audioPlayerProvider.notifier).rewind,
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        size: 72,
                      ),
                      onPressed: () =>
                          ref.read(audioPlayerProvider.notifier).togglePlay(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.forward_10, size: 36),
                      onPressed: ref
                          .read(audioPlayerProvider.notifier)
                          .fastForward,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 36),
                      onPressed: ref
                          .read(audioPlayerProvider.notifier)
                          .skipToNextChapter,
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

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${d.inHours}:$minutes:$seconds';
  }
}
