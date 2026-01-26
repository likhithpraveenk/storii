import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

class BookSlider extends ConsumerWidget {
  const BookSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPos = ref.watch(globalPositionProvider).value ?? Duration.zero;
    final totalLen = ref.watch(totalBookDurationProvider);

    return Slider(
      value: currentPos.inMilliseconds.toDouble(),
      max: totalLen.inMilliseconds.toDouble(),
      onChanged: (value) {
        ref
            .read(audioHandlerProvider)
            .seek(Duration(milliseconds: value.toInt()));
      },
    );
  }
}
