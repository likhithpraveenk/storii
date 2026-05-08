import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SyncIntervalTile extends ConsumerStatefulWidget {
  const SyncIntervalTile({super.key});

  @override
  ConsumerState<SyncIntervalTile> createState() => _SyncIntervalTileState();
}

class _SyncIntervalTileState extends ConsumerState<SyncIntervalTile> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(syncIntervalProvider).inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final syncInterval = ref.watch(syncIntervalProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    const durations = [10, 20, 30, 60];

    return ListTile(
      leading: const Icon(Icons.sync_rounded),
      title: Text(l10n.syncInterval),
      subtitle: Text('${syncInterval.inSeconds}s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l10n.syncInterval,
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
                        notifier.setSyncInterval(Duration(seconds: _selected));
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
