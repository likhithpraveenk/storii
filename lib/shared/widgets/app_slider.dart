import 'package:material_ui/material_ui.dart';

class AppSlider extends StatefulWidget {
  const new({
    super.key,
    required this.value,
    this.labelBuilder,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.padding,
    this.thumbColor,
    this.activeTrackColor,
    this.showValueIndicator = .onDrag,
    this.trackHeight,
    this.cancelThreshold = -48.0,
  });

  final double value;
  final String Function(double value)? labelBuilder;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final EdgeInsetsGeometry? padding;
  final Color? thumbColor;
  final Color? activeTrackColor;
  final ShowValueIndicator showValueIndicator;
  final double? trackHeight;
  final double cancelThreshold;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double? _dragValue;
  double? _initialValue;
  bool _isDragging = false;
  bool _isCanceling = false;

  double get _value =>
      (_dragValue ?? widget.value).clamp(widget.min, widget.max);

  void _onPointerDown(PointerDownEvent _) {
    _initialValue = widget.value;
    _dragValue = null;
    _isCanceling = false;
    setState(() => _isDragging = true);
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (!_isDragging) return;
    final isCanceling = event.localPosition.dy < widget.cancelThreshold;
    if (isCanceling != _isCanceling) {
      setState(() => _isCanceling = isCanceling);
    }
  }

  void _onPointerUp(PointerUpEvent _) {
    Future.microtask(_dropUnclaimedInteraction);
  }

  void _onPointerCancel(PointerCancelEvent _) {
    Future.microtask(_dropUnclaimedInteraction);
  }

  void _dropUnclaimedInteraction() {
    if (!mounted || !_isDragging) return;
    setState(_resetInteraction);
  }

  void _handleChangeStart(double value) {
    _initialValue ??= widget.value;
    if (!_isDragging) setState(() => _isDragging = true);
    widget.onChangeStart?.call(value);
  }

  void _handleChanged(double value) {
    if (!_isDragging) {
      _initialValue = widget.value;
      _isDragging = true;
    }
    setState(() => _dragValue = value);

    if (_isCanceling) return;
    widget.onChanged?.call(value);
  }

  void _handleChangeEnd(double value) {
    final initial = _initialValue ?? value;

    if (_isCanceling) {
      if (widget.value != initial) widget.onChanged?.call(initial);
    } else {
      widget.onChangeEnd?.call(value);
    }

    if (!mounted) return;
    setState(_resetInteraction);
  }

  void _resetInteraction() {
    _dragValue = null;
    _initialValue = null;
    _isDragging = false;
    _isCanceling = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thumbColor = widget.thumbColor ?? theme.colorScheme.primary;
    final activeTrackColor =
        widget.activeTrackColor ?? theme.colorScheme.primary;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: Stack(
        clipBehavior: .none,
        alignment: .centerLeft,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: thumbColor,
              trackHeight: widget.trackHeight,
              activeTrackColor: activeTrackColor,
              year2023: false,
            ),
            child: Slider(
              value: _value,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              label: widget.labelBuilder?.call(_value),
              onChangeStart: _handleChangeStart,
              onChanged: _handleChanged,
              onChangeEnd: _handleChangeEnd,
              showValueIndicator: widget.showValueIndicator,
              padding: widget.padding ?? .zero,
            ),
          ),
          if (_isDragging)
            Positioned(
              top: widget.cancelThreshold - 24,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Center(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 100),
                    scale: _isCanceling ? 1.8 : 1.0,
                    child: Container(
                      padding: const .all(6),
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: _isCanceling
                            ? theme.colorScheme.error
                            : theme.colorScheme.surfaceContainerHighest,
                      ),
                      child: Icon(
                        _isCanceling
                            ? Icons.cancel_rounded
                            : Icons.cancel_outlined,
                        size: 20,
                        color: _isCanceling
                            ? theme.colorScheme.onError
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
