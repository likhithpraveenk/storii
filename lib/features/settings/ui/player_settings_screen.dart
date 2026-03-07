import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class PlayerSettingsTile extends ConsumerWidget {
  const PlayerSettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.play_circle_outline),
      title: Text(AppLocalizations.of(context)!.playerSettings),
      onTap: () {
        context.push(AppRoute.playerSettings.path);
      },
    );
  }
}

class PlayerSettingsScreen extends ConsumerWidget {
  const PlayerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final skipForward = ref.watch(fastForwardProvider);
    final skipBack = ref.watch(rewindProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    const durations = [
      Duration(seconds: 5),
      Duration(seconds: 10),
      Duration(seconds: 15),
      Duration(seconds: 30),
      Duration(seconds: 45),
      Duration(seconds: 60),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l.playerSettings, style: textTheme.titleLarge),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.fast_forward),
            title: Text(l.skipForward),
            subtitle: Text('${skipForward.inSeconds}s'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              final scaffoldContext = shellScaffoldKey.currentContext;
              if (scaffoldContext == null) return;
              showModalBottomSheet(
                context: scaffoldContext,
                isScrollControlled: true,
                builder: (context) => Column(
                  mainAxisSize: .min,
                  children: [
                    Padding(
                      padding: const .fromLTRB(24, 24, 24, 16),
                      child: Text(l.skipForward, style: textTheme.titleLarge),
                    ),
                    const Divider(height: 0),
                    RadioGroup<Duration>(
                      groupValue: skipForward,
                      onChanged: (value) {
                        if (value != null) {
                          notifier.setFastForward(value);
                          Navigator.pop(context);
                        }
                      },
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          ...durations.map((val) {
                            return RadioListTile<Duration>(
                              title: Text('${val.inSeconds}s'),
                              value: val,
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.fast_rewind),
            title: Text(l.skipBack),
            subtitle: Text('${skipBack.inSeconds}s'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              final scaffoldContext = shellScaffoldKey.currentContext;
              if (scaffoldContext == null) return;
              showModalBottomSheet(
                context: scaffoldContext,
                isScrollControlled: true,
                builder: (context) => Column(
                  mainAxisSize: .min,
                  children: [
                    Padding(
                      padding: const .fromLTRB(24, 24, 24, 16),
                      child: Text(l.skipBack, style: textTheme.titleLarge),
                    ),
                    const Divider(height: 0),
                    RadioGroup<Duration>(
                      groupValue: skipBack,
                      onChanged: (value) {
                        if (value != null) {
                          notifier.setRewind(value);
                          Navigator.pop(context);
                        }
                      },
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          ...durations.map((val) {
                            return RadioListTile<Duration>(
                              title: Text('${val.inSeconds}s'),
                              value: val,
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
