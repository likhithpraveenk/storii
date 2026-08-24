import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/playlists/logic/playlists_provider.dart';
import 'package:storii/features/playlists/ui/playlist_card.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
import 'package:storii/shared/widgets/waveform.dart';

class PlaylistsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          l10n.playlists,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(playlistsProvider);
          await ref.read(playlistsProvider.future);
        },
        child: playlistsAsync.when(
          skipLoadingOnReload: true,
          data: (playlists) {
            if (playlists.isEmpty) {
              return const ScrollableWidget(child: Center(child: EmptyState()));
            }

            final height = ref.watch(collectionsGridHeightProvider);

            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: GridView.builder(
                  key: const ValueKey('playlists_grid_view'),
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: playlists.length,
                  padding: const .symmetric(horizontal: 16, vertical: 16),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: maxSeriesCardWidthInGrid,
                    mainAxisExtent: height,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final playlist = playlists[index];
                    return PlaylistCard(key: ValueKey(playlist.id), playlist);
                  },
                ),
              ),
            );
          },
          loading: () =>
              const ScrollableWidget(child: Center(child: RandomWaveform())),
          error: (e, _) => ScrollableWidget(
            child: ErrorRetryWidget(
              e.toString(),
              onRetry: () => ref.invalidate(playlistsProvider),
            ),
          ),
        ),
      ),
    );
  }
}
