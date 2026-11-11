import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';

class SkeletonBox extends StatefulWidget {
  const new({super.key, this.width, this.height, this.borderRadius});

  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  State<SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<SkeletonBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final disabled = MediaQuery.disableAnimationsOf(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final opacity = disabled ? 0.5 : 0.3 + 0.3 * _controller.value;
        return Opacity(
          opacity: opacity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: .circular(widget.borderRadius ?? kRadius),
            ),
            child: SizedBox(width: widget.width, height: widget.height),
          ),
        );
      },
    );
  }
}

class _GridCardSkeleton extends StatelessWidget {
  const new({
    required this.width,
    this.showTitle = true,
    this.showSubtitle = true,
  });

  final double width;
  final bool showSubtitle;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        SkeletonBox(
          width: double.infinity,
          height: width,
          borderRadius: kRadius,
        ),
        if (showTitle) ...[
          const SizedBox(height: 12),
          const SkeletonBox(
            height: 16,
            width: double.infinity,
            borderRadius: kRadiusXs,
          ),
        ],
        if (showSubtitle) ...[
          const SizedBox(height: 8),
          const SkeletonBox(height: 10, width: 96, borderRadius: kRadiusXs),
        ],
      ],
    );
  }
}

class _ListTileSkeleton extends ConsumerWidget {
  const new({this.showSubtitle = true});

  final bool showSubtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSize = ref.watch(listViewImageSizeProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const .fromLTRB(16, 8, 16, 8),
      child: Row(
        spacing: 12,
        children: [
          SkeletonBox(
            width: cardSize,
            height: cardSize,
            borderRadius: kRadiusXs,
          ),
          Expanded(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                SkeletonBox(
                  height: 16,
                  width: screenWidth * 0.6,
                  borderRadius: kRadiusXs,
                ),
                if (showSubtitle) ...[
                  const SizedBox(height: 10),
                  const SkeletonBox(
                    height: 14,
                    width: 120,
                    borderRadius: kRadiusXs,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StackedImagesSkeleton extends StatelessWidget {
  const new({this.showSubtitle = true});

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxWidth * 0.5;
        return Column(
          mainAxisSize: .min,
          children: [
            SkeletonBox(
              width: double.infinity,
              height: height,
              borderRadius: kRadius,
            ),
            const SizedBox(height: 12),
            const SkeletonBox(height: 16, width: 240, borderRadius: kRadiusXs),
            if (showSubtitle) ...[
              const SizedBox(height: 8),
              const SkeletonBox(height: 10, width: 96, borderRadius: kRadiusXs),
            ],
          ],
        );
      },
    );
  }
}

class StackImagesGridSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(seriesGridHeightProvider);
    final cardWidth = ref.watch(stackedImagesCardMaxWidthProvider);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: cardWidth,
              mainAxisExtent: height,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, _) => const _StackedImagesSkeleton(),
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionGridSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(collectionsGridHeightProvider);
    final cardWidth = ref.watch(stackedImagesCardMaxWidthProvider);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: cardWidth,
              mainAxisExtent: height,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, _) => const _StackedImagesSkeleton(showSubtitle: false),
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}

class ItemsGridSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardWidth = ref.watch(imageMaxSizeProvider);
    final height = ref.watch(gridHeightProvider);
    final isSquare = height == cardWidth;
    final displayMode = ref.watch(libraryDisplayModeProvider);
    final showTitle = displayMode != .coverOnly;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: cardWidth,
              mainAxisExtent: isSquare ? null : height,
              mainAxisSpacing: isSquare ? 16 : 4,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, _) => _GridCardSkeleton(
                width: cardWidth,
                showTitle: showTitle,
                showSubtitle: showTitle,
              ),
              childCount: 8,
            ),
          ),
        ),
      ],
    );
  }
}

class AuthorsGridSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(authorsGridHeightProvider);
    final cardWidth = ref.watch(imageMaxSizeProvider);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: cardWidth,
              mainAxisExtent: height,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, _) =>
                  _GridCardSkeleton(width: cardWidth, showSubtitle: false),
              childCount: 8,
            ),
          ),
        ),
      ],
    );
  }
}

class ItemsListSkeleton extends StatelessWidget {
  const new({super.key, this.showSubtitle = true});

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (_, _) => _ListTileSkeleton(showSubtitle: showSubtitle),
    );
  }
}

class HomeShelvesSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageSize = ref.watch(imageMaxSizeProvider);
    final displayMode = ref.watch(libraryDisplayModeProvider);
    final isListView = displayMode == .listView;
    final showTitle = displayMode != .coverOnly;

    return ListView.separated(
      padding: const .only(top: 8, bottom: 16),
      itemCount: isListView ? 1 : 3,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            const Padding(
              padding: .symmetric(horizontal: 16),
              child: SkeletonBox(height: 16, width: 120),
            ),
            const SizedBox(height: 12),
            if (isListView)
              SingleChildScrollView(
                padding: const .symmetric(horizontal: 8),
                child: Column(
                  children: List.generate(8, (_) => const _ListTileSkeleton()),
                ),
              )
            else
              SingleChildScrollView(
                scrollDirection: .horizontal,
                padding: const .symmetric(horizontal: 8),
                child: Row(
                  children: List.generate(
                    3,
                    (_) => Container(
                      width: imageSize,
                      margin: const .symmetric(horizontal: 8),
                      child: _GridCardSkeleton(
                        width: imageSize,
                        showTitle: showTitle,
                        showSubtitle: showTitle,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ItemDetailSkeleton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final coverSize = (size.width * 0.6).clamp(240.0, 360.0);

    return SingleChildScrollView(
      padding: const .fromLTRB(16, kToolbarHeight + 32, 16, 16),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Center(
            child: SkeletonBox(
              width: coverSize,
              height: coverSize,
              borderRadius: kRadius,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SkeletonBox(
              height: 26,
              width: size.width * 0.7,
              borderRadius: kRadiusSm,
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: SkeletonBox(height: 18, width: 140, borderRadius: kRadiusSm),
          ),
          const SizedBox(height: 12),
          const Center(
            child: SkeletonBox(height: 20, width: 120, borderRadius: kRadiusSm),
          ),
          const SizedBox(height: 16),
          const SkeletonBox(height: 44, borderRadius: kRadius),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              SkeletonBox(height: 36, width: 36),
              SkeletonBox(height: 36, width: 36),
              SkeletonBox(height: 36, width: 36),
              SkeletonBox(height: 36, width: 36),
            ],
          ),
          const SizedBox(height: 20),
          const SkeletonBox(
            height: 12,
            width: double.infinity,
            borderRadius: kRadiusXs,
          ),
          const SizedBox(height: 6),
          const SkeletonBox(
            height: 12,
            width: double.infinity,
            borderRadius: kRadiusXs,
          ),
          const SizedBox(height: 6),
          const SkeletonBox(height: 12, width: 160, borderRadius: kRadiusXs),
        ],
      ),
    );
  }
}

class AuthorDetailSkeleton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final coverSize = (size.width * 0.6).clamp(120.0, 280.0);

    return SingleChildScrollView(
      padding: const .all(16),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Center(
            child: SkeletonBox(
              width: coverSize,
              height: coverSize * 1.25,
              borderRadius: kRadius,
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SkeletonBox(
                  height: 16,
                  width: double.infinity,
                  borderRadius: kRadiusXs,
                ),
                SizedBox(height: 8),
                SkeletonBox(height: 16, width: 200, borderRadius: kRadiusXs),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
