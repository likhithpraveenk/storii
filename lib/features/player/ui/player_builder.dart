import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/player_providers.dart';

typedef PlayerWidgetBuilder =
    Widget Function(BuildContext context, double expandFactor);

class PlayerBuilder extends ConsumerStatefulWidget {
  const PlayerBuilder({
    super.key,
    required this.builder,
    this.minHeight = 80,
    required this.maxHeight,
    required this.onDismiss,
  }) : assert(minHeight < maxHeight, 'minHeight must be less than maxHeight'),
       assert(minHeight > 0, 'minHeight must be positive'),
       assert(maxHeight > 0, 'maxHeight must be positive');

  final double minHeight;
  final double maxHeight;
  final PlayerWidgetBuilder builder;
  final VoidCallback onDismiss;

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
      final id = ref.read(currentItemIdProvider);
      if (id != null) {
        _snapTo(.mini);
      }
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
    final curvedValue = Curves.easeOutCubic.transform(_controller.value);
    final newValue = _heightTween.transform(curvedValue);
    ref.read(playerHeightProvider.notifier).set(newValue);
  }

  void _snapTo(PlayerViewState newState) {
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
    _controller.forward().whenComplete(() {
      if (targetHeight == 0.0) {
        widget.onDismiss();
      }
    });
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

    PlayerViewState target;

    if (velocityY.abs() > velocityThreshold) {
      if (velocityY < 0) {
        target = .full;
      } else {
        target = (height < (widget.minHeight * 0.8)) ? .hidden : .mini;
      }
    } else {
      final mid = (widget.minHeight + widget.maxHeight) / 2;
      target = height > mid ? .full : .mini;
    }
    _snapTo(target);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(playerControllerProvider, (_, next) {
      _snapTo(next);
    });

    final height = ref.watch(playerHeightProvider);
    if (height == 0) return const SizedBox.shrink();

    final expandFactor = ref.watch(playerExpandFactorProvider);

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (height > widget.minHeight + epsilon) {
          _snapTo(.mini);
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
