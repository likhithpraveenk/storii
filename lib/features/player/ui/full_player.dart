import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final itemAsync = ref.watch(currentItemProvider);

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      padding: const .all(16.0),
      child: itemAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, stackTrace) => ErrorRetryWidget('$e'),
        data: (item) {
          if (item == null) {
            return const SizedBox.shrink();
          }
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
                Slider(value: 0.4, onChanged: (v) {}),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 36),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_circle_filled, size: 72),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 36),
                      onPressed: () {},
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
}
