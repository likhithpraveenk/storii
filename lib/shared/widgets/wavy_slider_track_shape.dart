import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// Wavy active track for [Slider]. Needs `trackHeight` set in [SliderThemeData].
///
/// Wave move only when Slider repaint
class WavySliderTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  const new({
    this.amplitude = 5,
    this.wavelength = 32,
    this.phase = 0,
    this.strokeWidth = 4,
  });

  final double amplitude;
  final double wavelength;

  /// Radians
  final double phase;
  final double strokeWidth;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final rect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final cy = rect.center.dy;

    final activeColor = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    ).evaluate(enableAnimation)!;
    final inactiveColor = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor,
      end: sliderTheme.inactiveTrackColor,
    ).evaluate(enableAnimation)!;

    final inactivePaint = Paint()
      ..style = .stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = .round
      ..color = inactiveColor;
    final activePaint = Paint()
      ..style = .stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = .round
      ..strokeJoin = .round
      ..color = activeColor;

    final capR = strokeWidth / 2;
    const gap = 4;
    final thumbHalf =
        (sliderTheme.thumbShape
                ?.getPreferredSize(isEnabled, isDiscrete)
                .width ??
            0) /
        2;
    final inner = thumbHalf + gap + capR;
    final left = rect.left + capR;
    final right = rect.right - capR;

    final ltr = textDirection == .ltr;
    final activeStart = ltr ? left : thumbCenter.dx + inner;
    final activeEnd = ltr ? thumbCenter.dx - inner : right;
    final inactiveStart = ltr ? thumbCenter.dx + inner : left;
    final inactiveEnd = ltr ? right : thumbCenter.dx - inner;

    if (inactiveEnd > inactiveStart) {
      context.canvas.drawLine(
        Offset(inactiveStart, cy),
        Offset(inactiveEnd, cy),
        inactivePaint,
      );
    }

    final dotX = ltr ? right : left;
    final onInactive = ltr ? dotX > inactiveStart : dotX < inactiveEnd;
    if (onInactive) {
      context.canvas.drawCircle(
        Offset(dotX, cy),
        2,
        Paint()..color = activeColor,
      );
    }

    if (activeEnd > activeStart) {
      final path = _wavePath(activeStart, activeEnd, left, cy);
      context.canvas.drawPath(path, activePaint);
    }
  }

  /// Draws the wave as one quadratic per half wavelength
  Path _wavePath(double start, double end, double origin, double cy) {
    double yAt(double x) =>
        cy +
        amplitude * math.sin(((x - origin) / wavelength) * 2 * math.pi - phase);

    final path = Path()..moveTo(start, yAt(start));

    const twoPi = 2 * math.pi;
    var k = (((start - origin) * twoPi / wavelength) - phase) / math.pi;
    k = k.ceilToDouble();

    var previous = start;
    while (true) {
      final x = origin + (phase + k * math.pi) * wavelength / twoPi;
      if (x >= end) break;
      if (x > previous) {
        final control = (previous + x) / 2;
        path.quadraticBezierTo(control, yAt(control), x, cy);
        previous = x;
      }
      k += 1;
    }

    final control = (previous + end) / 2;
    path.quadraticBezierTo(control, yAt(control), end, yAt(end));
    return path;
  }
}
