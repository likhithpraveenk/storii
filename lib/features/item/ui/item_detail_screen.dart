import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/ui/chapters_list_widget.dart';
import 'package:storii/features/item/ui/cover_image_title.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;
  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;

    final itemAsync = ref.watch(itemDetailProvider(id));

    return Scaffold(
      body: itemAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          '$e',
          onRetry: () => ref.invalidate(itemDetailProvider(id)),
        ),
        data: (item) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const .fromLTRB(16, 16, 16, 0),
                      child: Column(
                        children: [
                          CoverImageTitle(item),
                          if (item.progress > 0) ...[
                            _ProgressWidget(
                              remaining: item.duration - item.currentOffset,
                              progress: item.progress,
                            ),
                            const SizedBox(height: 8),
                          ],
                          SizedBox(
                            width: double.infinity,
                            child: AppFilledButton(
                              onPressed: () async {
                                await ref
                                    .read(userSettingsProvider.notifier)
                                    .setActiveItemId(item.id);
                              },
                              icon: const Icon(Icons.play_arrow_rounded),
                              text: item.progress > 0
                                  ? item.progress == 1.0
                                        ? l.replay
                                        : l.resume
                                  : l.play,
                            ),
                          ),
                          if (item.mediaType == .book) ...[
                            const SizedBox(height: 4),
                            Wrap(
                              spacing: 8,
                              alignment: .center,
                              children: item.series.map((series) {
                                final seriesLabel = series.sequence != null
                                    ? '${series.name} #${series.sequence}'
                                    : series.name;
                                return ActionChip(
                                  avatar: const Icon(Icons.layers_outlined),
                                  label: Text(
                                    seriesLabel,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                  onPressed: () => context.push(
                                    AppRoute.seriesDetail.withId(series.id),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: kBorderRadius,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 4),
                          ],
                          if (item.genres.isNotEmpty) ...[
                            Wrap(
                              spacing: 8,
                              alignment: .center,
                              children: item.genres.map((g) {
                                return ActionChip(
                                  label: Text(g, style: textTheme.labelSmall),
                                  onPressed: () {
                                    ref
                                        .read(
                                          libraryFiltersProvider(
                                            .library,
                                          ).notifier,
                                        )
                                        .setFilter(GenreFilter(g));
                                    context.go(AppRoute.library.path);
                                  },
                                  visualDensity: .compact,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: kBorderRadius,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 4),
                          ],
                          ExpandableHtml(
                            data: item.description ?? l.noDescription,
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    ChaptersListWidget(item.chapters),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top,
                left: 4,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProgressWidget extends ConsumerWidget {
  const _ProgressWidget({required this.remaining, required this.progress});

  final Duration remaining;
  final double progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final (hours, minutes) = remaining.toReadableDuration();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: scheme.secondaryContainer,
          ),
          padding: const .symmetric(vertical: 12, horizontal: 16),
          margin: const .only(top: 8, right: 8),
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                '${(progress * 100).toStringAsFixed(1)}%',
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.onSecondaryContainer,
                  fontWeight: .bold,
                ),
              ),
              Text(
                l.durationRemaining(hours, minutes),
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              // TODO: remove progress
            },
            borderRadius: .circular(20),
            child: Icon(
              Icons.cancel,
              size: 24,
              color: scheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
