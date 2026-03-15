import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';

class SeriesChipsList extends ConsumerWidget {
  const SeriesChipsList(this.series, {super.key});

  final List<Series> series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        alignment: .center,
        children: [
          ...series.map((s) {
            final sLabel = s.sequence != null
                ? '${s.name} #${s.sequence}'
                : s.name;
            return ActionChip(
              avatar: const Icon(Icons.stacked_bar_chart),
              avatarBoxConstraints: const BoxConstraints(),
              label: Text(sLabel, style: textTheme.labelLarge),
              onPressed: () =>
                  context.push(AppRoute.seriesDetail.path, extra: s.id),
              shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
            );
          }),
        ],
      ),
    );
  }
}
