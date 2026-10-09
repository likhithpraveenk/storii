part of 'edit_metadata_screen.dart';

class BookMetadataForm extends ConsumerStatefulWidget {
  const new({super.key, required this.id});

  final String id;

  @override
  ConsumerState<BookMetadataForm> createState() => _BookMetadataFormState();
}

class _BookMetadataFormState extends ConsumerState<BookMetadataForm> {
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _narratorsController = TextEditingController();
  final _genresController = TextEditingController();
  final _tagsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _publishedYearController = TextEditingController();
  final _publisherController = TextEditingController();
  final _isbnController = TextEditingController();
  final _asinController = TextEditingController();
  final _languageController = TextEditingController();

  final _scrollController = ScrollController();

  Media? _seededFrom;

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _narratorsController.dispose();
    _genresController.dispose();
    _tagsController.dispose();
    _publishedYearController.dispose();
    _publisherController.dispose();
    _descriptionController.dispose();
    _isbnController.dispose();
    _asinController.dispose();
    _languageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _seedIfNeeded(EditorState state) {
    if (identical(_seededFrom, state.original)) return;
    _seededFrom = state.original;
    final media = state.original as BookMedia;
    final metadata = state.original.metadata as BookMetadata;
    _titleController.text = metadata.title ?? '';
    _subtitleController.text = metadata.subtitle ?? '';
    _narratorsController.text = _join(metadata.narrators);
    _genresController.text = _join(metadata.genres);
    _tagsController.text = _join(media.tags);
    _publishedYearController.text = metadata.publishedYear ?? '';
    _publisherController.text = metadata.publisher ?? '';
    _descriptionController.text = metadata.description ?? '';
    _isbnController.text = metadata.isbn ?? '';
    _asinController.text = metadata.asin ?? '';
    _languageController.text = metadata.language ?? '';
  }

  void _updateDraft(BookMetadata Function(BookMetadata metadata) update) {
    final state = ref.read(itemMetadataProvider(widget.id)).value;
    if (state == null) return;
    final media = state.draft;
    if (media is! BookMedia) return;
    ref
        .read(itemMetadataProvider(widget.id).notifier)
        .updateDraft(
          media.copyWith(metadata: update(media.metadata as BookMetadata)),
        );
  }

  void _updateMedia(BookMedia Function(BookMedia metadata) update) {
    final state = ref.read(itemMetadataProvider(widget.id)).value;
    if (state == null) return;
    final media = state.draft as BookMedia;
    ref
        .read(itemMetadataProvider(widget.id).notifier)
        .updateDraft(update(media));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemMetadataProvider(widget.id)).value;
    if (state == null) return const SizedBox.shrink();
    _seedIfNeeded(state);
    final metadata = state.draft.metadata as BookMetadata;
    final filterData = ref.watch(filterDataProvider);

    return AppScrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        keyboardDismissBehavior: .onDrag,
        child: Column(
          crossAxisAlignment: .stretch,
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
              controller: _subtitleController,
              label: l10n.subtitle,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(subtitle: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataMultiSelect<Author>(
              label: l10n.authors,
              selected: metadata.authors ?? [],
              options: filterData.authors,
              optionLabel: (author) => author.name,
              onChanged: (authors) =>
                  _updateDraft((m) => m.copyWith(authors: authors)),
            ),
            MetadataMultiSelect<Series>(
              label: l10n.series,
              selected: metadata.series ?? [],
              options: filterData.series,
              optionLabel: (series) => series.name,
              onChanged: (series) =>
                  _updateDraft((m) => m.copyWith(series: series)),
            ),
            MetadataTextField(
              controller: _descriptionController,
              label: l10n.description,
              keyboardType: .multiline,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(description: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataTextField(
              controller: _genresController,
              label: l10n.genres,
              onChanged: (v) =>
                  _updateDraft((m) => m.copyWith(genres: _split(v) ?? [])),
            ),
            MetadataTextField(
              controller: _tagsController,
              label: l10n.tags,
              onChanged: (v) =>
                  _updateMedia((m) => m.copyWith(tags: _split(v) ?? [])),
            ),
            MetadataTextField(
              controller: _narratorsController,
              label: l10n.narrators,
              onChanged: (v) =>
                  _updateDraft((m) => m.copyWith(narrators: _split(v))),
            ),
            MetadataTextField(
              controller: _publishedYearController,
              label: l10n.publishedYear,
              keyboardType: .number,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(publishedYear: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataTextField(
              controller: _languageController,
              label: l10n.language,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(language: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataTextField(
              controller: _publisherController,
              label: l10n.publisher,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(publisher: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataTextField(
              controller: _isbnController,
              label: l10n.isbn,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(isbn: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataTextField(
              controller: _asinController,
              label: l10n.asin,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(asin: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataCheckbox(
              label: l10n.explicit,
              value: metadata.explicit,
              onChanged: (v) => _updateDraft((m) => m.copyWith(explicit: v)),
            ),
            MetadataCheckbox(
              label: l10n.abridged,
              value: metadata.abridged ?? false,
              onChanged: (v) => _updateDraft((m) => m.copyWith(abridged: v)),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  String _join(List<String>? values) =>
      (values == null || values.isEmpty) ? '' : values.join(', ');

  // TODO: WIP: genres, tags, narrator, authors and series
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
