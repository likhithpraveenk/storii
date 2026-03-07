import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/ui/server_list_screen.dart';
import 'package:storii/features/author/ui/author_detail_screen.dart';
import 'package:storii/features/author/ui/author_list_screen.dart';
import 'package:storii/features/collections/ui/collections_screen.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/features/home/ui/home_screen.dart';
import 'package:storii/features/item/ui/item_detail_screen.dart';
import 'package:storii/features/library/ui/library_screen.dart';
import 'package:storii/features/logs/ui/logs_screen.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/more_screen.dart';
import 'package:storii/features/profile/ui/profile_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/series/ui/series_detail_screen.dart';
import 'package:storii/features/series/ui/series_list_screen.dart';
import 'package:storii/features/settings/ui/appearance_screen.dart';
import 'package:storii/features/settings/ui/config_nav_screen.dart';
import 'package:storii/features/settings/ui/player_settings_screen.dart';
import 'package:storii/features/settings/ui/settings_screen.dart';
import 'package:storii/shared/splash_screen.dart';
import 'package:storii/shared/widgets/shell_scaffold.dart';

enum AppRoute {
  splash('/splash'),
  login('/login'),
  about('/about'),
  logs('/logs'),
  home('/'),
  library('/library'),
  itemDetail('/itemDetail'),
  search('/search'),
  series('/series'),
  seriesDetail('/series/detail'),
  authors('/authors'),
  authorDetail('/authors/detail'),
  collections('/collections'),
  downloads('/downloads'),
  more('/more'),
  settings('/more/settings'),
  appearanceSettings('/more/settings/appearance'),
  playerSettings('/more/settings/player'),
  navigationSettings('/more/settings/navigation'),
  profile('/more/profile');

  final String path;
  const AppRoute(this.path);
}

final publicRoutes = [
  AppRoute.logs.path,
  AppRoute.about.path,
  AppRoute.login.path,
];

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider);

  return GoRouter(
    initialLocation: AppRoute.home.path,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final isPublic = publicRoutes.contains(state.matchedLocation);
      if (user == null && !isPublic) {
        return AppRoute.login.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) => const ServerListScreen(),
      ),
      GoRoute(
        path: AppRoute.about.path,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: AppRoute.logs.path,
        builder: (context, state) => const LogsScreen(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ShellScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoute.home.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: AppRoute.library.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LibraryScreen()),
          ),
          GoRoute(
            path: AppRoute.series.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SeriesListScreen()),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  final id = state.extra as String;
                  return SeriesDetailScreen(key: ValueKey(id), id: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.downloads.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DownloadsScreen()),
          ),
          GoRoute(
            path: AppRoute.authors.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AuthorListScreen()),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  final id = state.extra as String;
                  return AuthorDetailScreen(key: ValueKey(id), id: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.collections.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CollectionsScreen()),
          ),
          GoRoute(
            path: AppRoute.more.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MoreScreen()),
            routes: [
              GoRoute(
                path: 'settings',
                builder: (context, state) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: 'appearance',
                    builder: (context, state) => const AppearanceScreen(),
                  ),
                  GoRoute(
                    path: 'player',
                    builder: (context, state) => const PlayerSettingsScreen(),
                  ),
                  GoRoute(
                    path: 'navigation',
                    builder: (context, state) => const ConfigNavScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.search.path,
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: AppRoute.itemDetail.path,
            builder: (context, state) {
              final id = state.extra as String;
              return ItemDetailScreen(key: ValueKey(id), id: id);
            },
          ),
        ],
      ),
    ],
  );
});
