import 'package:flutter/material.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/l10n/l10n.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key, required this.item});

  final LibraryItem item;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Container(
      padding: const .symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        borderRadius: .only(topLeft: .circular(12), topRight: .circular(12)),
      ),
      child: Row(
        children: [
          Container(width: 48, height: 48, color: Colors.red),
          // TODO: cover image
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  item.title ?? l.noTitle,
                  style: const TextStyle(fontWeight: .bold),
                  maxLines: 1,
                ),
                Text(
                  item.authorName ?? l.noAuthor,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
        ],
      ),
    );
  }
}
