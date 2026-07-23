import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
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
                  borderRadius: .circular(kRadius),
                  child: ImageWidget(
                    id: author.id,
                    type: .author,
                    updatedAt: author.updatedAt,
                  ),
                ),
              ),
              if (author.numBooks != null)
                Positioned(
                  top: 6,
                  right: 6,
                  child: StackBadge(author.numBooks!),
                ),
            ],
          ),
          const SizedBox(height: 8),
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
