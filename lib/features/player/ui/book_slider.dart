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
    final globalPosition = ref.watch(globalPositionProvider).value;
    final totalDuration = ref.watch(totalDurationProvider);
    final durationMs = totalDuration.inMilliseconds.toDouble();

    final position = (globalPosition?.inMilliseconds.toDouble() ?? 0.0).clamp(
      0.0,
      durationMs,
    );

    String format(double ms) =>
        Duration(milliseconds: ms.toInt()).toTimestamp();

    return Column(
      mainAxisSize: .min,
      children: [
        SliderTheme(
          data: SliderTheme.of(
            context,
          ).copyWith(thumbShape: const RoundRectSliderThumbShape()),
          child: Slider(
            value: _dragValue ?? position,
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
          padding: const .symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(format(_dragValue ?? position)),
              Text(totalDuration.toTimestamp()),
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
    final total = ref.watch(totalDurationProvider);

    final progress = total.inSeconds > 0
        ? (position.inSeconds / total.inSeconds).clamp(0.0, 1.0)
        : 0.0;

    return LinearProgressIndicator(
      value: progress,
      minHeight: 2,
      backgroundColor: Colors.transparent,
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
