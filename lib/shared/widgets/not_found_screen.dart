import 'dart:math';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class NotFoundScreen extends StatelessWidget {
  final String path;

  const new({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final random = Random();
    final emoji = emojis[random.nextInt(emojis.length)];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoute.home.path);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.pageNotFound),
      ),
      body: Center(
        child: Padding(
          padding: const .symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: .min,
            spacing: 16,
            children: [
              Text(
                path,
                textAlign: .center,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: .bold,
                ),
              ),
              Text(emoji, style: theme.textTheme.displaySmall),
              SizedBox(
                width: double.infinity,
                child: AppOutlinedButton(
                  text: l10n.home,
                  onPressed: () => context.go(AppRoute.home.path),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
