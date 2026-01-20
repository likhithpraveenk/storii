import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/l10n/l10n.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key, required this.item, required this.expandFactor});

  final ItemDomain item;
  final double expandFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      padding: const .all(16.0),
      child: Column(
        children: [
          Text(
            item.title ?? l.noTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            item.authorName ?? l.noAuthor,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Slider(value: 0.4, onChanged: (v) {}),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, size: 36),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.play_circle_filled, size: 72),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, size: 36),
                onPressed: () {},
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
