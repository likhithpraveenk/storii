import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Theme.of(context).brightness == .dark
            ? .light
            : .dark,
      ),
      title: Material(
        color: Colors.transparent,
        child: Container(
          margin: const .symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: scheme.surfaceContainer,
            borderRadius: .circular(32),
          ),
          child: Row(
            children: [
              InkWell(
                borderRadius: .circular(32),
                child: const Padding(
                  padding: .symmetric(horizontal: 16, vertical: 12),
                  child: Icon(Icons.menu),
                ),
                onTap: () {
                  homeScaffoldKey.currentState?.openDrawer();
                },
              ),
              Expanded(
                child: InkWell(
                  borderRadius: .circular(32),
                  onTap: () {
                    context.push(AppRoute.search.path);
                  },
                  child: Padding(
                    padding: const .all(12),
                    child: Align(
                      alignment: .centerLeft,
                      child: Text('Search', style: textTheme.titleMedium),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
