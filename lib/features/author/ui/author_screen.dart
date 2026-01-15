import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/author/logic/author_provider.dart';
import 'package:storii/features/author/ui/author_image.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AuthorScreen extends ConsumerWidget {
  const AuthorScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final authorAsync = ref.watch(authorProvider(id));
    return authorAsync.when(
      data: (author) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: Text(
              author.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const .all(24),
            children: [
              AuthorImage(author),
              ExpandableHtml(data: author.description ?? l.noDescription),
              Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  ListTile(
                    shape: AppStyles.roundedRect,
                    leading: Text('${author.libraryItems?.length ?? 0}'),
                    title: Text(
                      l.books,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      // TODO: library filter author to all tab
                      context.pop();
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
                      // TODO: library filter author to series tab
                      context.pop();
                    },
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: RandomWaveform()),
      error: (e, s) => ErrorRetryScreen(
        e.toString(),
        onRetry: () {
          ref.invalidate(authorProvider(id));
        },
      ),
    );
  }
}
