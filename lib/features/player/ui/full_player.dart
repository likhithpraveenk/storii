import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/l10n/l10n.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key, required this.item, required this.ratio});

  final ItemDomain item;
  final double ratio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // TODO: swipe down to collapse
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                color: Colors.red,
              ),
            ),
            // TODO: cover image
            const SizedBox(height: 48),
            Text(
              item.title ?? l.noTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              item.authorName ?? l.noAuthor,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
