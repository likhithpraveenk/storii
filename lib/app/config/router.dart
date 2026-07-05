import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/providers/nav_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/features/auth/ui/server_list_screen.dart';
import 'package:storii/features/author/ui/author_detail_screen.dart';
import 'package:storii/features/author/ui/author_list_screen.dart';
import 'package:storii/features/author/ui/standalone_books.dart';
import 'package:storii/features/collections/ui/collections_screen.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/features/home/ui/home_screen.dart';
import 'package:storii/features/item/ui/item_detail_screen.dart';
import 'package:storii/features/latest_episodes/ui/latest_episodes_screen.dart';
import 'package:storii/features/library/ui/library_screen.dart';
import 'package:storii/features/logs/ui/logs_screen.dart';
import 'package:storii/features/more/ui/about_screen.dart';
import 'package:storii/features/more/ui/more_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/series/ui/series_detail_screen.dart';
import 'package:storii/features/series/ui/series_list_screen.dart';
import 'package:storii/features/settings/ui/appearance/appearance_screen.dart';
import 'package:storii/features/settings/ui/downloads/downloads_settings_screen.dart';
import 'package:storii/features/settings/ui/library/library_settings_screen.dart';
import 'package:storii/features/settings/ui/navigation/config_nav_screen.dart';
import 'package:storii/features/settings/ui/player_settings/player_settings_screen.dart';
import 'package:storii/features/settings/ui/settings_screen.dart';
import 'package:storii/features/stats/ui/stats_screen.dart';
import 'package:storii/shared/splash_screen.dart';
import 'package:storii/shared/widgets/shell_scaffold.dart';

enum AppRoute {
  splash('/splash'),
  login('/login'),
  oauth('/oauth'),
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
  authorBooks('/authors/detail/books'),
  collections('/collections'),
  downloads('/downloads'),
  latest('/latest'),
  more('/more'),
  settings('/more/settings'),
  appearanceSettings('/more/settings/appearance'),
  playerSettings('/more/settings/player'),
  navigationSettings('/more/settings/navigation'),
  downloadsSettings('/more/settings/downloads'),
  librarySettings('/more/settings/library'),
  stats('/more/stats');

  final String path;
  const AppRoute(this.path);
}

final publicRoutes = [
  AppRoute.logs.path,
  AppRoute.about.path,
  AppRoute.login.path,
  AppRoute.oauth.path,
];

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider);
  String initialRoute = AppRoute.home.path;
  if (user != null) {
    final startup = ref.read(startupNavProvider);
    final effective = ref.read(effectiveNavTargetsProvider);
    initialRoute = effective.contains(startup)
        ? startup.item.route.path
        : AppRoute.home.path;
  }

  return GoRouter(
    initialLocation: initialRoute,
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
        path: AppRoute.oauth.path,
        redirect: (context, state) {
          final url = state.extra as Uri?;
          if (url != null) {
            ref.read(addUserProvider.notifier).handleOidcCallback(url);
          }
          return AppRoute.login.path;
        },
      ),
      GoRoute(
        path: AppRoute.about.path,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: AppRoute.logs.path,
        builder: (context, state) => const LogsScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.library.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: LibraryScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
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
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.downloads.path,
                pageBuilder: (context, state) {
                  final tab = state.extra as DownloadsScreenTab?;
                  return NoTransitionPage(
                    child: DownloadsScreen(
                      tab: tab ?? DownloadsScreenTab.completed,
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
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
                    routes: [
                      GoRoute(
                        path: 'books',
                        builder: (context, state) {
                          final id = state.extra as String;
                          return StandaloneBooks(key: ValueKey(id), id: id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.collections.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CollectionsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
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
                        builder: (context, state) =>
                            const PlayerSettingsScreen(),
                      ),
                      GoRoute(
                        path: 'navigation',
                        builder: (context, state) => const ConfigNavScreen(),
                      ),
                      GoRoute(
                        path: 'downloads',
                        builder: (context, state) =>
                            const DownloadsSettingsScreen(),
                      ),
                      GoRoute(
                        path: 'library',
                        builder: (context, state) =>
                            const LibrarySettingsScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'stats',
                    builder: (context, state) => const StatsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.latest.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: LatestEpisodesScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.search.path,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.itemDetail.path,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>;
                  final id = extra['id'] as String;
                  return ItemDetailScreen(key: ValueKey(id), id: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}, name: 'GoRouterProvider');
