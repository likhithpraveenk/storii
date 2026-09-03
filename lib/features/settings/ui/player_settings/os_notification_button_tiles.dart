import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class OsNotificationCanSeekTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canSeek = ref.watch(osNotificationCanSeekProvider);

    return SwitchListTile(
      value: canSeek,
      title: Text(l10n.osNotificationCanSeek),
      subtitle: Text(l10n.osNotificationCanSeekSubtitle),
      secondary: const Icon(Icons.linear_scale),
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setOsNotificationCanSeek(value);
      },
    );
  }
}

class OsNotificationCanSkipTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canSkip = ref.watch(osNotificationCanSkipProvider);

    return SwitchListTile(
      value: canSkip,
      title: Text(l10n.osNotificationCanSkip),
      subtitle: Text(l10n.osNotificationCanSkipSubtitle),
      secondary: const Icon(Icons.refresh),
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setOsNotificationCanSkip(value);
      },
    );
  }
}

class OsNotificationCanSkipChapterTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canSkipChapter = ref.watch(osNotificationCanSkipChapterProvider);

    return SwitchListTile(
      value: canSkipChapter,
      title: Text(l10n.osNotificationCanSkipChapter),
      subtitle: Text(l10n.osNotificationCanSkipChapterSubtitle),
      secondary: const Icon(Icons.skip_next),
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setOsNotificationCanSkipChapter(value);
      },
    );
  }
}

class OsNotificationCanStopTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canStop = ref.watch(osNotificationCanStopProvider);
    return SwitchListTile(
      value: canStop,
      title: Text(l10n.stop),
      subtitle: Text(l10n.osNotificationCanStopSubtitle),
      secondary: const Icon(Icons.stop_outlined),
      onChanged: (value) {
        ref.read(userSettingsProvider.notifier).setOsNotificationCanStop(value);
      },
    );
  }
}

class OsNotificationCanSpeedTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canSpeed = ref.watch(osNotificationCanSpeedProvider);
    return SwitchListTile(
      value: canSpeed,
      title: Text(l10n.playbackSpeed),
      subtitle: Text(l10n.osNotificationCanSpeedSubtitle),
      secondary: const Icon(Icons.speed),
      onChanged: (value) {
        ref
            .read(userSettingsProvider.notifier)
            .setOsNotificationCanSpeed(value);
      },
    );
  }
}
