import 'dart:math';

import 'package:material_ui/material_ui.dart';

class ProgressBorderPainter extends CustomPainter {
  const new({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = .stroke
      ..strokeWidth = 3
      ..shader = SweepGradient(
        transform: const GradientRotation(-3 * pi / 4),
        colors: [color, color, Colors.transparent, Colors.transparent],
        stops: [0, progress, progress, 1],
      ).createShader(rect);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, const .circular(4)), paint);
  }

  @override
  bool shouldRepaint(ProgressBorderPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
