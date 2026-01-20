import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import 'package:storii/features/more/ui/more_screen.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/features/profile/ui/profile_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/series/ui/series_detail_screen.dart';
import 'package:storii/features/series/ui/series_list_screen.dart';
import 'package:storii/features/settings/ui/about_screen.dart';
import 'package:storii/features/settings/ui/nav_setting_screen.dart';
import 'package:storii/features/settings/ui/settings_screen.dart';
import 'package:storii/shared/splash_screen.dart';
import 'package:storii/shared/widgets/custom_pop_scope.dart';
import 'package:storii/shared/widgets/shell_scaffold.dart';

enum AppRoute {
  splash('/splash'),
  login('/login'),
  about('/about'),
  logs('/logs'),
  home('/'),
  library('/library'),
  libraryItem('/library/:id'),
  search('/search'),
  series('/series'),
  seriesDetail('/series/:id'),
  authors('/authors'),
  authorDetail('/authors/:id'),
  collections('/collections'),
  downloads('/downloads'),
  more('/more'),
  settings('/more/settings'),
  navigationSettings('/more/settings/navigation'),
  profile('/more/profile');

  final String path;
  const AppRoute(this.path);

  String withId(String id) => path.replaceFirst(':id', id);
}

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final publicRoutes = [AppRoute.logs.path, AppRoute.about.path, AppRoute.login];

final routerProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = RouterRefreshNotifier(ref);
  final playerController = ref.read(playerControllerProvider);

  return GoRouter(
    initialLocation: AppRoute.home.path,
    navigatorKey: rootNavigatorKey,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final isPublic = publicRoutes.contains(state.matchedLocation);
      final user = ref.read(currentUserProvider);

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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScaffold(navigationShell, controller: playerController);
        },
        branches: [
          StatefulShellBranch(
            initialLocation: AppRoute.home.path,
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.library.path,
            routes: [
              GoRoute(
                path: AppRoute.library.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const LibraryScreen(),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return ItemDetailScreen(key: ValueKey(id), id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.series.path,
            routes: [
              GoRoute(
                path: AppRoute.series.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const SeriesListScreen(),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return SeriesDetailScreen(key: ValueKey(id), id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.downloads.path,
            routes: [
              GoRoute(
                path: AppRoute.downloads.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const DownloadsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.authors.path,
            routes: [
              GoRoute(
                path: AppRoute.authors.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const AuthorListScreen(),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return AuthorDetailScreen(key: ValueKey(id), id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.collections.path,
            routes: [
              GoRoute(
                path: AppRoute.collections.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const CollectionsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.more.path,
            routes: [
              GoRoute(
                path: AppRoute.more.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: CustomPopScope(
                      controller: playerController,
                      child: const MoreScreen(),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'settings',
                    builder: (context, state) => const SettingsScreen(),
                    routes: [
                      GoRoute(
                        path: 'navigation',
                        builder: (context, state) => const NavSettingScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'profile',
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoute.search.path,
            routes: [
              GoRoute(
                path: AppRoute.search.path,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref) {
    ref.listen(currentUserProvider, (_, _) => notifyListeners());
  }
}
