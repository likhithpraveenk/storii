import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/item/ui/chapters_list_widget.dart';
import 'package:storii/features/item/ui/cover_image_title.dart';
import 'package:storii/features/item/ui/description_with_chips.dart';
import 'package:storii/features/item/ui/metadata_wrap.dart';
import 'package:storii/features/item/ui/play_progress_widget.dart';
import 'package:storii/features/item/ui/series_chips_list.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;
  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(mediaProgressProvider(id));
                  return await ref.refresh(itemDetailProvider(id).future);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Padding(
                        padding: const .fromLTRB(16, 16, 16, 0),
                        child: Column(
                          children: [
                            CoverImageTitle(item),
                            const SizedBox(height: 8),
                            PlayProgressWidget(item),
                          ],
                        ),
                      ),
                      SeriesChipsList(item.series),
                      const SizedBox(height: 8),
                      ExpandableDescriptionWithChips(
                        data: item.description ?? l.noDescription,
                        collapsedHeight: 60,
                        genres: item.genres,
                        tags: item.tags,
                      ),
                      const SizedBox(height: 8),
                      MetadataWrap(item),
                      const SizedBox(height: 16),
                      const Divider(height: 0),
                      ChaptersListWidget(item),
                      const SizedBox(height: 200),
                    ],
                  ),
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
