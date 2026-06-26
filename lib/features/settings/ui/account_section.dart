import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class AccountSection extends ConsumerWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final sessionState = ref.watch(userSessionControllerProvider);
    final isLoggingOut = sessionState == .loading;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .fromLTRB(16, 16, 16, 8),
          child: Text(
            user?.username ?? l10n.username,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.switch_account),
          title: Text(l10n.switchAccount),
          onTap: () async {
            final confirmed = await AppDialog.show<bool>(
              context,
              title: l10n.switchAccount,
              body: Text(l10n.switchAccountConfirm),
              actionLabel: l10n.switchAccount,
              onTap: () async {},
            );
            if (confirmed == true) {
              await ref
                  .read(userSessionControllerProvider.notifier)
                  .switchUser();
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: isLoggingOut ? const SizedBox.shrink() : Text(l10n.logout),
          onTap: user == null || isLoggingOut
              ? null
              : () async {
                  final confirmed = await AppDialog.show<bool>(
                    context,
                    title: l10n.logout,
                    body: Text(l10n.logoutConfirm),
                    actionLabel: l10n.logout,
                    isDestructive: true,
                    onTap: () async {},
                  );
                  if (confirmed == true) {
                    await ref
                        .read(userSessionControllerProvider.notifier)
                        .logout(user);
                  }
                },
        ),
      ],
    );
  }
}
