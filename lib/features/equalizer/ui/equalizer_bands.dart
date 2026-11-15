import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/features/equalizer/logic/equalizer_controller.dart';
import 'package:storii/features/equalizer/logic/equalizer_service.dart';
import 'package:storii/features/equalizer/models/equalizer.dart';
import 'package:storii/shared/widgets/app_slider.dart';

const _defaultMinDecibels = -12.0;
const _defaultMaxDecibels = 12.0;

class EqualizerBands extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(equalizerControllerProvider);
    final controller = ref.read(equalizerControllerProvider.notifier);
    final params = ref.watch(equalizerParametersProvider).value;

    final min = params?.minDecibels ?? _defaultMinDecibels;
    final max = params?.maxDecibels ?? _defaultMaxDecibels;

    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final textStyle = textTheme.labelLarge?.copyWith(
      color: scheme.onSurfaceVariant,
    );

    return SizedBox(
      height: 240,
      child: Row(
        children: [
          Padding(
            padding: const .fromLTRB(12, 16, 4, 16),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('+${max.toInt()}', style: textStyle),
                Text('0', style: textStyle),
                Text('${min.toInt()}', style: textStyle),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: .horizontal,
              padding: const .only(right: 24),
              children: [
                for (final frequency in EqualizerFrequency.values)
                  _BandTile(
                    frequency: frequency,
                    gain: draft.bands[frequency] ?? 0,
                    min: min,
                    max: max,
                    onChanged: (value) =>
                        controller.previewBand(frequency, value),
                    onChangeEnd: (_) => controller.commit(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BandTile extends StatefulWidget {
  const new({
    required this.frequency,
    required this.gain,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.onChangeEnd,
  });

  final EqualizerFrequency frequency;
  final double gain;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;

  @override
  State<_BandTile> createState() => _BandTileState();
}

class _BandTileState extends State<_BandTile> {
  late double _value = _clamp();

  double _clamp() => widget.gain.clamp(widget.min, widget.max);

  @override
  void didUpdateWidget(_BandTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gain != widget.gain ||
        oldWidget.min != widget.min ||
        oldWidget.max != widget.max) {
      _value = _clamp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final steps = (widget.max - widget.min).round();

    return SizedBox(
      width: 40,
      child: Column(
        children: [
          Text(
            _formatDecibels(_value),
            style: textTheme.labelMedium,
            textAlign: .center,
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: AppSlider(
                value: _value,
                min: widget.min,
                max: widget.max,
                divisions: steps > 0 ? steps : null,
                labelBuilder: _formatDecibels,
                onChanged: (value) {
                  setState(() => _value = value);
                  widget.onChanged(value);
                },
                onChangeEnd: (value) {
                  setState(() => _value = value);
                  widget.onChangeEnd(value);
                },
                trackHeight: 2,
                thumbHeight: 16,
                showValueIndicator: .never,
                activeTrackColor: scheme.secondaryContainer,
                padding: const .symmetric(horizontal: 8),
              ),
            ),
          ),
          Text(
            _formatFrequency(widget.frequency.hertz),
            style: textTheme.labelMedium,
            textAlign: .center,
          ),
        ],
      ),
    );
  }

  String _formatFrequency(int hertz) {
    if (hertz < 1000) return '$hertz';
    return '${hertz ~/ 1000}k';
  }

  String _formatDecibels(double value) {
    final rounded = value.round();
    return rounded > 0 ? '+$rounded' : '$rounded';
  }
}
