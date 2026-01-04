import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/init.dart';
import 'package:storii/l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLicenses();
  final container = await initProviders();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final appTheme = ref.watch(themeProvider);
    final fontFamily = ref.watch(fontFamilyProvider);
    final fontScale = ref.watch(fontScaleProvider);
    final localeCode = ref.watch(localeCodeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: appTheme.themeMode,
      theme: appTheme.build(
        brightness: Brightness.light,
        fontFamily: fontFamily,
        fontScale: fontScale,
      ),
      darkTheme: appTheme.build(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        fontScale: fontScale,
      ),
      routerConfig: router,
      title: AppConstants.appName,
      locale: Locale(localeCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {.mouse, .touch, .trackpad, .stylus},
        scrollbars: false,
      ),
    );
  }
}
