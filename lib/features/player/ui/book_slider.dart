import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

class BookSlider extends ConsumerStatefulWidget {
  const BookSlider({super.key, required this.totalDuration});

  final Duration totalDuration;
  @override
  ConsumerState<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends ConsumerState<BookSlider> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final globalPosition = ref.watch(highResPositionProvider).value;

    final duration = widget.totalDuration.inMilliseconds.toDouble();
    final position = (globalPosition?.inMilliseconds.toDouble() ?? 0.0).clamp(
      0.0,
      duration,
    );

    return Slider(
      value: _dragValue ?? position,
      max: duration,
      onChanged: (value) => setState(() => _dragValue = value),
      onChangeEnd: (value) async {
        await audioHandler.seek(Duration(milliseconds: value.toInt()));

        if (mounted) {
          setState(() => _dragValue = null);
        }
      },
    );
  }
}
