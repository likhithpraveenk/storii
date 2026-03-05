import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/sessions_cleanup.dart';
import 'package:storii/globals.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:storii/storage/hive/hive_adapters.dart';
import 'package:storii/storage/hive/hive_registrar.g.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  Hive.registerAdapter(UriAdapter());
  await Future.wait([
    Hive.openBox<String>(appSettingsBox),
    Hive.openBox<String>(userSettingsBox),
    Hive.openBox<UserDomain>(usersBox),
    Hive.openBox<Server>(serversBox),
    Hive.openBox<String>(sessionIdBox),
  ]);
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
  final container = ProviderContainer(overrides: ([]));

  LogService.init(container);
  audioHandler = await setupAudioService(container);

  //! session cleanup
  final settings = container.read(appSettingsProvider);
  if (settings.currentUser != null) {
    container.read(sessionsCleanupProvider.notifier).cleanup();
  }

  return container;
}

Future<AppAudioHandler> setupAudioService(ProviderContainer container) async {
  return await AudioService.init(
    builder: () => AppAudioHandler(
      speed: container.read(speedProvider),
      getFastForward: () => container.read(fastForwardProvider),
      getRewind: () => container.read(rewindProvider),
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

Future<void> setupGlobals() async {
  packageInfo = await PackageInfo.fromPlatform();
  final deviceInfoPlugin = DeviceInfoPlugin();
  androidDeviceInfo = await deviceInfoPlugin.androidInfo;
}
