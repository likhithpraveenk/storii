import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/helpers/extensions.dart';

class BookSlider extends ConsumerStatefulWidget {
  const BookSlider({super.key});

  @override
  ConsumerState<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends ConsumerState<BookSlider> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final chapter = ref.watch(currentChapterProvider).value;
    final position = ref.watch(chapterPositionProvider).value;
    final durationMs = (chapter?.duration.inMilliseconds ?? 0).toDouble();
    final positionMs = (position?.inMilliseconds.toDouble() ?? 0.0).clamp(
      0.0,
      durationMs,
    );

    String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

    return Column(
      mainAxisSize: .min,
      children: [
        SliderTheme(
          data: SliderTheme.of(
            context,
          ).copyWith(thumbShape: const RoundRectSliderThumbShape()),
          child: Slider(
            value: _dragValue ?? positionMs,
            max: durationMs,
            onChanged: (value) => setState(() => _dragValue = value),
            onChangeEnd: (value) async {
              await audioHandler.seek(Duration(milliseconds: value.toInt()));

              if (mounted) {
                setState(() => _dragValue = null);
              }
            },
          ),
        ),
        Padding(
          padding: const .symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(format(_dragValue ?? positionMs)),
              Text(chapter?.duration.toTime() ?? ''),
            ],
          ),
        ),
      ],
    );
  }
}

class MiniProgressIndicator extends ConsumerWidget {
  const MiniProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(globalPositionProvider).value ?? Duration.zero;
    final duration = ref.watch(totalDurationProvider).inSeconds;
    final progress = (position.inSeconds / duration).clamp(0.0, 1.0);

    return LinearProgressIndicator(
      value: progress,
      minHeight: 2,
      backgroundColor: Colors.transparent,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class RoundRectSliderThumbShape extends SliderComponentShape {
  const RoundRectSliderThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size.fromRadius(4);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = .fill;

    context.canvas.drawRRect(
      RRect.fromLTRBR(
        center.dx - 2,
        center.dy - 8,
        center.dx + 2,
        center.dy + 8,
        const .circular(4),
      ),
      paint,
    );
  }
}
