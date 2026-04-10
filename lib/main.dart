import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  await init.setupLicenses();
  await FontService.loadFonts();

  final container = await init.setupProviders();
  await init.setupGlobals();
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
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
