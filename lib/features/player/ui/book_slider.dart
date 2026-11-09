import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_slider.dart';

class BookSlider extends ConsumerWidget {
  const new({super.key});

  String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Column(
      mainAxisSize: .min,
      children: [
        AppSlider(
          value: positionMs,
          max: durationMs,
          enableCancel: true,
          trackHeight: 10,
          labelBuilder: (value) =>
              Duration(milliseconds: value.toInt()).toTime(),
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
        ),
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
