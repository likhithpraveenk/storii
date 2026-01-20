import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storii/shared/helpers/extensions.dart';

typedef PlayerBuilder =
    Widget Function(BuildContext context, double expandFactor);

enum PlayerSwipeDirection { left, right }

enum PlayerViewState { hidden, mini, full }

const double _verticalVelocityThreshold = 100;
const double _horizontalVelocityThreshold = 100;
const double _heightEpsilon = 0.5;

abstract class PlayerHandle {
  double get minHeight;
  double get maxHeight;

  PlayerViewState get state;
  Stream<PlayerSwipeDirection> get swipeStream;
  ValueNotifier<double> get heightListenable;

  void snapTo(PlayerViewState newState);
}

class PlayerController extends ChangeNotifier {
  PlayerHandle? _handle;

  PlayerViewState? get state => _handle?.state;

  ValueNotifier<double>? get factorListenable =>
      _handle?.heightListenable.map(_expandFactor);

  Stream<PlayerSwipeDirection>? get swipeStream => _handle?.swipeStream;

  void toFull() => _handle?.snapTo(.full);
  void toMini() => _handle?.snapTo(.mini);
  void hide() => _handle?.snapTo(.hidden);

  double _expandFactor(double height) {
    if (_handle == null) return 0.0;
    return ((height - _handle!.minHeight) /
            (_handle!.maxHeight - _handle!.minHeight))
        .clamp(0.0, 1.0);
  }

  void _attach(PlayerHandle handle) {
    _handle = handle;
  }

  void _detach(PlayerHandle handle) {
    if (_handle != handle) return;
    _handle = null;
  }
}

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.builder,
    required this.minHeight,
    required this.maxHeight,
    required this.playerController,
  }) : assert(minHeight < maxHeight, 'minHeight must be less than maxHeight'),
       assert(minHeight >= 0, 'minHeight must be non-negative'),
       assert(maxHeight > 0, 'maxHeight must be positive');

  final double minHeight;
  final double maxHeight;
  final PlayerBuilder builder;
  final PlayerController playerController;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player>
    with TickerProviderStateMixin
    implements PlayerHandle {
  late final ValueNotifier<double> _currentHeight;

  late final AnimationController _controller;

  late Tween<double> _heightTween;

  bool isHidden = false;

  double _startHeight = 0.0;
  double _targetHeight = 0.0;

  final _swipeController = StreamController<PlayerSwipeDirection>.broadcast();

  PlayerViewState _state = .hidden;

  @override
  PlayerViewState get state => _state;

  @override
  Stream<PlayerSwipeDirection> get swipeStream => _swipeController.stream;

  @override
  double get minHeight => widget.minHeight;

  @override
  double get maxHeight => widget.maxHeight;

  @override
  ValueNotifier<double> get heightListenable => _currentHeight;

  @override
  void snapTo(PlayerViewState newState) => _snapTo(newState);

  @override
  void initState() {
    super.initState();
    _currentHeight = ValueNotifier(minHeight);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller.addListener(_animationListener);

    widget.playerController._attach(this);
  }

  @override
  void dispose() {
    _currentHeight.dispose();
    _controller.removeListener(_animationListener);
    _controller.dispose();
    widget.playerController._detach(this);
    _swipeController.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(Player oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.playerController != widget.playerController) {
      oldWidget.playerController._detach(this);
      widget.playerController._attach(this);
    }
  }

  void _animationListener() {
    final curvedValue = Curves.easeOutCubic.transform(_controller.value);

    _currentHeight.value = _heightTween.transform(curvedValue);
  }

  void _snapTo(PlayerViewState newState) {
    final targetHeight = switch (newState) {
      .full => maxHeight,
      .mini => minHeight,
      .hidden => 0.0,
    };

    if (isHidden && targetHeight > 0) {
      setState(() => isHidden = false);
    }

    if (_controller.isAnimating) {
      _controller.stop();
    }

    if ((_currentHeight.value - targetHeight).abs() < _heightEpsilon) return;

    _startHeight = _currentHeight.value;
    _targetHeight = targetHeight;

    _heightTween = Tween(begin: _startHeight, end: _targetHeight);

    _controller.reset();
    _controller.forward().whenComplete(_animationCompleteCallback);
  }

  void _setViewState(PlayerViewState newState) {
    if (_state == newState) return;
    _state = newState;
  }

  void _animationCompleteCallback() {
    if ((_targetHeight - maxHeight).abs() < _heightEpsilon) {
      _setViewState(.full);
    } else if ((_targetHeight - minHeight).abs() < _heightEpsilon) {
      _setViewState(.mini);
    } else if (_targetHeight.abs() < _heightEpsilon && !isHidden) {
      _setViewState(.hidden);
      setState(() => isHidden = true);
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_controller.isAnimating) _controller.stop();

    if (isHidden) return;
    _currentHeight.value = (_currentHeight.value - details.delta.dy).clamp(
      0,
      maxHeight,
    );
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (isHidden) return;

    final velocityY = details.velocity.pixelsPerSecond.dy;
    final h = _currentHeight.value;

    if (velocityY.abs() > _verticalVelocityThreshold) {
      if (velocityY < 0) {
        _snapTo(.full);
      } else {
        if (h < minHeight) {
          _snapTo(.hidden);
        } else {
          _snapTo(.mini);
        }
      }
      return;
    }

    final mid = (minHeight + maxHeight) / 2;

    _snapTo(h > mid ? .full : .mini);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (isHidden) return;

    final velocityX = details.velocity.pixelsPerSecond.dx;

    if (velocityX > _horizontalVelocityThreshold) {
      _swipeController.add(.right);
    } else if (velocityX < -_horizontalVelocityThreshold) {
      _swipeController.add(.left);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isHidden) return const SizedBox.shrink();

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (_currentHeight.value > minHeight) {
          _snapTo(.mini);
          return true;
        }
        return false;
      },
      child: ValueListenableBuilder(
        valueListenable: _currentHeight,
        builder: (context, height, _) {
          final expandFactor = ((height - minHeight) / (maxHeight - minHeight))
              .clamp(0.0, 1.0);

          return Align(
            alignment: .bottomCenter,
            child: GestureDetector(
              behavior: .translucent,
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              child: SizedBox(
                height: height,
                child: widget.builder(context, expandFactor),
              ),
            ),
          );
        },
      ),
    );
  }
}
