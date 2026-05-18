import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class MoreMetadataButton extends StatelessWidget {
  const MoreMetadataButton(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton.icon(
      onPressed: () {
        AppBottomSheet.show(
          context,
          title: item.title ?? l10n.metadata,
          subtitle: item.authorName,
          body: _MoreMetadataSheet(item),
        );
      },
      style: TextButton.styleFrom(
        padding: const .symmetric(horizontal: 8),
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
    );
  }
}

class _MoreMetadataSheet extends StatelessWidget {
  const _MoreMetadataSheet(this.item);

  final LibraryItem item;

  @override
  Widget build(BuildContext context) {
    final List<Widget> bodyChildren = [];
    if (item.media is BookMedia) {
      final bookMedia = item.media as BookMedia;
      final bookMetadata = bookMedia.metadata as BookMetadata;

      bodyChildren.addAll([
        _MetadataRow(l10n.id, item.id),
        _MetadataRow(l10n.title, bookMetadata.title),
        _MetadataRow(l10n.subtitle, bookMetadata.subtitle),
        _MetadataRow(
          l10n.authors,
          bookMetadata.authors?.map((a) => a.name).join(', '),
        ),
        _MetadataRow(l10n.narrators, bookMetadata.narrators?.join(', ')),
        _MetadataRow(
          l10n.series,
          bookMetadata.series?.map((s) => s.name).join(', '),
        ),
        _MetadataRow(l10n.genres, bookMetadata.genres.join(', ')),
        _MetadataRow(l10n.publishedYear, bookMetadata.publishedYear),
        _MetadataRow(l10n.publishedDate, bookMetadata.publishedDate),
        _MetadataRow(l10n.publisher, bookMetadata.publisher),
        _MetadataRow(l10n.isbn, bookMetadata.isbn),
        _MetadataRow(l10n.asin, bookMetadata.asin),
        _MetadataRow(l10n.language, bookMetadata.language),
        _MetadataRow(l10n.explicit, bookMetadata.explicit.toString()),
        _MetadataRow(l10n.abridged, bookMetadata.abridged.toString()),
      ]);
    } else if (item.media is PodcastMedia) {
      final podcastMedia = item.media as PodcastMedia;
      final podcastMetadata = podcastMedia.metadata as PodcastMetadata;

      bodyChildren.addAll([
        _MetadataRow(l10n.title, podcastMetadata.title),
        _MetadataRow(l10n.author, podcastMetadata.author),
        _MetadataRow(l10n.releaseDate, podcastMetadata.releaseDate.toString()),
        _MetadataRow(l10n.genres, podcastMetadata.genres.join(', ')),
        _MetadataRow(
          l10n.itunesPageUrl,
          podcastMetadata.itunesPageUrl.toString(),
        ),
        _MetadataRow(l10n.itunesId, podcastMetadata.itunesId.toString()),
        _MetadataRow(
          l10n.itunesArtistId,
          podcastMetadata.itunesArtistId.toString(),
        ),
        _MetadataRow(l10n.language, podcastMetadata.language),
        _MetadataRow(l10n.explicit, podcastMetadata.explicit.toString()),
      ]);
    }

    return SingleChildScrollView(
      padding: const .fromLTRB(24, 0, 24, 24),
      child: SelectableRegion(
        selectionControls: MaterialTextSelectionControls(),
        child: Column(crossAxisAlignment: .start, children: bodyChildren),
      ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  const _MetadataRow(this.label, this.value);
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value?.isEmpty == true) {
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
          Expanded(child: Text('$value', style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
