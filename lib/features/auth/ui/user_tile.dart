import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/user_auth_status.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/features/auth/ui/add_user_sheet.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class UserTile extends ConsumerWidget {
  const UserTile({super.key, required this.user, required this.server});

  final User user;
  final Server server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final color = server.url.color;
    final authStatus = ref.watch(userAuthStatusProvider(user.id)).value;
    final loginNeeded = authStatus == .loginRequired;
    final isActive = authStatus == .active;

    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: AppStyles.circularRadius,
            onTap: () async {
              if (isActive) {
                ref
                    .read(logsProvider.notifier)
                    .log(l.switchingToUser(user.username));
                await ref
                    .read(appSettingsProvider.notifier)
                    .setCurrentUser(user);
              } else if (loginNeeded) {
                showAddUserSheet(context, server.url, user.username);
              }
            },
            child: Padding(
              padding: const .only(top: 16, bottom: 16, left: 16),
              child: Row(
                children: [
                  Container(width: 4, height: 24, color: color),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: user.username,
                        style: textTheme.bodyLarge?.copyWith(
                          color: scheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: '  (${user.userType})',
                            style: textTheme.labelSmall?.copyWith(
                              color: scheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    loginNeeded
                        ? l.noSession
                        : isActive
                        ? l.active
                        : '${l.loading}...',
                    style: textTheme.labelSmall?.copyWith(
                      color: scheme.onSurface,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          borderRadius: AppStyles.circularRadius,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: AppStyles.roundedRect,
                  actions: [
                    AppTextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: l.cancel,
                    ),
                    AppFilledButton(
                      text: l.delete,
                      color: scheme.error,
                      onPressed: () async {
                        await ref.read(usersProvider.notifier).delete(user);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                  title: Text(
                    l.deleteUserQ(user.username),
                    style: textTheme.titleLarge,
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const .all(16),
            child: Icon(Icons.delete_outline, color: scheme.error),
          ),
        ),
      ],
    );
  }
}
