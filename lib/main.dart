import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart' as init;
import 'package:storii/app/providers/app_controller.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/theme_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:storii/storage/local/font_service.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    await windowManager.ensureInitialized();

    final screen = await screenRetriever.getPrimaryDisplay();
    final screenSize = screen.size;
    final initialSize = Size(
      (screenSize.width * 0.75).clamp(1024, 1920),
      (screenSize.height * 0.75).clamp(768, 1080),
    );

    final windowOptions = WindowOptions(
      size: initialSize,
      minimumSize: const Size(800, 600),
      center: true,
      title: appName,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: .normal,
    );

    unawaited(
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      }),
    );
  }

  await init.setupGlobals(
    locale: WidgetsBinding.instance.platformDispatcher.locale,
  );
  await setupHive();
  await init.setupLicenses();
  await FontService.loadFonts();
  final container = await init.setupProviders();
  await init.setupDownloadServices();

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appControllerProvider);

    final router = ref.watch(routerProvider);
    init.appLinks.uriLinkStream.listen((url) {
      router.go('/${url.host}${url.path}', extra: url);
    });

    final themeMode = ref.watch(themeModeProvider);
    final textScaler = ref.watch(textScalerProvider);

    final lightTheme = ref.watch(themeDataProvider(.light));
    final darkTheme = ref.watch(themeDataProvider(.dark));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: globalMessengerKey,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
      title: appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        init.l10n = AppLocalizations.of(context)!;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
