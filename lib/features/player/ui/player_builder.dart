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
    required this.onDismiss,
  }) : assert(minHeight < maxHeight, 'minHeight must be less than maxHeight'),
       assert(minHeight > 0, 'minHeight must be positive'),
       assert(maxHeight > 0, 'maxHeight must be positive');

  final double minHeight;
  final double maxHeight;
  final PlayerWidgetBuilder builder;
  final Future<void> Function() onDismiss;

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

  @override
  void didUpdateWidget(covariant PlayerBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.maxHeight != widget.maxHeight ||
        oldWidget.minHeight != widget.minHeight) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref
              .read(playerBoundsProvider.notifier)
              .update(widget.minHeight, widget.maxHeight);
        }
      });
    }
  }

  void _animationListener() {
    final curvedValue = Curves.easeOutCubic.transform(_controller.value);
    final newValue = _heightTween.transform(curvedValue);
    ref.read(playerHeightProvider.notifier).set(newValue);
  }

  void _animateTo(PlayerViewState newState) {
    final targetHeight = switch (newState) {
      .full => widget.maxHeight,
      .mini => widget.minHeight,
      .hidden => 0.0,
    };

    final currentHeight = ref.read(playerHeightProvider);

    _controller.stop();
    _heightTween = Tween(begin: currentHeight, end: targetHeight);
    _controller.reset();
    _controller.forward();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _controller.stop();

    final currentHeight = ref.read(playerHeightProvider);
    final bounds = ref.read(playerBoundsProvider);

    final newHeight = (currentHeight - details.delta.dy).clamp(0.0, bounds.max);

    ref.read(playerHeightProvider.notifier).set(newHeight);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    final velocityY = details.velocity.pixelsPerSecond.dy;

    final state = ref
        .read(playerModeProvider.notifier)
        .resolveAfterDrag(velocityY);
    _animateTo(state);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(playerModeProvider, (prev, next) {
      if (prev != next) {
        _animateTo(next);
      }

      if (next == .hidden && prev != .hidden) {
        Future.microtask(widget.onDismiss);
      }
    });

    final height = ref.watch(playerHeightProvider);
    final expandFactor = ref.watch(playerExpandFactorProvider);

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          return true;
        }
        if (height > widget.minHeight) {
          ref.read(playerModeProvider.notifier).toMini();
          return true;
        }
        return false;
      },
      child: Align(
        alignment: .bottomCenter,
        child: GestureDetector(
          behavior: .translucent,
          onTap: () {
            ref.read(playerModeProvider.notifier).toFull();
          },
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
