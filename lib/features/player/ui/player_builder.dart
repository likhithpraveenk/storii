import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/player_providers.dart';

typedef PlayerWidgetBuilder =
    Widget Function(BuildContext context, double expandFactor);

class PlayerBuilder extends ConsumerStatefulWidget {
  const PlayerBuilder({
    super.key,
    required this.builder,
    this.minHeight = 80,
    required this.maxHeight,
  }) : assert(minHeight < maxHeight, 'minHeight must be less than maxHeight'),
       assert(minHeight > 0, 'minHeight must be positive'),
       assert(maxHeight > 0, 'maxHeight must be positive');

  final double minHeight;
  final double maxHeight;
  final PlayerWidgetBuilder builder;

  @override
  ConsumerState<PlayerBuilder> createState() => _PlayerBuilderState();
}

class _PlayerBuilderState extends ConsumerState<PlayerBuilder>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Tween<double> _heightTween;

  @override
  void initState() {
    super.initState();
    _heightTween = Tween(begin: widget.minHeight, end: widget.maxHeight);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addListener(_animationListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(playerBoundsProvider.notifier)
          .update(widget.minHeight, widget.maxHeight);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_animationListener);
    _controller.dispose();
    super.dispose();
  }

  void _animationListener() {
    if (!mounted) return;
    final newValue = _heightTween.transform(_controller.value);
    ref.read(playerHeightProvider.notifier).set(newValue);
  }

  void _snapTo(PlayerState newState) {
    final targetHeight = switch (newState) {
      .full => widget.maxHeight,
      .mini => widget.minHeight,
      .hidden => 0.0,
    };
    final currentHeight = ref.read(playerHeightProvider);
    if ((currentHeight - targetHeight).abs() < epsilon) return;

    _controller.stop();
    _heightTween = Tween(begin: currentHeight, end: targetHeight);
    _controller.reset();
    _controller.forward();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _controller.stop();

    final currentHeight = ref.read(playerHeightProvider);
    final newHeight = (currentHeight - details.delta.dy).clamp(
      0.0,
      widget.maxHeight,
    );
    ref.read(playerHeightProvider.notifier).set(newHeight);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    final velocityY = details.velocity.pixelsPerSecond.dy;
    final height = ref.read(playerHeightProvider);

    PlayerState target;

    if (velocityY.abs() > velocityThreshold) {
      if (velocityY < 0) {
        target = .full;
      } else {
        target = (height < (widget.minHeight / 2)) ? .hidden : .mini;
      }
    } else {
      final mid = (widget.minHeight + widget.maxHeight) / 2;
      target = height > mid ? .full : .mini;
    }
    _snapTo(target);
  }

  //   void _onHorizontalDragEnd(DragEndDetails details) {
  //     final velocityX = details.velocity.pixelsPerSecond.dx;
  //     final notifier = ref.read(playerEventProvider.notifier);

  //     if (velocityX > velocityThreshold) {
  //       notifier.reportSwipe(.right);
  //     } else if (velocityX < -velocityThreshold) {
  //       notifier.reportSwipe(.left);
  //     }
  //   }

  @override
  Widget build(BuildContext context) {
    ref.listen(playerEventProvider, (_, next) {
      debugPrint('[PlayerWidget]: ${next.value}');
      next.whenData(_snapTo);
    });

    final height = ref.watch(playerHeightProvider);
    if (height == 0) return const SizedBox.shrink();

    final expandFactor = ref.watch(playerExpandFactorProvider);

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (height > widget.minHeight) {
          _snapTo(.mini);
          debugPrint('[PopScope]: PlayerWidget handled it');
          return true;
        }
        return false;
      },
      child: Align(
        alignment: .bottomCenter,
        child: GestureDetector(
          behavior: .translucent,
          onTap: () => _snapTo(.full),
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          // onHorizontalDragEnd: _onHorizontalDragEnd,
          child: SizedBox(
            height: height,
            child: RepaintBoundary(
              child: widget.builder(context, expandFactor),
            ),
          ),
        ),
      ),
    );
  }
}
