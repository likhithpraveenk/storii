import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class SkipForwardTile extends ConsumerWidget {
  const SkipForwardTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final skipForward = ref.watch(skipForwardProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    const durations = [5, 10, 15, 30, 45, 60];

    return ListTile(
      leading: const Icon(Icons.fast_forward),
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
              return RadioGroup<int>(
                groupValue: skipForward.inSeconds,
                onChanged: (value) {
                  if (value != null) {
                    notifier.setSkipForward(Duration(seconds: value));
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  children: [
                    ...durations.map((val) {
                      return RadioListTile<int>(
                        title: Text('${val}s'),
                        value: val,
                      );
                    }),
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

class SkipBackwardTile extends ConsumerWidget {
  const SkipBackwardTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final skipBackward = ref.watch(skipBackwardProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    const durations = [5, 10, 15, 30, 45, 60];

    return ListTile(
      leading: const Icon(Icons.fast_rewind),
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
              return RadioGroup<int>(
                groupValue: skipBackward.inSeconds,
                onChanged: (value) {
                  if (value != null) {
                    notifier.setSkipBackward(Duration(seconds: value));
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  children: [
                    ...durations.map((val) {
                      return RadioListTile<int>(
                        title: Text('${val}s'),
                        value: val,
                      );
                    }),
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
