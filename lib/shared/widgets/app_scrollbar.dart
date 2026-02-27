import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController controller;

  const AppScrollbar({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  State<AppScrollbar> createState() => _AppScrollbarState();
}

class _AppScrollbarState extends State<AppScrollbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.hasClients) {
        _handleScroll();
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleScroll);
    _anim.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _handleScroll() {
    if (!mounted) return;

    _anim.forward();
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 2), () => _anim.reverse());
  }

  void _handleDrag(DragUpdateDetails details, double availableHeight) {
    if (!widget.controller.hasClients) return;

    final delta = details.primaryDelta! / availableHeight;
    final newOffset =
        widget.controller.offset +
        (delta * widget.controller.position.maxScrollExtent);

    widget.controller.jumpTo(
      newOffset.clamp(0.0, widget.controller.position.maxScrollExtent),
    );
  }

  @override
  Widget build(BuildContext context) {
    const thumbHeight = 48.0;
    const thumbWidth = 30.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight - thumbHeight;
        return Stack(
          children: [
            widget.child,
            AnimatedBuilder(
              animation: Listenable.merge([_anim, widget.controller]),
              builder: (context, _) {
                final isReady = widget.controller.hasClients;

                if (!isReady) return const SizedBox.shrink();

                final pos = widget.controller.position;
                final maxScroll = pos.maxScrollExtent;

                if (maxScroll <= 0) return const SizedBox.shrink();

                final scrollPercent = (pos.pixels / maxScroll).clamp(0.0, 1.0);
                final topOffset = scrollPercent * availableHeight;

                return Positioned(
                  top: topOffset,
                  right: lerpDouble(-thumbWidth, 0, _anim.value),
                  child: GestureDetector(
                    onVerticalDragStart: (_) {
                      HapticFeedback.mediumImpact();
                      _handleScroll();
                    },
                    onVerticalDragUpdate: (d) =>
                        _handleDrag(d, availableHeight),
                    child: const _Thumb(width: thumbWidth, height: thumbHeight),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _Thumb extends StatelessWidget {
  final double width, height;
  const _Thumb({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: .horizontal(left: .circular(height)),
      ),
      child: Icon(
        Icons.unfold_more,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
