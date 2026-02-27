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

    final isLoading = processingState == .loading;
    final isBuffering = processingState == .buffering;
    final width = isPlaying ? 120.0 : 80.0;
    final height = isPlaying ? 90.0 : 80.0;
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: isLoading ? null : audioHandler.togglePlay,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: width,
        height: height,
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
            child: isLoading || isBuffering
                ? RandomWaveform(color: scheme.onInverseSurface, barCount: 6)
                : Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    key: ValueKey<bool>(isPlaying),
                    size: 36,
                    color: scheme.onInverseSurface,
                  ),
          ),
        ),
      ),
    );
  }
}
