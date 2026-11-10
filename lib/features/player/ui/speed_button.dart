import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_slider.dart';

class SpeedButton extends ConsumerWidget {
  const new({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(localSpeedProvider);
    Future<void> openSheet(BuildContext ctx) => AppBottomSheet.show(
      ctx,
      title: l10n.playbackSpeed,
      body: Consumer(
        builder: (_, ref, _) {
          return SpeedSheet(
            speed: ref.watch(localSpeedProvider),
            onChanged: (value) => ref
                .read(localSpeedProvider.notifier)
                .setSpeed(value.fixed2.clamp(speedMin, speedMax)),
          );
        },
      ),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.playbackSpeed),
        leading: const Icon(Icons.speed_rounded),
        trailing: Text(speed.speedLabel),
        onTap: () {
          final navigator = Navigator.of(context)..pop();
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => openSheet(navigator.context),
          );
        },
      );
    }

    return IconButton(
      onPressed: () => openSheet(context),
      tooltip: l10n.playbackSpeed,
      icon: Text(
        speed.speedLabel,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class SpeedSheet extends StatelessWidget {
  const new({required this.speed, required this.onChanged, super.key});

  final double speed;
  final Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .fromLTRB(24, 0, 24, 24),
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: .center,
            children: [
              IconButton(
                onPressed: speed > speedMin
                    ? () => onChanged(speed - speedStep)
                    : null,
                icon: const Icon(Icons.remove),
                visualDensity: .compact,
              ),
              SizedBox(
                width: 100,
                child: Text(
                  speed.speedLabel,
                  style: theme.textTheme.headlineLarge,
                  textAlign: .center,
                ),
              ),
              IconButton(
                onPressed: speed < speedMax
                    ? () => onChanged(speed + speedStep)
                    : null,
                icon: const Icon(Icons.add),
                visualDensity: .compact,
              ),
            ],
          ),
          AppSlider(
            value: speed,
            min: speedMin,
            max: speedMax,
            divisions: ((speedMax - speedMin) / speedStep).toInt(),
            labelBuilder: (value) => value.speedLabel,
            onChangeEnd: (value) {
              onChanged(value.fixed2);
            },
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: .center,
            children: [
              ...speedPresets.map((p) {
                final active = speed == p;
                return ChoiceChip(
                  label: Text(p.speedLabel),
                  selected: active,
                  onSelected: (_) => onChanged(p),
                  selectedColor: theme.colorScheme.primaryContainer,
                  labelStyle: TextStyle(
                    color: active
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurface,
                    fontWeight: active ? .w600 : .normal,
                  ),
                  showCheckmark: false,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
