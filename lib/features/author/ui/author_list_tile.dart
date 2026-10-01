import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class AuthorListTile extends ConsumerWidget {
  const new(this.author, {super.key});
  final Author author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => context.push(AppRoute.authorDetail.path, extra: author.id),
      borderRadius: .circular(kRadius),
      child: Padding(
        padding: const .fromLTRB(16, 8, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            SizedBox.square(
              dimension: imgSizeInListView,
              child: ClipRRect(
                borderRadius: .circular(4),
                child: ImageWidget(
                  id: author.id,
                  type: .author,
                  updatedAt: author.updatedAt,
                  inList: true,
                ),
              ),
            ),
            Expanded(
              child: Text(
                author.name,
                maxLines: 2,
                overflow: .ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
            StackBadge('${author.numBooks ?? 0}'),
          ],
        ),
      ),
    );
  }
}
