import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/settings/ui/player_settings/skip_tiles.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l.playerSettings, style: textTheme.titleLarge),
      ),
      body: const Column(children: [SkipForwardTile(), SkipBackwardTile()]),
    );
  }
}
