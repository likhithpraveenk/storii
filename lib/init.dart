import 'dart:async';
import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/app/background/audio_handler.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/storage/drift/database.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('settings');
}

Future<void> setupLicenses() async {
  LicenseRegistry.addLicense(() async* {
    final ofl = await rootBundle.loadString('google_fonts/OFL.txt');
    final apacheV2 = await rootBundle.loadString('google_fonts/apache_2_0.txt');

    final oflFonts = {
      'Atkinson Hyperlegible Next':
          'Copyright 2020-2024 The Atkinson Hyperlegible Next Project Authors (https://github.com/googlefonts/atkinson-hyperlegible-next)',
      'Lora':
          'Copyright 2011 The Lora Project Authors (https://github.com/cyrealtype/Lora-Cyrillic), with Reserved Font Name "Lora".',
      'Quantico':
          'Copyright (c) 2011, Matthew Desmond (http://www.madtype.com | mattdesmond@gmail.com) with Reserved Font Name "Quantico".',
      'Poppins':
          'Copyright 2020 The Poppins Project Authors (https://github.com/itfoundry/Poppins)',
      'Noto Sans':
          'Copyright 2022 The Noto Project Authors (https://github.com/notofonts/latin-greek-cyrillic)',
      'Fira Sans Condensed':
          'Copyright (c) 2012-2015, The Mozilla Foundation and Telefonica S.A.',
    };

    final apacheFonts = ['Special Elite'];

    for (final font in oflFonts.entries) {
      yield LicenseEntryWithLineBreaks([
        'google_fonts: ${font.key}',
      ], '${font.value}\n\n$ofl');
    }

    for (final font in apacheFonts) {
      yield LicenseEntryWithLineBreaks(['google_fonts: $font'], apacheV2);
    }
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

  container.read(logsProvider.notifier).initGlobalErrorHandling();
  return container;
}

void setSystemUIOverlay() async {
  if (Platform.isAndroid) {
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
  }
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
