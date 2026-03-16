import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storii/app/config/constants.dart';

class WheelPicker<T> extends StatefulWidget {
  const WheelPicker({
    super.key,
    required this.initialValue,
    required this.items,
    required this.labelBuilder,
    this.onChanged,
    this.onChangedEnd,
    this.presets = const [],
    this.itemExtent = 48.0,
    this.visibleItems = 5,
  }) : assert(visibleItems % 2 == 1, 'visibleItems must be odd');

  final T initialValue;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T>? onChanged;
  final ValueChanged<T>? onChangedEnd;
  final List<T> presets;
  final double itemExtent;
  final int visibleItems;

  static WheelPicker<double> fromDoubleRange({
    Key? key,
    required double initialValue,
    required double min,
    required double max,
    required double step,
    required String Function(double) labelBuilder,
    ValueChanged<double>? onChanged,
    ValueChanged<double>? onChangedEnd,
    List<double> presets = const [],
    double itemExtent = 48.0,
    int visibleItems = 5,
  }) {
    final items = <double>[];
    for (var v = min; v <= max + step * kEpsilon; v += step) {
      items.add(double.parse(v.toStringAsFixed(10)));
    }
    return WheelPicker<double>(
      key: key,
      initialValue: initialValue,
      items: items,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
      onChangedEnd: onChangedEnd,
      presets: presets,
      itemExtent: itemExtent,
      visibleItems: visibleItems,
    );
  }

  static WheelPicker<int> fromIntRange({
    Key? key,
    required int initialValue,
    required int min,
    required int max,
    required int step,
    required String Function(int) labelBuilder,
    ValueChanged<int>? onChanged,
    ValueChanged<int>? onChangedEnd,
    List<int> presets = const [],
    double itemExtent = 48.0,
    int visibleItems = 5,
  }) {
    final count = ((max - min) / step).floor() + 1;
    final items = List.generate(count, (index) => min + (index * step));
    return WheelPicker<int>(
      key: key,
      initialValue: initialValue,
      items: items,
      labelBuilder: labelBuilder,
      onChanged: onChanged,
      onChangedEnd: onChangedEnd,
      presets: presets,
      itemExtent: itemExtent,
      visibleItems: visibleItems,
    );
  }

  @override
  State<WheelPicker<T>> createState() => _WheelPickerState<T>();
}

class _WheelPickerState<T> extends State<WheelPicker<T>> {
  late FixedExtentScrollController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _indexOfValue(widget.initialValue);
    _controller = FixedExtentScrollController(initialItem: _selectedIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _indexOfValue(T value) {
    final index = widget.items.indexWhere((e) => e == value);
    return index < 0 ? 0 : index;
  }

  void _onScrollToItem(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
    HapticFeedback.selectionClick();
    widget.onChanged?.call(widget.items[index]);
  }

  void _jumpToValue(T value) {
    final index = _indexOfValue(value);
    _controller.jumpToItem(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final singleHeight = widget.itemExtent * widget.visibleItems;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        SizedBox(
          height: singleHeight,
          child: Stack(
            children: [
              NotificationListener<ScrollEndNotification>(
                onNotification: (_) {
                  widget.onChangedEnd?.call(widget.items[_selectedIndex]);
                  return false;
                },
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: widget.itemExtent,
                  perspective: 0.01,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: _onScrollToItem,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: widget.items.length,
                    builder: (_, index) {
                      final selected = index == _selectedIndex;
                      return Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: selected ? .w700 : .w400,
                            color: selected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withValues(
                                    alpha: 0.5,
                                  ),
                            fontSize: selected ? 22 : 18,
                          ),
                          child: Text(widget.labelBuilder(widget.items[index])),
                        ),
                      );
                    },
                  ),
                ),
              ),
              IgnorePointer(
                child: Center(
                  child: Container(
                    height: widget.itemExtent,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: .circular(kRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.presets.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: .center,
            children: widget.presets.map((p) {
              final active = widget.items[_selectedIndex] == p;
              return ChoiceChip(
                label: Text(widget.labelBuilder(p)),
                selected: active,
                onSelected: (_) => _jumpToValue(p),
                selectedColor: theme.colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: active
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurface,
                  fontWeight: active ? .w600 : .normal,
                ),
                showCheckmark: false,
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
