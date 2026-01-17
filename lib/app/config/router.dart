import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/navigation/nav_bar/nav_bar.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
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
import 'package:storii/features/profile/ui/profile_screen.dart';
import 'package:storii/features/search/ui/search_screen.dart';
import 'package:storii/features/series/ui/series_detail_screen.dart';
import 'package:storii/features/series/ui/series_list_screen.dart';
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
  more('/more'),
  settings('/settings'),
  // player('/player'),
  logs('/logs'),
  downloads('/downloads'),
  about('/about'),
  navigationSettings('/settings/navigation'),
  item('/library/:id'),
  series('/series'),
  seriesDetail('/series/:id'),
  authors('/authors'),
  authorDetail('/authors/:id'),
  profile('/profile');

  final String path;
  const AppRoute(this.path);

  String withId(String id) => path.replaceFirst(':id', id);
}

final publicRoutes = [AppRoute.logs.path, AppRoute.about.path, AppRoute.login];

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(currentUserProvider);
  final navTargets = ref.watch(navTargetsProvider);
  final remainingTargets = NavTarget.values
      .where((target) => !navTargets.contains(target))
      .toList();

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
                .series => const SeriesListScreen(),
                .downloads => const DownloadsScreen(),
                .collections => const CollectionsScreen(),
                .authors => const AuthorListScreen(),
                .more => const MoreScreen(),
              },
            ),
          );
        }).toList(),
      ),
      ...remainingTargets.map((target) {
        return GoRoute(
          path: target.item.route.path,
          pageBuilder: (context, state) => NoTransitionPage(
            child: switch (target) {
              .series => const SeriesListScreen(fromMore: true),
              .downloads => const DownloadsScreen(fromMore: true),
              .collections => const CollectionsScreen(fromMore: true),
              .authors => const AuthorListScreen(fromMore: true),
              _ => throw StateError('invalid go route $target'),
            },
          ),
        );
      }),
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
        path: AppRoute.search.path,
        builder: (context, state) => const SearchScreen(),
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
        path: AppRoute.authorDetail.path,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null) {
            throw StateError('path parameter to authors not passed');
          }
          return AuthorDetailScreen(
            key: ValueKey('author-$id-${state.pageKey}'),
            id: id,
          );
        },
      ),
      GoRoute(
        path: AppRoute.seriesDetail.path,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null) {
            throw StateError('path parameter to series not passed');
          }
          return SeriesDetailScreen(
            key: ValueKey('series-$id-${state.pageKey}'),
            id: id,
          );
        },
      ),
      GoRoute(
        path: AppRoute.profile.path,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});
