import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/author/logic/author_provider.dart';
import 'package:storii/features/author/ui/author_content.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AuthorDetailScreen extends ConsumerWidget {
  const AuthorDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    final authorAsync = ref.watch(authorProvider(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          authorAsync.value?.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: authorAsync.when(
        data: (author) {
          return ListView(
            children: [
              Center(
                child: Container(
                  padding: const .all(16),
                  width: (size.width * 0.8).clamp(120, 280),
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: ClipRRect(
                      borderRadius: .circular(kRadius),
                      child: ImageWidget(
                        id: author.id,
                        type: .author,
                        updatedAt: author.updatedAt,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const .symmetric(horizontal: 16),
                child: ExpandableHtml(
                  data: author.description ?? l10n.noDescription,
                ),
              ),
              AuthorContent(
                authorId: author.id,
                books: author.libraryItems ?? [],
                series: author.series ?? [],
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
