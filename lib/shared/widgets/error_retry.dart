import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ErrorRetryScreen extends StatelessWidget {
  const ErrorRetryScreen(this.message, {super.key, this.onRetry});

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, titleSpacing: 0),
      body: Padding(
        padding: const .all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                message,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: scheme.error),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              AppFilledButton(
                text: AppLocalizations.of(context)!.retry,
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorRetryWidget extends StatelessWidget {
  const ErrorRetryWidget(this.message, {super.key, this.onRetry});

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const .all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: scheme.error),
              textAlign: .center,
            ),
            const SizedBox(height: 16),
            AppFilledButton(
              text: AppLocalizations.of(context)!.retry,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

class SliverErrorRetryWidget extends StatelessWidget {
  const SliverErrorRetryWidget(this.message, {super.key, this.onRetry});

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SliverFillRemaining(
      child: Padding(
        padding: const .all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                message,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: scheme.error),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              AppFilledButton(
                text: AppLocalizations.of(context)!.retry,
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
