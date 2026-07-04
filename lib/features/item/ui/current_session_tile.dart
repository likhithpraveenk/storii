import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/storage/local/session_store.dart';

class CurrentSessionTile extends ConsumerWidget {
  const CurrentSessionTile({super.key, required this.itemId, this.episodeId});

  final String itemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    final sessionAsync = ref.watch(localSessionProvider(itemId, episodeId));
    return sessionAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => const SizedBox.shrink(),
      data: (session) {
        final isLocal = session != null && session.playMethod == .local;

        if (isLocal) {
          return Stack(
            children: [
              Padding(
                padding: const .all(16),
                child: Container(
                  padding: const .all(16),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    border: .all(width: 2, color: scheme.outlineVariant),
                    borderRadius: .circular(kRadius),
                  ),
                  child: Center(
                    child: Text(
                      l10n.localSession(
                        session.currentTime.toReadableDuration(),
                      ),
                      style: TextStyle(color: scheme.onSurfaceVariant),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: .centerRight,
                child: IconButton(
                  onPressed: () {
                    AppDialog.show(
                      context,
                      title: l10n.localSessionDeleteQ,
                      actionLabel: l10n.delete,
                      body: Text(l10n.localSessionDeleteBody),
                      onTap: () async {
                        await ref
                            .read(sessionStoreProvider.notifier)
                            .delete(session.id);
                      },
                      unawaitedOnTap: true,
                      isDestructive: true,
                    );
                  },
                  icon: const Icon(Icons.cancel),
                  visualDensity: .compact,
                  tooltip: l10n.delete,
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
