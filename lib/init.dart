import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/app/background/audio_handler.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/storage/drift/database.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(settingsBox);
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
  final db = AppDatabase();

  final audioHandler = await setupAudioService();
  final container = ProviderContainer(
    overrides: ([
      databaseProvider.overrideWithValue(db),
      audioHandlerProvider.overrideWithValue(audioHandler),
    ]),
  );

  final enableHttpLogs = container.read(appSettingsProvider).enableHttpLogs;
  setupLogging(db, enableHttpLogs);

  return container;
}

void setupLogging(AppDatabase db, bool enableHttpLogs) {
  LogService.init(db);
  LogService.enableHttpLogs = enableHttpLogs;
}

Future<MyAudioHandler> setupAudioService() async {
  return await AudioService.init(
    builder: MyAudioHandler.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.likhithpraveenk.storii.audio',
      androidNotificationChannelName: 'Playback',
      androidNotificationOngoing: true,
    ),
  );
}
