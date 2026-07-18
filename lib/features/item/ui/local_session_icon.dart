import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/storage/local/session_store.dart';

class LocalSessionIcon extends ConsumerWidget {
  const LocalSessionIcon({super.key, required this.itemId, this.episodeId});

  final String itemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme.tertiary;
    final session = ref.watch(localSessionProvider(itemId, episodeId)).value;

    if (session?.playMethod != .local) return const SizedBox.shrink();

    return IconButton(
      tooltip: l10n.localSession,
      onPressed: () {
        AppBottomSheet.show(
          context,
          title: l10n.localSession,
          subtitle: l10n.localSessionSheetBody,
          body: Consumer(
            builder: (context, ref, _) {
              final session = ref
                  .watch(localSessionProvider(itemId, episodeId))
                  .value;
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    _SessionInfoRow(
                      label: l10n.title,
                      value: session?.displayTitle,
                    ),
                    const SizedBox(height: 8),
                    _SessionInfoRow(
                      label: l10n.currentPosition,
                      value: session?.currentTime.toTime(padHours: true),
                    ),
                    const SizedBox(height: 8),
                    _SessionInfoRow(
                      label: l10n.totalListeningTime,
                      value: session?.timeListening.toReadableDuration(
                        showSeconds: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .spaceAround,
                      children: [
                        AppFilledButton(
                          text: l10n.cancel,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        AppFilledButton(
                          text: l10n.delete,
                          isDestructive: true,
                          onPressed: () {
                            if (session != null) {
                              ref
                                  .read(sessionStoreProvider.notifier)
                                  .delete(session.id);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
          ),
        );
      },
      icon: Icon(Icons.local_activity_outlined, color: color, size: 20),
    );
  }
}

class _SessionInfoRow extends StatelessWidget {
  const _SessionInfoRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: .w400,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value!,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: .w500),
            softWrap: true,
            textAlign: .end,
          ),
        ),
      ],
    );
  }
}
