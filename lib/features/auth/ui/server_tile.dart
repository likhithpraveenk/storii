import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/features/auth/ui/add_server_sheet.dart';
import 'package:storii/features/auth/ui/add_user_sheet.dart';
import 'package:storii/features/auth/ui/user_tile.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ServerTile extends ConsumerStatefulWidget {
  const ServerTile(this.server, {super.key});

  final Server server;

  @override
  ConsumerState<ServerTile> createState() => _ServerTileState();
}

class _ServerTileState extends ConsumerState<ServerTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersOfServerProvider(widget.server.url));
    final color = widget.server.url.color;
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        InkWell(
          borderRadius: .circular(kRadius),
          onTap: () => setState(() => _expanded = !_expanded),
          onLongPress: () {
            Clipboard.setData(
              ClipboardData(text: widget.server.url.toString()),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l.urlCopied),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: Padding(
            padding: const .all(16),
            child: Row(
              children: [
                Container(width: 4, height: 24, color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.server.url.cleanString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (usersAsync.hasValue)
                  Padding(
                    padding: const .symmetric(horizontal: 8),
                    child: Text(
                      '${(usersAsync.value)?.length}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    _expanded ? Icons.unfold_less : Icons.unfold_more,
                  ),
                ),
              ],
            ),
          ),
        ),
        usersAsync.when(
          loading: () => const Center(child: RandomWaveform()),
          error: (error, stack) => Center(
            child: Padding(
              padding: const .all(16),
              child: Text('${l.errorLoadingUsers}: $error'),
            ),
          ),
          data: (users) => Column(
            children: [
              ...users.map(
                (user) => UserTile(user: user, server: widget.server),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: !_expanded
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const .only(left: 16, right: 16, bottom: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: AppOutlinedButton(
                                icon: const Icon(Icons.delete_forever),
                                text: l.deleteServer,
                                isDestructive: true,
                                onPressed: () {
                                  AppDialog.show(
                                    context,
                                    title: l.deleteServerQ,
                                    body: Text(
                                      '${widget.server.url.cleanString}\n\n'
                                      '${users.isEmpty ? l.noUsersServer : '${l.followingUsers}\n'
                                                '${users.map((e) => '• ${e.username}').join('\n')}'}',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    isDestructive: true,
                                    actionLabel: l.delete,
                                    onTap: () async {
                                      await ref
                                          .read(serversProvider.notifier)
                                          .delete(widget.server);
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: AppOutlinedButton(
                                icon: const Icon(Icons.edit),
                                text: l.editServer,
                                onPressed: () {
                                  showAddServerSheet(context, widget.server);
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: AppFilledButton(
                                icon: const Icon(Icons.add),
                                text: l.addUser,
                                onPressed: () {
                                  showAddUserSheet(context, widget.server.url);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
