import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';

class AppScrollbar extends ConsumerStatefulWidget {
  final Widget child;
  final ScrollController controller;

  const AppScrollbar({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  ConsumerState<AppScrollbar> createState() => _AppScrollbarState();
}

class _AppScrollbarState extends ConsumerState<AppScrollbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Listenable _scrollAndAnim = Listenable.merge([
    _anim,
    widget.controller,
  ]);
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleScroll);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleScroll);
    _anim.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    final hideDuration = ref.read(scrollThumbDurationProvider);
    _hideTimer = Timer(hideDuration, () => _anim.reverse());
  }

  void _handleScroll() {
    if (!mounted) return;
    _anim.forward();
    _startHideTimer();
  }

  void _handleDrag(DragUpdateDetails details, double availableHeight) {
    _hideTimer?.cancel();

    if (!widget.controller.hasClients ||
        !widget.controller.position.hasContentDimensions) {
      return;
    }

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
    final thumbHeight = ref.watch(scrollThumbHeightProvider);
    final thumbWidth = ref.watch(scrollThumbWidthProvider);

    return Stack(
      children: [
        widget.child,
        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final showThumb = ref.watch(scrollThumbVisibilityProvider);
              if (!showThumb) return const SizedBox.shrink();

              final availableHeight = constraints.maxHeight - thumbHeight;
              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _scrollAndAnim,
                    child: GestureDetector(
                      onVerticalDragStart: (_) {
                        HapticFeedback.mediumImpact();
                        _hideTimer?.cancel();
                      },
                      onVerticalDragUpdate: (d) =>
                          _handleDrag(d, availableHeight),
                      onVerticalDragEnd: (_) => _startHideTimer(),
                      onVerticalDragCancel: _startHideTimer,
                      child: Thumb(width: thumbWidth, height: thumbHeight),
                    ),
                    builder: (context, child) {
                      final isReady =
                          widget.controller.hasClients &&
                          widget.controller.positions.length == 1 &&
                          widget.controller.position.hasContentDimensions;

                      if (!isReady) return const SizedBox.shrink();

                      final pos = widget.controller.position;
                      final maxScroll = pos.maxScrollExtent;

                      if (maxScroll <= 0) return const SizedBox.shrink();

                      final scrollPercent = (pos.pixels / maxScroll).clamp(
                        0.0,
                        1.0,
                      );
                      final topOffset = scrollPercent * availableHeight;

                      final slideDx =
                          lerpDouble(thumbWidth, 0, _anim.value) ?? thumbWidth;

                      return Positioned(
                        top: topOffset,
                        right: 0,
                        child: Transform.translate(
                          offset: Offset(slideDx, 0),
                          child: child,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class Thumb extends StatelessWidget {
  final double width, height;
  const Thumb({required this.width, required this.height, super.key});

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
