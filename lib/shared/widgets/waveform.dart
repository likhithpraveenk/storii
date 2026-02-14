import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A continuous loading indicator that simulates a random waveform by
/// smoothly animating vertical bars between randomized heights
class RandomWaveform extends StatefulWidget {
  /// The number of bars displayed in the waveform
  final int barCount;

  /// The spacing between each individual bar
  final double barSpacing;

  /// The horizontal width of each individual bar
  final double barWidth;

  /// The maximum possible height any bar can reach
  final double barMaxHeight;

  /// The color used to paint the bars
  final Color? color;

  /// The duration for animation
  final Duration speed;

  const RandomWaveform({
    super.key,
    this.barCount = 10,
    this.barSpacing = 2.0,
    this.barWidth = 2.0,
    this.barMaxHeight = 24.0,
    this.color,
    this.speed = const Duration(milliseconds: 200),
  });

  @override
  State<RandomWaveform> createState() => _RandomWaveformState();
}

class _RandomWaveformState extends State<RandomWaveform>
    with SingleTickerProviderStateMixin {
  final _random = Random();
  late final AnimationController _controller;
  late List<double> _initialHeights;
  late List<double> _currentHeights;
  late List<double> _targetHeights;

  @override
  void initState() {
    super.initState();
    _initializeHeights();

    _controller = AnimationController(vsync: this, duration: widget.speed)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _currentHeights = List.from(_targetHeights);
          _targetHeights = _shuffleHeights(_initialHeights);
          _controller.forward(from: 0);
        }
      });

    _controller.forward();
  }

  void _initializeHeights() {
    _initialHeights = List.generate(
      widget.barCount,
      (index) => (index + 1) * (widget.barMaxHeight / widget.barCount),
    )..shuffle(_random);

    _currentHeights = List.from(_initialHeights);
    _targetHeights = _shuffleHeights(_initialHeights);
  }

  @override
  void didUpdateWidget(covariant RandomWaveform oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.barCount != oldWidget.barCount ||
        widget.barMaxHeight != oldWidget.barMaxHeight) {
      _initializeHeights();

      if (widget.speed != oldWidget.speed) {
        _controller.duration = widget.speed;
      }

      _controller.forward(from: 0);
    } else if (widget.speed != oldWidget.speed) {
      _controller.duration = widget.speed;
    }
  }

  List<double> _shuffleHeights(List<double> heights) {
    final copy = List<double>.from(heights);
    copy.shuffle(_random);
    return copy;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth =
        (widget.barWidth + widget.barSpacing) * widget.barCount -
        widget.barSpacing;
    final color = widget.color ?? Theme.of(context).colorScheme.primary;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        final interpolatedHeights = List.generate(widget.barCount, (i) {
          return lerpDouble(
                _currentHeights[i],
                _targetHeights[i],
                _controller.value,
              ) ??
              0;
        });
        return RepaintBoundary(
          child: CustomPaint(
            painter: _WaveformPainter(
              heights: interpolatedHeights,
              barWidth: widget.barWidth,
              barSpacing: widget.barSpacing,
              color: color,
            ),
            willChange: true,
            size: Size(totalWidth, widget.barMaxHeight),
          ),
        );
      },
    );
  }
}

/// A continuous loading indicator that simulates a sine waveform by
/// smoothly animating vertical bars
class SineWaveform extends StatefulWidget {
  /// The number of bars displayed in the waveform
  final int barCount;

  /// The spacing between each individual bar
  final double barSpacing;

  /// The horizontal width of each individual bar
  final double barWidth;

  /// The maximum possible height any bar can reach
  final double barMaxHeight;

  /// The color used to paint the bars
  final Color? color;

  /// The duration for animation
  final Duration speed;

  /// Controls the length of the sine wave pattern across the bars
  ///
  /// - Higher values (e.g., 2.0) mean a longer wavelength (smoother, spread-out wave)
  /// - Lower values (e.g., 0.5) mean a shorter wavelength (choppier, more pronounced peaks)
  final double waveLengthFactor;

  const SineWaveform({
    super.key,
    this.barCount = 10,
    this.barSpacing = 2.0,
    this.barWidth = 2.0,
    this.barMaxHeight = 20.0,
    this.color,
    this.speed = const Duration(milliseconds: 200),
    this.waveLengthFactor = 0.75,
  });

  @override
  State<SineWaveform> createState() => _SineWaveformState();
}

class _SineWaveformState extends State<SineWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const double _waveCycle = 2 * pi;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.speed * 10)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth =
        (widget.barWidth + widget.barSpacing) * widget.barCount -
        widget.barSpacing;
    final color = widget.color ?? Theme.of(context).colorScheme.primary;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        final animationValue = _controller.value;
        final baseMinHeight = widget.barMaxHeight * 0.2;
        final maxAmplitude = widget.barMaxHeight - baseMinHeight;
        final phaseShiftPerBar =
            _waveCycle / (widget.barCount * widget.waveLengthFactor);

        final heights = List.generate(widget.barCount, (i) {
          final angle = (animationValue * _waveCycle) + (i * phaseShiftPerBar);
          final normalizedValue = (sin(angle).abs());
          return baseMinHeight + (normalizedValue * maxAmplitude);
        });

        return CustomPaint(
          painter: _WaveformPainter(
            heights: heights,
            barWidth: widget.barWidth,
            barSpacing: widget.barSpacing,
            color: color,
          ),
          willChange: true,
          size: Size(totalWidth, widget.barMaxHeight),
        );
      },
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final List<double> heights;
  final double barWidth;
  final double barSpacing;
  final Color color;

  _WaveformPainter({
    required this.heights,
    required this.barWidth,
    required this.barSpacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    double x = 0;

    for (var height in heights) {
      final barTop = (size.height - height) / 2;
      final barRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, barTop, barWidth, height),
        const Radius.circular(2),
      );
      canvas.drawRRect(barRect, paint);
      x += barWidth + barSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) {
    return oldDelegate.heights != heights;
  }
}
