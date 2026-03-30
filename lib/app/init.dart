import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';

Future<void> setupLicenses() async {
  LicenseRegistry.addLicense(() async* {
    final ofl = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['AtkinsonHyperlegibleNext'], ofl);
  });

  LicenseRegistry.addLicense(() async* {
    final gplV3 = await rootBundle.loadString('LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['storii'], gplV3);
  });
}

Future<ProviderContainer> setupProviders() async {
  final container = ProviderContainer(overrides: ([]));

  LogService.init(container);
  audioHandler = await setupAudioService(container);

  //! session cleanup
  final settings = container.read(appSettingsProvider);
  if (settings.currentUser != null) {
    await container.read(sessionsCleanupProvider.notifier).cleanup();
  }

  return container;
}

Future<AppAudioHandler> setupAudioService(ProviderContainer container) async {
  return await AudioService.init(
    builder: () => AppAudioHandler(
      speed: container.read(speedProvider),
      getSkipForward: () => container.read(skipForwardProvider),
      getSkipBackward: () => container.read(skipBackwardProvider),
    ),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.likhithpraveenk.storii.audio',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationIcon: 'drawable/ic_launcher_foreground',
      androidStopForegroundOnPause: true,
      androidNotificationOngoing: true,
    ),
  );
}
