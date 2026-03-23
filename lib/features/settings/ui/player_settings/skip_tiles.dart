import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SkipForwardTile extends ConsumerStatefulWidget {
  const SkipForwardTile({super.key});

  @override
  ConsumerState<SkipForwardTile> createState() => _SkipForwardTileState();
}

class _SkipForwardTileState extends ConsumerState<SkipForwardTile> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(skipForwardProvider).inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final skipForward = ref.watch(skipForwardProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    const durations = [10, 15, 30, 60];

    return ListTile(
      leading: const Icon(Icons.replay),
      title: Text(l.skipForward),
      subtitle: Text('${skipForward.inSeconds}s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l.skipForward,
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    WheelPicker.fromIntRange(
                      initialValue: _selected,
                      min: 5,
                      max: 120,
                      step: 5,
                      onChangedEnd: (sec) => _selected = sec,
                      labelBuilder: (v) => '${v}s',
                      presets: durations,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setSkipForward(Duration(seconds: _selected));
                        Navigator.of(context).pop();
                      },
                      text: l.save,
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

class SkipBackwardTile extends ConsumerStatefulWidget {
  const SkipBackwardTile({super.key});

  @override
  ConsumerState<SkipBackwardTile> createState() => _SkipBackwardTileState();
}

class _SkipBackwardTileState extends ConsumerState<SkipBackwardTile> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(skipBackwardProvider).inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final skipBackward = ref.watch(skipBackwardProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    const durations = [10, 15, 30, 60];

    return ListTile(
      leading: Transform.flip(flipX: true, child: const Icon(Icons.replay)),
      title: Text(l.skipBack),
      subtitle: Text('${skipBackward.inSeconds}s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l.skipBack,
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    WheelPicker.fromIntRange(
                      initialValue: _selected,
                      min: 5,
                      max: 120,
                      step: 5,
                      onChangedEnd: (sec) => _selected = sec,
                      labelBuilder: (v) => '${v}s',
                      presets: durations,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setSkipBackward(Duration(seconds: _selected));
                        Navigator.of(context).pop();
                      },
                      text: l.save,
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
