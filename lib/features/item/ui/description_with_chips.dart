import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/models/filter.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/helpers.dart';

class ExpandableDescriptionWithChips extends ConsumerStatefulWidget {
  final String data;
  final List<String> genres;
  final List<String> tags;
  final double collapsedHeight;

  const ExpandableDescriptionWithChips({
    super.key,
    required this.data,
    required this.genres,
    required this.tags,
    this.collapsedHeight = 80,
  });

  @override
  ConsumerState<ExpandableDescriptionWithChips> createState() =>
      _ExpandableDescriptionWithChipsState();
}

class _ExpandableDescriptionWithChipsState
    extends ConsumerState<ExpandableDescriptionWithChips> {
  bool isExpanded = false;

  void _toggle() => setState(() => isExpanded = !isExpanded);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final chips = [
      ...widget.genres.map(
        (g) => ActionChip(
          avatar: const Icon(Icons.category, size: 15),
          label: Text(g, style: textTheme.labelSmall),
          onPressed: () {
            ref
                .read(libraryFiltersProvider(.library).notifier)
                .setFilter(GenreFilter(g));
            context.go(AppRoute.library.path);
          },
          visualDensity: .compact,
          shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
        ),
      ),
      ...widget.tags.map(
        (t) => ActionChip(
          avatar: const Icon(Icons.tag, size: 15),
          label: Text(t, style: textTheme.labelSmall),
          onPressed: () {
            ref
                .read(libraryFiltersProvider(.library).notifier)
                .setFilter(TagFilter(t));
            context.go(AppRoute.library.path);
          },
          visualDensity: .compact,
          shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
        ),
      ),
    ];
    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.opaque,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        alignment: .topCenter,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: isExpanded
                    ? double.infinity
                    : widget.collapsedHeight,
              ),
              child: ShaderMask(
                blendMode: .dstIn,
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    isExpanded ? Colors.black : Colors.transparent,
                  ],
                  stops: const [0.6, 1.0],
                ).createShader(bounds),
                child: Padding(
                  padding: const .symmetric(horizontal: 16),
                  child: Text(
                    cleanHtml(widget.data),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            if (chips.isNotEmpty)
              isExpanded
                  ? Padding(
                      padding: const .symmetric(horizontal: 16),
                      child: Wrap(spacing: 8, runSpacing: 4, children: chips),
                    )
                  : SingleChildScrollView(
                      scrollDirection: .horizontal,
                      padding: const .symmetric(horizontal: 16, vertical: 8),
                      child: Row(spacing: 8, children: chips),
                    ),
          ],
        ),
      ),
    );
  }
}
