import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/app_providers.dart';
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
    final textScaler = ref.watch(textScalerProvider);
    final localeCode = ref.watch(localeCodeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: appTheme.themeMode,
      theme: appTheme.lightTheme.build(fontFamily),
      darkTheme: appTheme.darkTheme.build(fontFamily),
      routerConfig: router,
      title: AppConstants.appName,
      locale: Locale(localeCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {.mouse, .touch, .trackpad, .stylus},
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
