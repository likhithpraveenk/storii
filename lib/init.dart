import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/drift/database.dart';

Future<void> initLicenses() async {
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

Future<ProviderContainer> initProviders() async {
  final db = AppDatabase();

  final appSettings = await loadSettingsFromDB(db);
  final userId = appSettings.currentUser?.id;
  final userSettings = await loadUserSettingsFromDB(db, userId);
  final container = ProviderContainer(
    overrides: ([
      databaseProvider.overrideWithValue(db),
      appSettingsProvider.overrideWith(() => AppSettingsNotifier(appSettings)),
      if (userId != null && userSettings != null)
        userSettingsProvider(
          userId,
        ).overrideWith(() => UserSettingsNotifier(userSettings)),
    ]),
  );

  container.read(logsProvider.notifier).initGlobalErrorHandling();
  return container;
}

Future<AppSettings> loadSettingsFromDB(AppDatabase db) async {
  final entry = await db.managers.settings
      .filter((f) => f.key.equals(appSettingsKey))
      .getSingleOrNull();

  return entry != null
      ? AppSettings.fromJson(jsonDecode(entry.value))
      : const AppSettings();
}

Future<UserSettings?> loadUserSettingsFromDB(
  AppDatabase db,
  String? userId,
) async {
  if (userId == null) return null;

  final entry = await db.managers.settings
      .filter((f) => f.key.equals(userId))
      .getSingleOrNull();

  return entry != null
      ? UserSettings.fromJson(jsonDecode(entry.value))
      : UserSettings(userId: userId);
}
