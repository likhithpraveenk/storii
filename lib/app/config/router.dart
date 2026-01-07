import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/ui/server_list_screen.dart';
import 'package:storii/features/collections/ui/collections_screen.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/features/home/ui/home_screen.dart';
import 'package:storii/features/library/ui/library_screen.dart';
import 'package:storii/features/library_item/ui/item_detail_screen.dart';
import 'package:storii/features/logs/ui/logs_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/settings/ui/about_screen.dart';
import 'package:storii/features/settings/ui/nav_setting_screen.dart';
import 'package:storii/features/settings/ui/settings_screen.dart';
import 'package:storii/shared/splash_screen.dart';

enum AppRoute {
  splash('/splash'),
  login('/login'),
  home('/'),
  library('/library'),
  search('/search'),
  collections('/collections'),
  settings('/settings'),
  // player('/player'),
  logs('/logs'),
  downloads('/downloads'),
  about('/about'),
  navigationSettings('/navigation-setting'),
  item('/item/:id'),
  series('/series/:id'),
  authors('/authors/:id');

  final String path;
  const AppRoute(this.path);

  String withId(String id) => path.replaceFirst(':id', id);
}

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'RouterGlobal');
final homeScaffoldKey = GlobalKey<ScaffoldState>(
  debugLabel: 'NavigationScaffold',
);
final publicRoutes = [AppRoute.logs.path, AppRoute.about.path, AppRoute.login];

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider);
  final navTargets = ref.watch(navTargetsProvider);

  return GoRouter(
    initialLocation: AppRoute.home.path,
    redirect: (context, state) {
      final isPublic = publicRoutes.contains(state.matchedLocation);
      if (user == null && !isPublic) {
        return AppRoute.login.path;
      }
      return null;
    },
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) => const ServerListScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            key: homeScaffoldKey,
            bottomNavigationBar: NavBar(
              currentIndex: navigationShell.currentIndex,
              onTap: navigationShell.goBranch,
            ),
            body: navigationShell,
          );
        },
        branches: navTargets.map((target) {
          return StatefulShellBranch(
            routes: [
              GoRoute(
                path: target.item.route.path,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: switch (target) {
                    .home => const HomeScreen(),
                    .library => const LibraryScreen(),
                    .search => const SearchScreen(),
                    .downloads => const DownloadsScreen(),
                    .collections => const CollectionsScreen(),
                    .settings => const SettingsScreen(),
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
      GoRoute(
        path: AppRoute.navigationSettings.path,
        builder: (context, state) => const NavSettingScreen(),
      ),
      GoRoute(
        path: AppRoute.about.path,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: AppRoute.logs.path,
        builder: (context, state) => const LogsScreen(),
      ),
      GoRoute(
        path: AppRoute.item.path,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null) {
            throw StateError(
              'path parameter to library item detail not passed',
            );
          }
          return ItemDetailScreen(id: id);
        },
      ),
    ],
  );
});
