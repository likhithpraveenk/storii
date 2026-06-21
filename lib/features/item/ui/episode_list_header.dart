import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/item/logic/episode_filter_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class EpisodeListHeader extends ConsumerWidget {
  const EpisodeListHeader({
    super.key,
    required this.episodeCount,
    required this.totalCount,
  });

  final int episodeCount;
  final int totalCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(episodeFilterProvider).filter;
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            filter == .all
                ? '${l10n.episodes} ($episodeCount)'
                : '$episodeCount / $totalCount',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: .w600),
          ),
          const Spacer(),
          IconButton(
            tooltip: l10n.filter,
            icon: Icon(
              Icons.filter_list,
              color: filter != .all ? scheme.primary : null,
            ),
            onPressed: () => _showFilterSheet(context),
          ),
          IconButton(
            tooltip: l10n.sort,
            icon: const Icon(Icons.sort),
            onPressed: () => _showSortSheet(context),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    AppBottomSheet.show(
      context,
      title: l10n.filter,
      body: Consumer(
        builder: (context, ref, _) {
          return RadioGroup(
            onChanged: (v) {
              if (v != null) {
                ref.read(episodeFilterProvider.notifier).setFilter(v);
              }
              Navigator.pop(context);
            },
            groupValue: ref.watch(episodeFilterProvider).filter,
            child: Column(
              mainAxisSize: .min,
              children: EpisodeFilter.values.map((f) {
                return RadioListTile<EpisodeFilter>(
                  value: f,
                  title: Text(f.label),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void _showSortSheet(BuildContext context) {
    AppBottomSheet.show(
      context,
      title: l10n.sort,
      body: Consumer(
        builder: (context, ref, _) {
          final current = ref.watch(episodeFilterProvider);
          final notifier = ref.read(episodeFilterProvider.notifier);
          return Column(
            mainAxisSize: .min,
            children: EpisodeSort.values.map((s) {
              final isSelected = current.sort == s;
              return ListTile(
                title: Text(s.label),
                selected: isSelected,
                trailing: isSelected
                    ? Icon(
                        current.ascending
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                      )
                    : null,
                onTap: () => isSelected
                    ? notifier.toggleAscending()
                    : notifier.setSort(s),
                contentPadding: const .symmetric(horizontal: 24, vertical: 0),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
