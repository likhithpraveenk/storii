import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/just_audio_player.dart';
import 'package:storii/l10n/l10n.dart';

late final AppLinks appLinks;
late AppLocalizations l10n;

Future<void> setupGlobals({Locale? locale}) async {
  appLinks = AppLinks();

  // init localizations
  final Locale supported =
      locale != null && AppLocalizations.supportedLocales.contains(locale)
      ? locale
      : const Locale('en');
  l10n = await AppLocalizations.delegate.load(supported);
}

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
  final observers = <ProviderObserver>[];
  final overrides = <Override>[];

  if (kDebugMode) {
    //! uncomment for riverpod logs
    // observers.add(const ProviderLogger());
  }

  final container = ProviderContainer(
    retry: (retryCount, error) {
      if (retryCount > 2) return null;
      return Duration(milliseconds: retryCount * 200);
    },
    observers: observers,
    overrides: overrides,
  );

  LogService.init(container);
  audioHandler = await setupAudioService(container);

  return container;
}

Future<void> setupDownloadServices() async {
  await DownloadsNotificationService.instance.init();
}

Future<AppAudioHandler> setupAudioService(ProviderContainer container) async {
  return await AudioService.init(
    builder: () => AppAudioHandler(
      player: container.read(justAudioPlayerProvider),
      speed: container.read(speedProvider),
      getSkipForward: () => container.read(skipForwardProvider),
      getSkipBackward: () => container.read(skipBackwardProvider),
    ),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.likhithpraveenk.storii.audio',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationIcon: 'drawable/ic_notification',
      androidStopForegroundOnPause: true,
      androidNotificationOngoing: true,
      preloadArtwork: true,
    ),
  );
}
