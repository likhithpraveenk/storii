import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/models/models.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/author/logic/author_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AuthorDetailScreen extends ConsumerWidget {
  const AuthorDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    final authorAsync = ref.watch(authorProvider(id));
    final authorName = authorAsync.value?.name ?? '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(authorName, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: authorAsync.when(
        data: (author) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const .all(24),
            children: [
              SizedBox(
                width: (size.width * 0.7).clamp(0.0, 300),
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: ClipRRect(
                    borderRadius: AppStyles.circularRadius,
                    child: ImageWidget(
                      id: author.id,
                      type: .author,
                      updatedAt: author.updatedAt,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.1),
                child: SingleChildScrollView(
                  child: Text(
                    author.name,
                    style: textTheme.titleLarge?.copyWith(
                      shadows: [
                        Shadow(
                          color: scheme.onSurfaceVariant.withValues(
                            alpha: 0.25,
                          ),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: .center,
                  ),
                ),
              ),
              ExpandableHtml(data: author.description ?? l.noDescription),
              Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  // TODO: we get both books and series so use them
                  ListTile(
                    shape: AppStyles.roundedRect,
                    leading: Text(
                      '${author.books?.length ?? 0}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    title: Text(
                      l.books,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      if (author.books?.isNotEmpty == true) {
                        ref
                            .read(libraryItemsProvider.notifier)
                            .filterItems(
                              LibraryItemsRequestParams(
                                filter: AuthorFilter(author.id),
                              ),
                            );
                        context.go(AppRoute.library.path);
                      }
                    },
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    shape: AppStyles.roundedRect,
                    leading: Text('${author.series?.length ?? 0}'),
                    title: Text(
                      l.series,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      if (author.series?.isNotEmpty == true) {
                        ref
                            .read(seriesListProvider.notifier)
                            .filterSeries(
                              SeriesRequestParams(
                                filter: AuthorFilter(author.id),
                              ),
                            );
                        context.go(AppRoute.series.path);
                      }
                    },
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          e.toString(),
          onRetry: () {
            ref.invalidate(authorProvider(id));
          },
        ),
      ),
    );
  }
}
