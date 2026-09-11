import 'package:material_ui/material_ui.dart';

class AppSlider extends StatefulWidget {
  const new({
    super.key,
    required this.value,
    this.labelBuilder,
    this.onChanged,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.padding,
    this.thumbColor,
    this.activeTrackColor,
    this.showValueIndicator = .onDrag,
    this.trackHeight,
  });

  final double value;
  final String Function(double value)? labelBuilder;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final EdgeInsetsGeometry? padding;
  final Color? thumbColor;
  final Color? activeTrackColor;
  final ShowValueIndicator showValueIndicator;
  final double? trackHeight;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double? _dragValue;
  double? _initialValue;
  bool _isDragging = false;
  bool _isCanceling = false;

  static const kThreshold = -48;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thumbColor = widget.thumbColor ?? theme.colorScheme.primary;
    final activeTrackColor =
        widget.activeTrackColor ?? theme.colorScheme.primary;
    final currentValue = _dragValue ?? widget.value;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerDown: (_) {
            _initialValue = widget.value;
            setState(() {
              _isDragging = true;
              _isCanceling = false;
            });
          },
          onPointerMove: (event) {
            if (!_isDragging) return;

            final isAboveSlider = event.localPosition.dy < kThreshold;
            if (isAboveSlider != _isCanceling) {
              setState(() => _isCanceling = isAboveSlider);
            }
          },
          onPointerUp: (_) {
            if (!_isDragging) return;

            if (_isCanceling) {
              if (_initialValue != null) {
                widget.onChanged?.call(_initialValue!);
              }
            } else {
              widget.onChangeEnd?.call(_dragValue ?? widget.value);
            }

            setState(() {
              _dragValue = null;
              _isDragging = false;
              _isCanceling = false;
            });
          },
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
                  value: currentValue,
                  min: widget.min,
                  max: widget.max,
                  divisions: widget.divisions,
                  label: widget.labelBuilder?.call(currentValue),
                  onChanged: (value) {
                    setState(() => _dragValue = value);
                    if (!_isCanceling) {
                      widget.onChanged?.call(value);
                    }
                  },
                  showValueIndicator: widget.showValueIndicator,
                  padding: widget.padding ?? .zero,
                ),
              ),
              if (_isDragging)
                Positioned(
                  top: kThreshold - 24,
                  left: 0,
                  right: 0,
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
            ],
          ),
        );
      },
    );
  }
}
