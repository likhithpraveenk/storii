import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/providers/settings_provider.dart';
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

  String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

  @override
  Widget build(BuildContext context) {
    final isEpisode = ref.watch(
      sessionProvider.select((s) => s?.episodeId != null),
    );
    final chapter = ref.watch(currentChapterProvider).value;
    final chapterPosition = ref.watch(chapterPositionProvider).value;
    final globalPosition = ref.watch(globalPositionProvider).value;
    final totalDuration = ref.watch(totalDurationProvider);

    final showChapterSlider = ref.watch(showChapterProgressSliderProvider);

    final Duration duration;
    final Duration position;
    final bool useGlobalSeek;

    if (isEpisode || !showChapterSlider) {
      duration = totalDuration;
      position = globalPosition ?? Duration.zero;
      useGlobalSeek = true;
    } else {
      duration = chapter?.duration ?? Duration.zero;
      position = chapterPosition ?? Duration.zero;
      useGlobalSeek = false;
    }

    final speed = ref.watch(localSpeedProvider);
    final durationMs = duration.inMilliseconds.toDouble();
    final positionMs = position.inMilliseconds.toDouble().clamp(
      0.0,
      durationMs,
    );

    // everything below operates in scaled (display) milliseconds
    final scaledDurationMs = durationMs / speed;
    var scaledPositionMs = positionMs / speed;

    if (_latestSeekValue != null) {
      if ((scaledPositionMs - _latestSeekValue!).abs() < 1000) {
        _latestSeekValue = null;
      } else {
        scaledPositionMs = _latestSeekValue!;
      }
    }

    final displayValue = _dragValue ?? scaledPositionMs;

    return Column(
      mainAxisSize: .min,
      children: [
        SliderTheme(
          data: SliderTheme.of(
            context,
          ).copyWith(thumbShape: const RoundRectSliderThumbShape()),
          child: Slider(
            value: displayValue,
            max: scaledDurationMs,
            onChanged: (value) => setState(() => _dragValue = value),
            onChangeEnd: (value) async {
              final seekMs = (value * speed).toInt();
              setState(() {
                _latestSeekValue = value;
                _dragValue = null;
              });
              if (useGlobalSeek) {
                await audioHandler.seekFromGlobalPosition(
                  Duration(milliseconds: seekMs),
                );
              } else {
                await audioHandler.seek(Duration(milliseconds: seekMs));
              }
            },
            padding: const .fromLTRB(0, 16, 0, 8),
          ),
        ),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(format(displayValue)),
            Text(
              Duration(
                microseconds: (duration.inMicroseconds / speed).round(),
              ).toTime(),
            ),
          ],
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
