import 'package:flutter/material.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';

class ButtonLayoutDefault extends StatelessWidget {
  const ButtonLayoutDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous, size: 36),
          onPressed: audioHandler.skipToPrevious,
        ),
        const AppSeekButton(isForward: false),
        const PlayButton(),
        const AppSeekButton(isForward: true),
        IconButton(
          icon: const Icon(Icons.skip_next, size: 36),
          onPressed: audioHandler.skipToNext,
        ),
      ],
    );
  }
}
