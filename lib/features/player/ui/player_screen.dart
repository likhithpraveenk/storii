import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/features/player/ui/full_player.dart';
import 'package:storii/features/player/ui/mini_player.dart';
import 'package:storii/shared/widgets/player.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Player(
      playerController: ref.watch(playerControllerProvider),
      minHeight: 70,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (context, ratio) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            boxShadow: [const BoxShadow(blurRadius: 10, color: Colors.black26)],
          ),
          child: Stack(
            children: [
              if (ratio < 0.8)
                Opacity(
                  opacity: (1 - (ratio * 5)).clamp(0, 1),
                  child: MiniPlayer(
                    item: ref.watch(currentItemProvider).value!,
                  ),
                ),
              if (ratio > 0.2)
                Opacity(
                  opacity: ((ratio - 0.2) * 1.25).clamp(0, 1),
                  child: FullPlayer(
                    item: ref.watch(currentItemProvider).value!,
                    ratio: ratio,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
