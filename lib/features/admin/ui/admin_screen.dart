import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final isUserAdminAsync = ref.watch(isUserAdminProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.admin, style: textTheme.titleLarge),
      ),
      body: isUserAdminAsync.when(
        data: (isAdmin) {
          if (!isAdmin) {
            return Padding(
              padding: const .all(16),
              child: Center(
                child: Text(l10n.loginWithAdmin, textAlign: .center),
              ),
            );
          }
          return ListView(children: const []);
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (e, st) => ErrorRetryWidget(
          '$e',
          onRetry: () => ref.invalidate(serverUserProvider),
        ),
      ),
    );
  }
}
