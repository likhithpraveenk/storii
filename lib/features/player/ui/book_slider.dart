import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';

class BookSlider extends ConsumerStatefulWidget {
  const BookSlider({super.key});

  @override
  ConsumerState<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends ConsumerState<BookSlider> {
  double? _dragValue;
  double? _latestSeekValue;

  @override
  Widget build(BuildContext context) {
    final isEpisode = ref.watch(
      sessionProvider.select((s) => s?.episodeId != null),
    );
    final chapter = ref.watch(currentChapterProvider).value;
    final chapterPosition = ref.watch(chapterPositionProvider).value;
    final globalPosition = ref.watch(globalPositionProvider).value;
    final totalDuration = ref.watch(totalDurationProvider);

    final Duration duration;
    final Duration position;

    if (isEpisode) {
      duration = totalDuration;
      position = globalPosition ?? Duration.zero;
    } else {
      duration = chapter?.duration ?? Duration.zero;
      position = chapterPosition ?? Duration.zero;
    }

    final durationMs = duration.inMilliseconds.toDouble();
    double positionMs = position.inMilliseconds.toDouble().clamp(
      0.0,
      durationMs,
    );

    if (_latestSeekValue != null) {
      if ((positionMs - _latestSeekValue!).abs() < 1000) {
        _latestSeekValue = null;
      } else {
        positionMs = _latestSeekValue!;
      }
    }

    String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

    return Column(
      mainAxisSize: MainAxisSize.min,
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
              setState(() {
                _latestSeekValue = value;
                _dragValue = null;
              });
              if (isEpisode) {
                await audioHandler.seekFromGlobalPosition(
                  Duration(milliseconds: value.toInt()),
                );
              } else {
                await audioHandler.seek(Duration(milliseconds: value.toInt()));
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
              Text(duration.toTime()),
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
