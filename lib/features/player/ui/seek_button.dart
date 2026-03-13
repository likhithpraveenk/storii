import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

class AppSeekButton extends ConsumerWidget {
  final bool isForward;

  const AppSeekButton({super.key, required this.isForward});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final skipForward = ref.watch(skipForwardProvider);
    final skipBackward = ref.watch(skipBackwardProvider);
    final skipDuration = isForward ? skipForward : skipBackward;

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        if (isForward) {
          audioHandler.fastForward();
        } else {
          audioHandler.rewind();
        }
      },
      child: Stack(
        alignment: .center,
        children: [
          Transform.flip(
            flipX: isForward,
            child: Icon(Icons.replay, size: 40, color: scheme.onSurface),
          ),
          Padding(
            padding: const .only(top: 4),
            child: Text(
              _getDurationLabel(skipDuration),
              style: const TextStyle(fontSize: 12, fontWeight: .bold),
            ),
          ),
        ],
      ),
    );
  }

  String _getDurationLabel(Duration duration) {
    final seconds = duration.inSeconds;
    if (seconds >= 60 && seconds % 60 == 0) {
      return '${duration.inMinutes}m';
    }
    return '$seconds';
  }
}
