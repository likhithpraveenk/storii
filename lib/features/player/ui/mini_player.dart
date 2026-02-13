import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/waveform.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final itemAsync = ref.watch(currentItemProvider);

    return itemAsync.maybeWhen(
      orElse: () => const Center(child: RandomWaveform()),
      data: (item) {
        if (item == null) {
          return const SizedBox.shrink();
        }
        return Container(
          padding: const .all(8),
          decoration: BoxDecoration(
            borderRadius: const .only(
              topLeft: .circular(4),
              topRight: .circular(4),
            ),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Row(
            children: [
              const SizedBox(width: imgSizeInMiniPlayer),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      item.title ?? l.noTitle,
                      style: const TextStyle(fontWeight: .bold),
                      maxLines: 1,
                    ),
                    Text(
                      item.authorName ?? l.noAuthor,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {},
              ),
              IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
              IconButton(icon: const Icon(Icons.skip_next), onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
