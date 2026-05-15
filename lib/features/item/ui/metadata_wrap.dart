import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class MetadataWrap extends StatelessWidget {
  const MetadataWrap(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Wrap(
        alignment: .spaceEvenly,
        spacing: 16,
        runSpacing: 8,
        children: [
          if (item.size != null)
            _MetaItem(
              icon: Icons.storage_outlined,
              label: formatBytes(item.size!),
            ),
          _MetaItem(icon: Icons.business, label: item.publisher),
          _MetaItem(icon: Icons.calendar_today, label: item.publishedYear),
          _MetaItem(icon: Icons.language, label: item.language),
          OutlinedButton.icon(
            onPressed: () => _showFullMetadata(context),
            style: OutlinedButton.styleFrom(
              padding: const .symmetric(vertical: 4, horizontal: 8),
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(borderRadius: .circular(4)),
              tapTargetSize: .shrinkWrap,
              foregroundColor: theme.colorScheme.primary,
            ),
            label: Text(
              l10n.moreInfo,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            icon: const Icon(Icons.info_outline, size: 16),
          ),
        ],
      ),
    );
  }

  void _showFullMetadata(BuildContext context) {
    String? title;
    String? subtitle;
    final List<Widget> bodyChildren = [];

    Widget buildMetadataRow(String label, String? value) {
      if (value == null || value.isEmpty) {
        return const SizedBox.shrink();
      }
      final theme = Theme.of(context);
      return Padding(
        padding: const .symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
          ],
        ),
      );
    }

    if (item.media is BookMedia) {
      final bookMedia = item.media as BookMedia;
      final bookMetadata = bookMedia.metadata as BookMetadata;
      title = bookMetadata.title;
      subtitle =
          bookMetadata.authorName ??
          bookMetadata.narratorName ??
          (bookMetadata.authors?.isNotEmpty ?? false
              ? bookMetadata.authors!.map((a) => a.name).join(', ')
              : null) ??
          (bookMetadata.narrators?.isNotEmpty ?? false
              ? bookMetadata.narrators!.join(', ')
              : null);

      bodyChildren.addAll([
        buildMetadataRow(l10n.id, item.id),
        buildMetadataRow(l10n.title, bookMetadata.title),
        buildMetadataRow(l10n.subtitle, bookMetadata.subtitle),
        buildMetadataRow(
          l10n.authors,
          bookMetadata.authors?.map((a) => a.name).join(', '),
        ),
        buildMetadataRow(l10n.narrators, bookMetadata.narrators?.join(', ')),
        buildMetadataRow(
          l10n.series,
          bookMetadata.series?.map((s) => s.name).join(', '),
        ),
        buildMetadataRow(l10n.genres, bookMetadata.genres.join(', ')),
        buildMetadataRow(l10n.publishedYear, bookMetadata.publishedYear),
        buildMetadataRow(l10n.publishedDate, bookMetadata.publishedDate),
        buildMetadataRow(l10n.publisher, bookMetadata.publisher),
        buildMetadataRow(l10n.isbn, bookMetadata.isbn),
        buildMetadataRow(l10n.asin, bookMetadata.asin),
        buildMetadataRow(l10n.language, bookMetadata.language),
        buildMetadataRow(l10n.explicit, bookMetadata.explicit.toString()),
        buildMetadataRow(l10n.abridged, bookMetadata.abridged.toString()),
      ]);
    } else if (item.media is PodcastMedia) {
      final podcastMedia = item.media as PodcastMedia;
      final podcastMetadata = podcastMedia.metadata as PodcastMetadata;
      title = podcastMetadata.title;
      subtitle = podcastMetadata.author;

      bodyChildren.addAll([
        buildMetadataRow(l10n.title, podcastMetadata.title),
        buildMetadataRow(l10n.author, podcastMetadata.author),
        buildMetadataRow(
          l10n.releaseDate,
          podcastMetadata.releaseDate.toString(),
        ),
        buildMetadataRow(l10n.genres, podcastMetadata.genres.join(', ')),
        buildMetadataRow(
          l10n.itunesPageUrl,
          podcastMetadata.itunesPageUrl.toString(),
        ),
        buildMetadataRow(l10n.itunesId, podcastMetadata.itunesId.toString()),
        buildMetadataRow(
          l10n.itunesArtistId,
          podcastMetadata.itunesArtistId.toString(),
        ),
        buildMetadataRow(l10n.language, podcastMetadata.language),
        buildMetadataRow(l10n.explicit, podcastMetadata.explicit.toString()),
      ]);
    }

    AppBottomSheet.show(
      context,
      title: title ?? l10n.metadata,
      subtitle: subtitle,
      body: SingleChildScrollView(
        padding: const .fromLTRB(24, 0, 24, 24),
        child: SelectableRegion(
          selectionControls: MaterialTextSelectionControls(),
          child: Column(crossAxisAlignment: .start, children: bodyChildren),
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String? label;

  const _MetaItem({required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: .min,
      spacing: 4,
      children: [
        Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
        Flexible(
          child: Text(
            label!,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}
