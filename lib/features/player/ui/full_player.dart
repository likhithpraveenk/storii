import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/player/logic/active_item_provider.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsync = ref.watch(activeItemProvider);

    return itemAsync.when(
      loading: () => const Center(child: RandomWaveform()),
      error: (e, st) => ErrorRetryWidget('Error $e'),
      data: (item) {
        if (item == null) return const SizedBox.shrink();

        return Padding(
          padding: const .all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                GestureDetector(
                  child: Text(
                    item.title ?? AppLocalizations.of(context)!.noTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: .center,
                  ),
                  onTap: () {
                    ref.read(playerModeProvider.notifier).toMini();
                    context.go(AppRoute.itemDetail.withId(item.id));
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  item.authorName ?? AppLocalizations.of(context)!.noAuthor,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: .center,
                ),
                const SizedBox(height: 8),
                const BookSlider(),
                const Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.skip_previous, size: 36),
                    //   onPressed: audioHandler.skipToPrevious,
                    // ),
                    AppSeekButton(isForward: false),
                    PlayButton(),
                    AppSeekButton(isForward: true),
                    // IconButton(
                    //   icon: const Icon(Icons.skip_next, size: 36),
                    //   onPressed: audioHandler.skipToNext,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
