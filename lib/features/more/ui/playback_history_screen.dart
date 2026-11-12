import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/more/logic/playback_history_entries_provider.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/storage/local/items_cache.dart';

class PlaybackHistoryScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<PlaybackHistoryScreen> createState() =>
      _PlaybackHistoryScreenState();
}

class _PlaybackHistoryScreenState extends ConsumerState<PlaybackHistoryScreen> {
  bool _showAudiobooks = true;
  bool _showEpisodes = true;
  bool _ascending = false;

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(playbackHistoryEntriesProvider).value ?? const [];

    final hasBooks = entries.any((e) => e.episodeId == null);
    final hasEpisodes = entries.any((e) => e.episodeId != null);
    final showChips = hasBooks && hasEpisodes;

    final filtered =
        entries.where((e) {
          final isEpisode = e.episodeId != null;
          return isEpisode ? _showEpisodes : _showAudiobooks;
        }).toList()..sort(
          (a, b) => _ascending
              ? a.lastTimestamp.compareTo(b.lastTimestamp)
              : b.lastTimestamp.compareTo(a.lastTimestamp),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.playbackHistory),
        actions: [
          IconButton(
            tooltip: l10n.sort,
            icon: Icon(_ascending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () => setState(() => _ascending = !_ascending),
          ),
        ],
      ),
      body: Column(
        children: [
          if (showChips)
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: .horizontal,
                padding: const .symmetric(horizontal: 16),
                children: [
                  FilterChip(
                    label: Text(l10n.audiobooks),
                    selected: _showAudiobooks,
                    onSelected: (v) => setState(() => _showAudiobooks = v),
                    visualDensity: .compact,
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(l10n.episodes),
                    selected: _showEpisodes,
                    onSelected: (v) => setState(() => _showEpisodes = v),
                    visualDensity: .compact,
                  ),
                ],
              ),
            ),
          Expanded(
            child: filtered.isEmpty
                ? const EmptyState()
                : ListView.separated(
                    padding: const .fromLTRB(16, 4, 4, 100),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return _HistoryRow(entry: filtered[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _HistoryRow extends ConsumerWidget {
  const new({required this.entry});
  final PlaybackHistoryEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final String? title;
    final item = ref.watch(cachedItemProvider(entry.itemId)).value;
    if (entry.episodeId != null) {
      final episode = item?.episodes.firstWhereOrNull(
        (e) => e.id == entry.episodeId,
      );
      title = episode?.title;
    } else {
      title = item?.title;
    }

    final lastListened = entry.lastTimestamp.toRelativeTime();
    final cardSize = ref.watch(listViewImageSizeProvider);

    return InkWell(
      onTap: () {
        context.push(AppRoute.itemDetail.withId(entry.itemId));
      },
      borderRadius: .circular(kRadius),
      child: Row(
        spacing: 8,
        children: [
          SizedBox.square(
            dimension: cardSize,
            child: Padding(
              padding: const .all(3),
              child: ClipRRect(
                borderRadius: .circular(kRadiusXs),
                child: ImageWidget(
                  id: entry.itemId,
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
                  title ?? l10n.noTitle,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: .w600,
                    color: scheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                Text(
                  lastListened,
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final confirmed = await AppDialog.show<bool>(
                context,
                title: l10n.clearHistoryQ,
                actionLabel: l10n.confirm,
                isDestructive: true,
                onTap: () async {},
              );
              if (confirmed != true) return;
              await ref
                  .read(
                    playbackHistoryProvider(
                      mediaItemIdKey(entry.itemId, entry.episodeId),
                    ).notifier,
                  )
                  .clearHistory();
              ref.invalidate(playbackHistoryEntriesProvider);
            },
          ),
        ],
      ),
    );
  }
}
