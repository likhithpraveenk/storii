import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/ui/player_settings/audio_buffer_tile.dart';
import 'package:storii/features/settings/ui/player_settings/fade_on_sleep_tile.dart';
import 'package:storii/features/settings/ui/player_settings/interrupt_skip_tile.dart';
import 'package:storii/features/settings/ui/player_settings/miniplayer_subtitle_mode_tile.dart';
import 'package:storii/features/settings/ui/player_settings/os_notification_button_tiles.dart';
import 'package:storii/features/settings/ui/player_settings/playback_controls_layout_tile.dart';
import 'package:storii/features/settings/ui/player_settings/player_background_theme_tile.dart';
import 'package:storii/features/settings/ui/player_settings/show_seek_buttons_tile.dart';
import 'package:storii/features/settings/ui/player_settings/skip_tiles.dart';
import 'package:storii/features/settings/ui/player_settings/speed_tile.dart';
import 'package:storii/features/settings/ui/player_settings/sync_interval_tile.dart';
import 'package:storii/features/settings/ui/settings_header.dart';

class PlayerSettingsTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.play_circle_outline),
      title: Text(l10n.playerSettings),
      onTap: () {
        context.push(AppRoute.playerSettings.path);
      },
    );
  }
}

class PlayerSettingsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.playerSettings, style: textTheme.titleLarge),
      ),
      body: ListView(
        children: [
          SettingsHeader(
            title: l10n.playback,
            children: const [
              SkipForwardTile(),
              SkipBackwardTile(),
              InterruptSkipTile(),
              SyncIntervalTile(),
              SpeedTile(),
              AudioBufferTile(),
              FadeOnSleepTile(),
            ],
          ),
          SettingsHeader(
            title: l10n.miniPlayer,
            children: const [
              ShowSeekButtonsTile(),
              MiniplayerSubtitleModeTile(),
            ],
          ),
          SettingsHeader(
            title: l10n.fullPlayer,
            children: const [
              PlayerBackgroundThemeTile(),
              PlaybackControlsLayoutTile(),
            ],
          ),
          SettingsHeader(
            title: l10n.osNotification,
            children: const [
              OsNotificationCanSeekTile(),
              OsNotificationCanSkipTile(),
              OsNotificationCanSkipChapterTile(),
              OsNotificationCanStopTile(),
              OsNotificationCanSpeedTile(),
            ],
          ),
        ],
      ),
    );
  }
}
