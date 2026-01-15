import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/ui/server_list_screen.dart';
import 'package:storii/features/author/ui/author_screen.dart';
import 'package:storii/features/collections/ui/collections_screen.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/features/home/ui/home_screen.dart';
import 'package:storii/features/library/ui/library_screen.dart';
import 'package:storii/features/library_item/ui/item_detail_screen.dart';
import 'package:storii/features/logs/ui/logs_screen.dart';
import 'package:storii/features/more/ui/more_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/series/ui/series_screen.dart';
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
  collectionsPush('/collections-push'),
  more('/more'),
  settings('/settings'),
  // player('/player'),
  logs('/logs'),
  downloads('/downloads'),
  downloadsPush('/downloadsPush'),
  about('/about'),
  navigationSettings('/settings/navigation'),
  item('/item/:id'),
  series('/series/:id'),
  authors('/authors/:id');

  final String path;
  const AppRoute(this.path);

  String withId(String id) => path.replaceFirst(':id', id);
}

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
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) => const ServerListScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            bottomNavigationBar: NavBar(
              currentIndex: navTargets
                  .indexWhere((t) => t.item.route.path == state.matchedLocation)
                  .clamp(0, navTargets.length),
              onTap: (i) => context.go(navTargets[i].item.route.path),
            ),
            body: PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                if (state.matchedLocation != AppRoute.home.path) {
                  context.go(AppRoute.home.path);
                } else {
                  SystemNavigator.pop();
                }
              },
              child: Stack(
                children: [
                  child,
                  // const Positioned(left: 0, right: 0, bottom: 0, child: Player()),
                ],
              ),
            ),
          );
        },
        routes: navTargets.map((target) {
          return GoRoute(
            path: target.item.route.path,
            pageBuilder: (context, state) => NoTransitionPage(
              child: switch (target) {
                .home => const HomeScreen(),
                .library => const LibraryScreen(),
                .search => const SearchScreen(),
                .downloads => const DownloadsScreen(),
                .collections => const CollectionsScreen(),
                .more => const MoreScreen(),
              },
            ),
          );
        }).toList(),
      ),
      GoRoute(
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: 'navigation',
            builder: (context, state) => const NavSettingScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.collectionsPush.path,
        builder: (context, state) => const CollectionsScreen(fromMore: true),
      ),
      GoRoute(
        path: AppRoute.downloadsPush.path,
        builder: (context, state) => const DownloadsScreen(pushed: true),
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
      GoRoute(
        path: AppRoute.authors.path,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null) {
            throw StateError('path parameter to authors not passed');
          }
          return AuthorScreen(id: id);
        },
      ),
      GoRoute(
        path: AppRoute.series.path,
        builder: (context, state) {
          final series = state.extra as Series?;
          if (series == null) {
            throw StateError('series not passed');
          }
          return SeriesScreen(series: series);
        },
      ),
    ],
  );
});
