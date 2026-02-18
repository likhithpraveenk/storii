import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class DeleteServerDialog extends ConsumerWidget {
  const DeleteServerDialog(this.server, this.users, {super.key});

  final Server server;
  final List<UserDomain> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(
        l.deleteServerQ,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        '${server.url.cleanString}\n\n'
        '${users.isEmpty ? l.noUsersServer : '${l.followingUsers}\n'
                  '${users.map((e) => '• ${e.username}').join('\n')}'}',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actionsAlignment: .spaceBetween,
      actions: [
        AppTextButton(onPressed: () => Navigator.pop(context), text: l.cancel),
        const SizedBox(height: 8),
        AppFilledButton(
          text: l.delete,
          isDestructive: true,
          onPressed: () async {
            await ref.read(serversProvider.notifier).delete(server);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
