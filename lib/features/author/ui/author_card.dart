import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class AuthorCard extends ConsumerWidget {
  const AuthorCard(this.author, {super.key});
  final Author author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.push(AppRoute.authorDetail.path, extra: author.id),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: .min,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: .circular(200),
                  child: ImageWidget(
                    id: author.id,
                    type: .author,
                    updatedAt: author.updatedAt,
                  ),
                ),
              ),
              if (author.numBooks != null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: StackBadge(author.numBooks!),
                ),
            ],
          ),
          Text(
            author.name,
            maxLines: 2,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}

class AuthorCardListView extends ConsumerWidget {
  const AuthorCardListView(this.author, {super.key});
  final Author author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const .fromLTRB(16, 8, 16, 8),
      onTap: () => context.push(AppRoute.authorDetail.path, extra: author.id),
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
      titleAlignment: .center,
      title: Text(
        author.name,
        maxLines: 2,
        overflow: .ellipsis,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: author.numBooks != null
          ? Text(
              author.numBooks!.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: scheme.onSurfaceVariant,
              ),
            )
          : null,
    );
  }
}
