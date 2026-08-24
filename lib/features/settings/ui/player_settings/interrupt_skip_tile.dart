import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class InterruptSkipTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final short = ref.watch(interruptionSkipBackwardProvider).inSeconds;
    final long = ref.watch(interruptionLongSkipBackwardProvider).inSeconds;
    final threshold = ref
        .watch(interruptionLongSkipThresholdProvider)
        .inSeconds;

    final subtitle = switch ((short, long)) {
      (0, 0) => l10n.off,
      _ => null,
    };

    return ListTile(
      leading: const Icon(Icons.notifications_active_outlined),
      title: Text(l10n.interruptSkipBack),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: () => AppBottomSheet.show(
        context,
        title: l10n.interruptSkipBack,
        subtitle: l10n.interruptSkipBackDescription,
        body: _InterruptSkipSheet(
          initialShort: short,
          initialLong: long,
          initialThreshold: threshold,
        ),
      ),
    );
  }
}

class _InterruptSkipSheet extends ConsumerStatefulWidget {
  const new({
    required this.initialShort,
    required this.initialLong,
    required this.initialThreshold,
  });

  final int initialShort;
  final int initialLong;
  final int initialThreshold;

  @override
  ConsumerState<_InterruptSkipSheet> createState() =>
      _InterruptSkipSheetState();
}

class _InterruptSkipSheetState extends ConsumerState<_InterruptSkipSheet> {
  late int _short;
  late int _long;
  late int _threshold;

  @override
  void initState() {
    super.initState();
    _short = widget.initialShort;
    _long = widget.initialLong;
    _threshold = widget.initialThreshold;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          _Picker(
            label: l10n.interruptSkipBackShort,
            initialValue: widget.initialShort,
            onChanged: (v) => _short = v,
          ),
          _Picker(
            label: l10n.interruptSkipBackLong,
            initialValue: widget.initialLong,
            onChanged: (v) => _long = v,
          ),
          _Picker(
            label: l10n.interruptSkipLongThreshold,
            initialValue: widget.initialThreshold,
            min: 5,
            onChanged: (v) => _threshold = v,
          ),
          const SizedBox(height: 16),
          AppFilledButton(
            onPressed: () {
              notifier
                ..setInterruptionSkipBackward(Duration(seconds: _short))
                ..setInterruptionLongSkipBackward(Duration(seconds: _long))
                ..setInterruptionLongSkipThreshold(
                  Duration(seconds: _threshold),
                );
              Navigator.of(context).pop();
            },
            text: l10n.save,
          ),
        ],
      ),
    );
  }
}

class _Picker extends StatelessWidget {
  const new({
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.min = 0,
  });

  final String label;
  final int initialValue;
  final int min;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: .zero,
      title: Row(
        children: [
          Expanded(child: Text(label)),
          WheelPicker.fromIntRange(
            initialValue: initialValue,
            min: min,
            max: 60,
            step: 5,
            visibleItems: 1.8,
            itemExtent: 36,
            onChangedEnd: onChanged,
            labelBuilder: (v) => '${v}s',
            wheelWidth: 100,
          ),
        ],
      ),
    );
  }
}
