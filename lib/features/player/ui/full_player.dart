import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);

    if (session == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const .all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            GestureDetector(
              child: Text(
                session.displayTitle,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: .center,
              ),
              onTap: () {
                ref.read(playerModeProvider.notifier).toMini();
                context.go(
                  AppRoute.itemDetail.path,
                  extra: session.libraryItemId,
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              session.displayAuthor,
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
  }
}
