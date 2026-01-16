import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/logic/item_palette_provider.dart';
import 'package:storii/features/item/ui/cover_image.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;
  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final itemAsync = ref.watch(itemDetailProvider(id));
    final l = AppLocalizations.of(context)!;

    return itemAsync.when(
      data: (item) {
        ref.watch(itemPaletteProvider(item.id));
        final notifier = ref.read(itemPaletteProvider(item.id).notifier);
        final themeColor = notifier.getBackgroundColor(
          scheme.surfaceContainerHighest,
        );

        return Scaffold(
          backgroundColor: Color.alphaBlend(
            themeColor.withValues(alpha: 0.1),
            scheme.surface,
          ),
          body: CustomScrollView(
            slivers: [
              CoverImage(item),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const .all(24),
                  child: Column(
                    children: [
                      if (item.progress > 0) ...[
                        LinearProgressIndicator(
                          value: item.progress,
                          borderRadius: .circular(12),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            item.isFinished ? scheme.primary : scheme.error,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.percentCompleted(
                            (item.progress * 100).toStringAsFixed(1),
                          ),
                          style: textTheme.labelSmall,
                        ),
                        const SizedBox(height: 16),
                      ],
                      Wrap(
                        spacing: 8,
                        alignment: .center,
                        children: item.genres
                            .map(
                              (g) => Chip(
                                label: Text(g, style: textTheme.labelSmall),
                                visualDensity: VisualDensity.compact,
                              ),
                            )
                            .toList(),
                      ),
                      ExpandableHtml(
                        title: l.description,
                        data: item.description ?? l.noDescription,
                      ),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: FloatingActionButton.extended(
              backgroundColor: themeColor,
              elevation: 4,
              onPressed: () {
                // TODO: playback
              },
              icon: Icon(
                item.progress > 0
                    ? Icons.play_arrow_rounded
                    : Icons.play_circle_fill_rounded,
                color: notifier.getForegroundColor(Theme.of(context)),
              ),
              label: Text(
                item.progress > 0 ? l.resume : l.play,
                style: textTheme.labelLarge?.copyWith(
                  color: notifier.getForegroundColor(Theme.of(context)),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const Center(child: RandomWaveform()),
      error: (e, s) => ErrorRetryScreen(
        e.toString(),
        onRetry: () {
          ref.invalidate(itemDetailProvider(id));
        },
      ),
    );
  }
}
