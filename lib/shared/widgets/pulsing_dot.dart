import 'package:flutter/material.dart';

class PulsingDot extends StatefulWidget {
  final double size;
  final Color? color;

  const PulsingDot({super.key, this.size = 10, this.color});

  @override
  State<PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    final maxSize = widget.size * 2;

    return SizedBox(
      width: maxSize,
      height: maxSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: .center,
            clipBehavior: .none,
            children: [
              Transform.scale(
                scale: 1 + (_controller.value * 1.6),
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: color.withValues(alpha: 1 - _controller.value),
                  ),
                ),
              ),
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(shape: .circle, color: color),
              ),
            ],
          );
        },
      ),
    );
  }
}
