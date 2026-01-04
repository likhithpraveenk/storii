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
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks([
      'google_fonts - SIL Open Font License 1.1',
      'Atkinson Hyperlegible Next',
      'Lora',
      'Quantico',
      'Poppins',
      'Noto Sans',
      'Fira Sans Condensed',
    ], license);
  });

  LicenseRegistry.addLicense(() async* {
    final apache = await rootBundle.loadString('google_fonts/apache_2_0.txt');
    yield LicenseEntryWithLineBreaks([
      'google_fonts - Apache License 2.0',
      'Special Elite',
    ], apache);
  });

  LicenseRegistry.addLicense(() async* {
    final gplLicense = await rootBundle.loadString('LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['storii'], gplLicense);
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
