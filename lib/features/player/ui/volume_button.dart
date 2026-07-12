import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class VolumeButton extends ConsumerWidget {
  const VolumeButton({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volume = ref.watch(volumeProvider).value ?? 1;
    Future<void> openSheet() => AppBottomSheet.show(
      context,
      title: l10n.volume,
      body: _VolumeSliderSheet(volume),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.volume),
        leading: const Icon(Icons.volume_up),
        trailing: Text('${(volume * 100).round()}%'),
        onTap: () {
          Navigator.of(context).pop();
          openSheet();
        },
      );
    }

    return IconButton(
      onPressed: openSheet,
      tooltip: l10n.volume,
      icon: Icon(
        volume == 0.0
            ? Icons.volume_mute
            : volume < 1.0
            ? Icons.volume_down
            : Icons.volume_up,
      ),
    );
  }
}

class _VolumeSliderSheet extends ConsumerStatefulWidget {
  const _VolumeSliderSheet(this.initialVolume);
  final double initialVolume;

  @override
  ConsumerState<_VolumeSliderSheet> createState() => _VolumeSliderSheetState();
}

class _VolumeSliderSheetState extends ConsumerState<_VolumeSliderSheet> {
  late double _volume;

  final _max = 1.0;

  @override
  void initState() {
    super.initState();
    _volume = widget.initialVolume;
  }

  String _display(double v) => '${(v * 100).round()}%';

  @override
  Widget build(BuildContext context) {
    final volume = ref.watch(volumeProvider).value ?? 1;

    return Padding(
      padding: const .fromLTRB(12, 0, 12, 24),
      child: Column(
        children: [
          Text(_display(_volume), style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                tooltip: l10n.decreaseVolume,
                onPressed: () {
                  setState(() {
                    _volume = (_volume - 0.05).clamp(0, _max);
                  });
                },
                icon: Icon(
                  volume == 0.0 ? Icons.volume_mute : Icons.volume_down,
                ),
              ),
              Expanded(
                child: Slider(
                  padding: .zero,
                  showValueIndicator: .onDrag,
                  value: _volume.clamp(0.0, _max),
                  divisions: (_max * 20).round(),
                  min: 0.0,
                  max: _max,
                  onChanged: (v) => setState(() => _volume = v),
                  onChangeEnd: (v) {
                    ref.read(volumeControlProvider.notifier).setVolume(v);
                  },
                ),
              ),
              IconButton(
                tooltip: l10n.increaseVolume,
                onPressed: () {
                  setState(() {
                    _volume = (_volume + 0.05).clamp(0, _max);
                  });
                },
                icon: const Icon(Icons.volume_up),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
