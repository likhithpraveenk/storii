import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

class ButtonLayoutCompact extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous, size: 24),
            onPressed: audioHandler.skipToPrevious,
          ),
          const _SeekButtonCompact(isForward: false),
          const _PlayButtonCompact(),
          const _SeekButtonCompact(isForward: true),
          IconButton(
            icon: const Icon(Icons.skip_next, size: 24),
            onPressed: audioHandler.skipToNext,
          ),
        ],
      ),
    );
  }
}

class _SeekButtonCompact extends StatelessWidget {
  final bool isForward;

  const new({required this.isForward});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform.flip(
        flipX: isForward,
        child: Icon(
          Icons.replay,
          size: 24,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onPressed: () {
        if (isForward) {
          audioHandler.fastForward();
        } else {
          audioHandler.rewind();
        }
      },
    );
  }
}

class _PlayButtonCompact extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final scheme = Theme.of(context).colorScheme;

    return IconButton.filled(
      icon: Icon(
        isPlaying ? Icons.pause_rounded : Icons.play_arrow,
        size: 28,
        color: scheme.onInverseSurface,
      ),
      style: IconButton.styleFrom(backgroundColor: scheme.inverseSurface),
      onPressed: audioHandler.togglePlay,
    );
  }
}
