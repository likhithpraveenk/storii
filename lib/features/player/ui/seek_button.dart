import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
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

    return Material(
      color: Colors.transparent,
      borderRadius: .circular(80),
      child: InkWell(
        borderRadius: .circular(80),
        onTap: () {
          if (isForward) {
            audioHandler.fastForward();
          } else {
            audioHandler.rewind();
          }
        },
        child: Padding(
          padding: const .all(8),
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
        ),
      ),
    );
  }
}

String _getDurationLabel(Duration duration) {
  final seconds = duration.inSeconds;
  if (seconds >= 60 && seconds % 60 == 0) {
    return '${duration.inMinutes}m';
  }
  return '$seconds';
}

class AppSeekButtonBig extends ConsumerWidget {
  final bool isForward;

  final ColorScheme scheme;

  const AppSeekButtonBig({
    super.key,
    required this.isForward,
    required this.scheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skipForward = ref.watch(skipForwardProvider);
    final skipBackward = ref.watch(skipBackwardProvider);
    final skipDuration = isForward ? skipForward : skipBackward;
    final isNone = ref.watch(playerBackgroundThemeProvider) == .none;

    return Material(
      color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      clipBehavior: .antiAlias,
      child: InkWell(
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
              child: Icon(
                Icons.replay,
                size: 40,
                color: isNone ? scheme.onSurface : scheme.onPrimaryContainer,
              ),
            ),
            Padding(
              padding: const .only(top: 4),
              child: Text(
                _getDurationLabel(skipDuration),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: .bold,
                  color: isNone ? scheme.onSurface : scheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
