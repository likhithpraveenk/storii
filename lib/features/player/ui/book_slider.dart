import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_slider.dart';

class BookSlider extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends ConsumerState<BookSlider> {
  double? _latestSeekValue;

  String format(double ms) => Duration(milliseconds: ms.toInt()).toTime();

  @override
  Widget build(BuildContext context) {
    final isEpisode = ref.watch(
      sessionProvider.select((s) => s?.episodeId != null),
    );
    final showChapterSlider = ref.watch(showChapterProgressSliderProvider);

    final (:duration, :position) = ref.watch(displayProgressProvider);
    final useGlobalSeek = isEpisode || !showChapterSlider;

    final speed = ref.watch(localSpeedProvider);
    final scaleTimeBySpeed = ref.watch(scaleTimeBySpeedProvider);
    final durationMs = duration.inMilliseconds.toDouble();
    final positionMs = position.inMilliseconds.toDouble().clamp(
      0.0,
      durationMs,
    );

    final scaledDurationMs = scaleTimeBySpeed ? durationMs / speed : durationMs;
    var scaledPositionMs = scaleTimeBySpeed ? positionMs / speed : positionMs;

    if (_latestSeekValue != null) {
      if ((scaledPositionMs - _latestSeekValue!).abs() < 1000) {
        _latestSeekValue = null;
      } else {
        scaledPositionMs = _latestSeekValue!;
      }
    }

    final endLabel = ref.watch(progressEndLabelProvider);
    final scaledDuration = Duration(
      microseconds: scaleTimeBySpeed
          ? (duration.inMicroseconds / speed).round()
          : duration.inMicroseconds,
    );
    final remaining =
        scaledDuration - Duration(milliseconds: scaledPositionMs.toInt());
    final end = switch (endLabel) {
      .total => scaledDuration.toTime(),
      .remaining => '$kMinus${remaining.toTime()}',
    };

    return Column(
      mainAxisSize: .min,
      children: [
        AppSlider(
          value: scaledPositionMs,
          max: scaledDurationMs,
          trackHeight: 10,
          labelBuilder: (value) =>
              Duration(milliseconds: value.toInt()).toTime(),
          onChangeEnd: (value) async {
            final seekMs = (value * speed).toInt();
            setState(() {
              _latestSeekValue = value;
            });
            if (useGlobalSeek) {
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
            Text(format(scaledPositionMs)),
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
