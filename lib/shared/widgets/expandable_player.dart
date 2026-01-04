import 'package:flutter/material.dart';

typedef ExpandablePlayerBuilder =
    Widget Function(BuildContext context, double height, double heightRatio);

enum PlayerSwipeDirection { up, down, left, right }

const double _verticalVelocityThreshold = 100;
const double _horizontalVelocityThreshold = 100;

class ExpandablePlayerController extends ChangeNotifier {
  _ExpandablePlayerState? _state;

  double get height => _state?.heightNotifier.value ?? 0.0;
  bool get isExpanded => height >= (_state?.widget.maxHeight ?? 0);
  bool get isCollapsed => height <= (_state?.widget.minHeight ?? 0);

  void expand() => _state?._animateTo(_state!.widget.maxHeight);
  void collapse() => _state?._animateTo(_state!.widget.minHeight);
  void dismiss() => _state?._animateTo(0);

  void _attach(_ExpandablePlayerState state) {
    _state = state;
    _state!.heightNotifier.addListener(_notifyListeners);
  }

  void _detach() {
    _state?.heightNotifier.removeListener(_notifyListeners);
    _state = null;
  }

  void _notifyListeners() => notifyListeners();
}

class ExpandablePlayer extends StatefulWidget {
  const ExpandablePlayer({
    super.key,
    required this.builder,
    required this.minHeight,
    required this.maxHeight,
    this.playerController,
    this.animationController,
    this.onHorizontalSwipe,
    this.onDismiss,
    this.onExpand,
    this.onCollapse,
  }) : assert(minHeight < maxHeight, 'minHeight must be less than maxHeight'),
       assert(minHeight >= 0, 'minHeight must be non-negative'),
       assert(maxHeight > 0, 'maxHeight must be positive');

  final double minHeight;
  final double maxHeight;
  final ExpandablePlayerBuilder builder;
  final ExpandablePlayerController? playerController;
  final AnimationController? animationController;
  final void Function(PlayerSwipeDirection direction)? onHorizontalSwipe;
  final VoidCallback? onDismiss;
  final VoidCallback? onExpand;
  final VoidCallback? onCollapse;

  @override
  State<ExpandablePlayer> createState() => _ExpandablePlayerState();
}

class _ExpandablePlayerState extends State<ExpandablePlayer>
    with TickerProviderStateMixin {
  late final ValueNotifier<double> heightNotifier;
  late final AnimationController controller;
  bool dismissed = false;

  double _startHeight = 0.0;
  double _targetHeight = 0.0;

  @override
  void initState() {
    super.initState();
    heightNotifier = ValueNotifier(widget.minHeight);
    controller =
        widget.animationController ??
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        );
    controller.addListener(_animationListener);
    widget.playerController?._attach(this);
  }

  @override
  void dispose() {
    widget.playerController?._detach();
    heightNotifier.dispose();
    controller.removeListener(_animationListener);
    controller.dispose();
    super.dispose();
  }

  void _animationListener() {
    final curvedValue = Curves.easeOutCubic.transform(controller.value);

    heightNotifier.value = Tween(
      begin: _startHeight,
      end: _targetHeight,
    ).transform(curvedValue);
  }

  void _animateTo(double targetHeight) {
    if (dismissed && targetHeight > 0) {
      setState(() => dismissed = false);
    }
    if (controller.isAnimating) {
      controller.stop();
    }

    if (heightNotifier.value == targetHeight) return;

    _startHeight = heightNotifier.value;
    _targetHeight = targetHeight;

    controller.reset();
    controller.forward().whenComplete(_animationCompleteCallback);
  }

  void _animationCompleteCallback() {
    if (_targetHeight == widget.maxHeight) {
      widget.onExpand?.call();
    } else if (_targetHeight == widget.minHeight) {
      widget.onCollapse?.call();
    } else if (_targetHeight == 0 && !dismissed) {
      widget.onDismiss?.call();
      setState(() => dismissed = true);
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (dismissed) return;
    heightNotifier.value = (heightNotifier.value - details.delta.dy).clamp(
      0,
      widget.maxHeight,
    );
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (dismissed) return;

    if (heightNotifier.value < widget.minHeight * 0.7) {
      _animateTo(0);
      return;
    }

    final velocityY = details.velocity.pixelsPerSecond.dy;

    if (velocityY < -_verticalVelocityThreshold) {
      _animateTo(widget.maxHeight);
    } else if (velocityY > _verticalVelocityThreshold) {
      _animateTo(widget.minHeight);
    } else {
      final heightRatio =
          (heightNotifier.value - widget.minHeight) /
          (widget.maxHeight - widget.minHeight);
      _animateTo(heightRatio >= 0.5 ? widget.maxHeight : widget.minHeight);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (dismissed) return;

    final velocityX = details.velocity.pixelsPerSecond.dx;

    if (velocityX > _horizontalVelocityThreshold) {
      widget.onHorizontalSwipe?.call(PlayerSwipeDirection.right);
    } else if (velocityX < -_horizontalVelocityThreshold) {
      widget.onHorizontalSwipe?.call(PlayerSwipeDirection.left);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dismissed) return const SizedBox.shrink();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        if (heightNotifier.value > widget.minHeight) {
          _animateTo(widget.minHeight);
        }
      },
      child: ValueListenableBuilder(
        valueListenable: heightNotifier,
        builder: (context, height, _) {
          final heightRatio =
              (height - widget.minHeight) /
              (widget.maxHeight - widget.minHeight);

          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              child: SizedBox(
                height: height,
                child: widget.builder(context, height, heightRatio),
              ),
            ),
          );
        },
      ),
    );
  }
}
