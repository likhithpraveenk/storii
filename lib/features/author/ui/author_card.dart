import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/features/library/ui/image_widget.dart';

class AuthorCard extends ConsumerWidget {
  const AuthorCard(this.author, {super.key});
  final AuthorDomain author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: .circular(200),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageWidget(
                  id: author.id,
                  type: .author,
                  updatedAt: author.updatedAt,
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: .circular(12),
                      onTap: () =>
                          context.push(AppRoute.authorsId.withId(author.id)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const .only(top: 8, left: 4),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                author.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              if (author.numBooks != null)
                Text(
                  author.numBooks!.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthorCardListView extends ConsumerWidget {
  const AuthorCardListView(this.author, {super.key});
  final AuthorDomain author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const .symmetric(vertical: 8),
      child: ListTile(
        onTap: () => context.push(AppRoute.authors.withId(author.id)),
        leading: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: .circular(50),
            child: ImageWidget(
              id: author.id,
              type: .author,
              updatedAt: author.updatedAt,
            ),
          ),
        ),
        titleAlignment: .top,
        title: Padding(
          padding: const .only(top: 8, left: 4),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                author.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              if (author.numBooks != null)
                Text(
                  author.numBooks!.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
