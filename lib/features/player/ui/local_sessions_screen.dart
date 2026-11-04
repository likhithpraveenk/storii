import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/api/abs/models/playback_session.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/marquee_text.dart';
import 'package:storii/storage/local/items_cache.dart';
import 'package:storii/storage/local/session_store.dart';

class LocalSessionsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<LocalSessionsScreen> createState() =>
      _LocalSessionsScreenState();
}

class _LocalSessionsScreenState extends ConsumerState<LocalSessionsScreen> {
  bool _ascending = false;

  @override
  Widget build(BuildContext context) {
    final sessions = ref.watch(localSessionsProvider).value;
    final sorted = [...?sessions]
      ..sort(
        (a, b) => _ascending
            ? a.updatedAt.compareTo(b.updatedAt)
            : b.updatedAt.compareTo(a.updatedAt),
      );

    return Scaffold(
      appBar: AppBar(
        title: MarqueeText(l10n.unsyncedSessions),
        actions: [
          IconButton(
            tooltip: l10n.sort,
            icon: Icon(_ascending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () => setState(() => _ascending = !_ascending),
          ),
          IconButton(
            tooltip: l10n.about,
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showAppSnackBar(
                l10n.localSessionSheetBody,
                duration: const Duration(seconds: 5),
              );
            },
          ),
        ],
      ),
      body: sorted.isEmpty
          ? const EmptyState()
          : ListView.separated(
              padding: const .fromLTRB(12, 4, 12, 100),
              itemCount: sorted.length,
              separatorBuilder: (_, _) =>
                  const Padding(padding: .only(top: 8), child: Divider()),
              itemBuilder: (_, index) => _SessionRow(sorted[index]),
            ),
    );
  }
}

class _SessionRow extends ConsumerWidget {
  const new(this.session);

  final PlaybackSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final activeSessionId = ref.watch(sessionProvider)?.id;
    final item = ref.read(itemsCacheProvider).get(session.libraryItemId);

    final isActive = activeSessionId != null && activeSessionId == session.id;
    final isLessThanMin = session.timeListening.inSeconds < 60;

    return Column(
      children: [
        Row(
          spacing: 8,
          children: [
            SizedBox.square(
              dimension: ref.watch(listViewImageSizeProvider),
              child: Padding(
                padding: const .all(3),
                child: ClipRRect(
                  borderRadius: .circular(4),
                  child: ImageWidget(
                    id: session.libraryItemId,
                    type: .item,
                    updatedAt: item?.updatedAt,
                    inList: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    session.displayTitle ?? l10n.noTitle,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: .w600,
                      color: scheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: session.updatedAt.toRelativeTime(),
                          style: textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                        if (isActive) ...[
                          TextSpan(
                            text: '  $kDot  ',
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                          TextSpan(
                            text: l10n.active,
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.primary,
                              fontWeight: .w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!isActive)
              IconButton(
                tooltip: l10n.delete,
                icon: const Icon(Icons.delete_outline),
                visualDensity: .compact,
                onPressed: () async {
                  final confirmed = await AppDialog.show<bool>(
                    context,
                    title: l10n.deleteSessionQ,
                    actionLabel: l10n.confirm,
                    isDestructive: true,
                    onTap: () async {},
                  );
                  if (confirmed != true) return;
                  await ref.read(sessionStoreProvider).delete(session.id);
                },
              ),
          ],
        ),
        _InfoRow(
          label: l10n.currentPosition,
          value: session.currentTime.toTime(padHours: true),
        ),
        _InfoRow(
          label: l10n.totalListeningTime,
          value: session.timeListening.toReadableDuration(
            showSeconds: isLessThanMin,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const new({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
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
            value,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: .w500),
            softWrap: true,
            textAlign: .end,
          ),
        ),
      ],
    );
  }
}
