import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_slider.dart';
import 'package:storii/shared/widgets/wavy_slider_track_shape.dart';

class BookSlider extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends ConsumerState<BookSlider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wave;

  @override
  void initState() {
    super.initState();
    _wave = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _syncWave();
  }

  @override
  void dispose() {
    _wave.dispose();
    super.dispose();
  }

  void _syncWave() {
    final active =
        ref.read(useWavySliderProvider) && ref.read(isPlayingProvider);
    if (active) {
      if (!_wave.isAnimating) _wave.repeat();
    } else {
      _wave.stop();
    }
  }

  String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

  @override
  Widget build(BuildContext context) {
    ref.listen(useWavySliderProvider, (_, _) => _syncWave());
    ref.listen(isPlayingProvider, (_, _) => _syncWave());
    final showWave =
        ref.watch(useWavySliderProvider) && ref.watch(isPlayingProvider);

    final (:duration, :position) = ref.watch(displayProgressProvider);
    final speed = ref.watch(localSpeedProvider);
    final scaleTimeBySpeed = ref.watch(scaleTimeBySpeedProvider);

    final durationMs = duration.inMilliseconds.toDouble();
    final positionMs = position.inMilliseconds.toDouble().clamp(
      0.0,
      durationMs,
    );

    final remainingDuration = duration - position;
    final scaledRemaining = scaleTimeBySpeed
        ? Duration(
            microseconds: (remainingDuration.inMicroseconds / speed).round(),
          )
        : remainingDuration;

    final endLabel = ref.watch(progressEndLabelProvider);
    final end = switch (endLabel) {
      .total => duration.toTime(),
      .remaining => '$kMinus${scaledRemaining.toTime()}',
    };

    Widget buildSlider(SliderTrackShape? shape) => AppSlider(
      value: positionMs,
      max: durationMs,
      enableCancel: true,
      trackHeight: 4,
      trackShape: shape,
      labelBuilder: format,
      onChangeEnd: (value) async {
        final seekMs = value.toInt();
        if (!ref.read(showChapterProgressSliderProvider)) {
          await audioHandler.seekFromGlobalPosition(
            Duration(milliseconds: seekMs),
          );
        } else {
          await audioHandler.seek(Duration(milliseconds: seekMs));
        }
      },
      padding: const .fromLTRB(0, 4, 0, 4),
    );

    return Column(
      mainAxisSize: .min,
      children: [
        if (showWave)
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _wave,
              builder: (_, _) => buildSlider(
                WavySliderTrackShape(phase: _wave.value * 2 * math.pi),
              ),
            ),
          )
        else
          buildSlider(null),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(format(positionMs)),
            GestureDetector(
              behavior: .opaque,
              onTap: () => ref
                  .read(userSettingsProvider.notifier)
                  .setProgressEndLabel(
                    endLabel == .total ? .remaining : .total,
                  ),
              child: Text(end),
            ),
          ],
        ),
      ],
    );
  }
}

class MiniProgressIndicator extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (:duration, :position) = ref.watch(displayProgressProvider);
    final progress = (position.inSeconds / duration.inSeconds).clamp(0.0, 1.0);

    return LinearProgressIndicator(
      value: progress,
      minHeight: 2,
      backgroundColor: Colors.transparent,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
