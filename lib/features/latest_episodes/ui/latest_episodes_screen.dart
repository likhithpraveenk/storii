import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/latest_episodes/logic/recent_episodes_provider.dart';
import 'package:storii/features/latest_episodes/ui/episode_list_item.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LatestEpisodesScreen extends ConsumerStatefulWidget {
  const LatestEpisodesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LatestEpisodesScreenState();
}

class _LatestEpisodesScreenState extends ConsumerState<LatestEpisodesScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final episodesAsync = ref.watch(recentEpisodesProvider);
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          l10n.latestEpisodes,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(recentEpisodesProvider);
        },
        child: episodesAsync.when(
          data: (episodes) {
            if (episodes.isEmpty) {
              final library = ref.watch(currentLibraryProvider)?.name;
              return EmptyState(
                subtitle: library == null ? null : l10n.libraryIsEmpty(library),
                action: AppFilledButton(
                  text: l10n.refresh,
                  onPressed: () {
                    ref.invalidate(recentEpisodesProvider);
                  },
                ),
              );
            }

            return AppScrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                padding: const .symmetric(vertical: 16),
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  final ep = episodes[index];
                  return EpisodeListItem(ep, key: ValueKey(ep.id));
                },
              ),
            );
          },
          loading: () => const Center(child: RandomWaveform()),
          error: (e, _) => ErrorRetryWidget(
            e.toString(),
            onRetry: () => ref.invalidate(recentEpisodesProvider),
          ),
        ),
      ),
    );
  }
}
