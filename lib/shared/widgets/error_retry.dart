import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ErrorRetryWidget extends StatelessWidget {
  const new(this.message, {super.key, this.onRetry});

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logicRequired = message == 'No user';

    return Padding(
      padding: const .all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              logicRequired ? l10n.connectionServerDisconnected : message,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.error,
              ),
              textAlign: .center,
            ),
            if (onRetry != null && !logicRequired) ...[
              const SizedBox(height: 4),
              AppFilledButton(text: l10n.retry, onPressed: onRetry),
            ],
            if (logicRequired) ...[
              const SizedBox(height: 4),
              AppFilledButton(
                text: l10n.login,
                onPressed: () {
                  context.go(AppRoute.login.path);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
