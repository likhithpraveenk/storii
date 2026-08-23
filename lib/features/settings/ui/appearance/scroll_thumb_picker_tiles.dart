import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

String _labelDuration(int ms) =>
    '${(ms / Duration.millisecondsPerSecond).toStringAsFixed(1)}s';

class ScrollThumbDurationTile extends ConsumerStatefulWidget {
  const ScrollThumbDurationTile({super.key});

  @override
  ConsumerState<ScrollThumbDurationTile> createState() =>
      _ScrollThumbDurationTileState();
}

class _ScrollThumbDurationTileState
    extends ConsumerState<ScrollThumbDurationTile> {
  late int _durationMs;

  static const _presets = [1500, 2000, 3000, 5000];

  @override
  void initState() {
    super.initState();
    _durationMs = ref.read(scrollThumbDurationProvider).inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          WheelPicker.fromIntRange(
            initialValue: _durationMs,
            min: 500,
            max: 5000,
            step: 500,
            onChangedEnd: (ms) => _durationMs = ms,
            labelBuilder: _labelDuration,
            presets: _presets,
          ),
          const SizedBox(height: 24),
          AppFilledButton(
            onPressed: () {
              notifier.setScrollThumbDuration(
                Duration(milliseconds: _durationMs),
              );
              Navigator.of(context).pop();
            },
            text: l10n.save,
          ),
        ],
      ),
    );
  }
}

class ScrollThumbHeightTile extends ConsumerStatefulWidget {
  const ScrollThumbHeightTile({super.key});

  @override
  ConsumerState<ScrollThumbHeightTile> createState() =>
      _ScrollThumbHeightTileState();
}

class _ScrollThumbHeightTileState extends ConsumerState<ScrollThumbHeightTile> {
  late int _height;

  static const _presets = [32, 48, 64, 96];

  @override
  void initState() {
    super.initState();
    _height = ref.read(scrollThumbHeightProvider).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          WheelPicker.fromIntRange(
            initialValue: _height,
            min: 24,
            max: 120,
            step: 4,
            onChangedEnd: (h) => _height = h,
            labelBuilder: (v) => '${v}px',
            presets: _presets,
          ),
          const SizedBox(height: 24),
          AppFilledButton(
            onPressed: () {
              notifier.setScrollThumbHeight(_height.toDouble());
              Navigator.of(context).pop();
            },
            text: l10n.save,
          ),
        ],
      ),
    );
  }
}

class ScrollThumbWidthTile extends ConsumerStatefulWidget {
  const ScrollThumbWidthTile({super.key});

  @override
  ConsumerState<ScrollThumbWidthTile> createState() =>
      _ScrollThumbWidthTileState();
}

class _ScrollThumbWidthTileState extends ConsumerState<ScrollThumbWidthTile> {
  late int _width;

  static const _presets = [16, 24, 32, 48];

  @override
  void initState() {
    super.initState();
    _width = ref.read(scrollThumbWidthProvider).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          WheelPicker.fromIntRange(
            initialValue: _width,
            min: 12,
            max: 64,
            step: 2,
            onChangedEnd: (w) => _width = w,
            labelBuilder: (v) => '${v}px',
            presets: _presets,
          ),
          const SizedBox(height: 24),
          AppFilledButton(
            onPressed: () {
              notifier.setScrollThumbWidth(_width.toDouble());
              Navigator.of(context).pop();
            },
            text: l10n.save,
          ),
        ],
      ),
    );
  }
}
