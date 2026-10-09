part of 'edit_metadata_screen.dart';

class PodcastMetadataForm extends ConsumerStatefulWidget {
  const new({super.key, required this.id});

  final String id;

  @override
  ConsumerState<PodcastMetadataForm> createState() =>
      _PodcastMetadataFormState();
}

class _PodcastMetadataFormState extends ConsumerState<PodcastMetadataForm> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _releaseDateController = TextEditingController();
  final _genresController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _itunesPageUrlController = TextEditingController();
  final _itunesIdController = TextEditingController();
  final _itunesArtistIdController = TextEditingController();
  final _podcastTypeController = TextEditingController();
  final _languageController = TextEditingController();

  final _scrollController = ScrollController();

  Media? _seededFrom;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _releaseDateController.dispose();
    _genresController.dispose();
    _imageUrlController.dispose();
    _itunesPageUrlController.dispose();
    _itunesIdController.dispose();
    _itunesArtistIdController.dispose();
    _podcastTypeController.dispose();
    _languageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _seedIfNeeded(EditorState state) {
    if (identical(_seededFrom, state.original)) return;
    _seededFrom = state.original;
    final metadata = state.original.metadata as PodcastMetadata;
    _titleController.text = metadata.title ?? '';
    _authorController.text = metadata.author ?? '';
    _descriptionController.text = metadata.description ?? '';
    _releaseDateController.text = metadata.releaseDate ?? '';
    _genresController.text = _join(metadata.genres);
    _imageUrlController.text = metadata.imageUrl ?? '';
    _itunesPageUrlController.text = metadata.itunesPageUrl ?? '';
    _itunesIdController.text = metadata.itunesId ?? '';
    _itunesArtistIdController.text = metadata.itunesArtistId ?? '';
    _podcastTypeController.text = metadata.podcastType?.name ?? '';
    _languageController.text = metadata.language ?? '';
  }

  void _updateDraft(PodcastMetadata Function(PodcastMetadata metadata) update) {
    final state = ref.read(itemMetadataProvider(widget.id)).value;
    if (state == null) return;
    final media = state.draft;
    if (media is! PodcastMedia) return;
    ref
        .read(itemMetadataProvider(widget.id).notifier)
        .updateDraft(
          media.copyWith(metadata: update(media.metadata as PodcastMetadata)),
        );
  }

  // void _updateMedia(PodcastMedia Function(PodcastMedia metadata) update) {
  //   final state = ref.read(itemMetadataProvider(widget.id)).value;
  //   if (state == null) return;
  //   final media = state.draft as PodcastMedia;
  //   ref
  //       .read(itemMetadataProvider(widget.id).notifier)
  //       .updateDraft(update(media));
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemMetadataProvider(widget.id)).value;
    if (state == null) return const SizedBox.shrink();
    _seedIfNeeded(state);
    final metadata = state.draft.metadata as PodcastMetadata;

    return AppScrollbar(
      controller: _scrollController,
      child: ListView(
        keyboardDismissBehavior: .onDrag,
        children: [
          UpdateCoverWidget(widget.id),
          MetadataTextField(
            controller: _titleController,
            label: l10n.title,
            isRequired: true,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(title: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _authorController,
            label: l10n.author,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(author: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _descriptionController,
            label: l10n.description,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(description: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _releaseDateController,
            label: l10n.releaseDate,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(releaseDate: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _genresController,
            label: l10n.genres,
            onChanged: (v) =>
                _updateDraft((m) => m.copyWith(genres: _split(v) ?? [])),
          ),
          MetadataTextField(
            controller: _imageUrlController,
            label: l10n.imageUrl,
            keyboardType: .url,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(imageUrl: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _itunesPageUrlController,
            label: l10n.itunesPageUrl,
            keyboardType: .url,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(itunesPageUrl: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _itunesIdController,
            label: l10n.itunesId,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(itunesId: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            controller: _itunesArtistIdController,
            label: l10n.itunesArtistId,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(itunesArtistId: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataTextField(
            // TODO: segmented button?
            controller: _podcastTypeController,
            label: l10n.podcastType,
            onChanged: (v) {
              final value = v.trim().isEmpty ? null : v;
              _updateDraft(
                (m) => m.copyWith(
                  podcastType: PodcastType.values.firstWhereOrNull(
                    (t) => t.name == value,
                  ),
                ),
              );
            },
          ),
          MetadataTextField(
            controller: _languageController,
            label: l10n.language,
            onChanged: (v) => _updateDraft(
              (m) => m.copyWith(language: v.trim().isEmpty ? null : v),
            ),
          ),
          MetadataCheckbox(
            label: l10n.explicit,
            value: metadata.explicit,
            onChanged: (v) => _updateDraft((m) => m.copyWith(explicit: v)),
          ),
        ],
      ),
    );
  }

  String _join(List<String>? values) =>
      (values == null || values.isEmpty) ? '' : values.join(', ');

  List<String>? _split(String? value) {
    if (value == null) return null;
    final parts = value
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    return parts.isEmpty ? null : parts;
  }
}
