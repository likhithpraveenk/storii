import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/expandable_text.dart';

class SeriesScreen extends ConsumerWidget {
  const SeriesScreen({super.key, required this.series});

  final Series series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    final crossAxisSpacing = 16.0;
    final columnWidth = (width - crossAxisSpacing) / 2;
    final dynamicRatio = columnWidth / (columnWidth + 60);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          series.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          if (series.description != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const .all(24),
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    ExpandableHtml(
                      title: l.description,
                      data: series.description!,
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          if (series.books != null)
            SliverPadding(
              padding: const .fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid.builder(
                itemCount: series.books!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                  childAspectRatio: dynamicRatio,
                ),
                itemBuilder: (context, index) {
                  return LibraryItemCard(
                    key: ValueKey(series.books![index].id),
                    series.books![index],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
