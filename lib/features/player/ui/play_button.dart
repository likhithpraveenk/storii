import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/widgets/waveform.dart';

class PlayButton extends ConsumerWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final processingState = ref.watch(processingStateProvider);

    final scheme = Theme.of(context).colorScheme;
    final iconColor = scheme.onInverseSurface;

    final isWide = isPlaying || processingState == .buffering;

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: switch (processingState) {
        .loading => null,
        .completed => audioHandler.seekToStart,
        _ => audioHandler.togglePlay,
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: isWide ? 110.0 : 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: .circular(isPlaying ? 30 : 40),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: switch (processingState) {
              .loading || .buffering => RandomWaveform(
                key: ValueKey(processingState),
                color: iconColor,
                barCount: 6,
              ),
              .completed => Icon(
                Icons.replay_rounded,
                key: ValueKey(processingState),
                size: 36,
                color: iconColor,
              ),
              .error => Icon(
                Icons.error_outline_rounded,
                key: ValueKey(processingState),
                size: 36,
                color: scheme.error,
              ),
              _ => Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                key: ValueKey(isPlaying),
                size: 36,
                color: iconColor,
              ),
            },
          ),
        ),
      ),
    );
  }
}
