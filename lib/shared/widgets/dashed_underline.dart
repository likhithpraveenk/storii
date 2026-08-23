import 'package:flutter/material.dart';

class DashedUnderlinePainter extends CustomPainter {
  final Color color;
  DashedUnderlinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = .stroke;

    const dashWidth = 4;
    const dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(
          startX + dashWidth > size.width ? size.width : startX + dashWidth,
          size.height,
        ),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
