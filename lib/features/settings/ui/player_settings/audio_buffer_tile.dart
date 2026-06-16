import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class AudioBufferTile extends ConsumerStatefulWidget {
  const AudioBufferTile({super.key});

  @override
  ConsumerState<AudioBufferTile> createState() => _AudioBufferTileState();
}

class _AudioBufferTileState extends ConsumerState<AudioBufferTile> {
  late int _bufferSec;
  bool _initialized = false;

  static const _bufferPresets = [15, 30, 45];

  @override
  Widget build(BuildContext context) {
    final bufferDuration = ref.watch(minBufferDurationProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    if (!_initialized) {
      _bufferSec = bufferDuration.inSeconds;
      _initialized = true;
    }

    return ListTile(
      leading: const Icon(Icons.hourglass_bottom),
      title: Text(l10n.audioBufferDuration),
      subtitle: Text('${bufferDuration.inSeconds}s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l10n.audioBufferDuration,
          body: Builder(
            builder: (context) {
              final theme = Theme.of(context);
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      l10n.audioBufferDurationDescription,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: .center,
                    ),
                    const SizedBox(height: 24),
                    WheelPicker.fromIntRange(
                      initialValue: _bufferSec,
                      min: 5,
                      max: 60,
                      step: 5,
                      onChangedEnd: (sec) => _bufferSec = sec,
                      labelBuilder: (v) => '${v}s',
                      presets: _bufferPresets,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.changeRestartRequired,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: .center,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setMinBufferDuration(
                          Duration(seconds: _bufferSec),
                        );
                        Navigator.of(context).pop();
                      },
                      text: l10n.save,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
