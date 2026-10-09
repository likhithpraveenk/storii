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
    final metadata = state.original.metadata as BookMetadata;
    _titleController.text = metadata.title ?? '';
    _subtitleController.text = metadata.subtitle ?? '';
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
    final media = state.draft as BookMedia;
    final metadata = state.draft.metadata as BookMetadata;
    final filterData = ref.watch(filterDataProvider);
    final seriesOptions = filterData.series.map((s) => s.stripped).toList();

    return AppScrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
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
            MetadataChips<Author>(
              label: l10n.authors,
              values: metadata.authors?.map((s) => s.stripped).toList() ?? [],
              options: filterData.authors.map((s) => s.stripped).toList(),
              displayValue: (a) => a.name,
              onChanged: (a) => _updateDraft((m) => m.copyWith(authors: a)),
              createOption: (name, previous) =>
                  Author(id: previous?.id ?? const Uuid().v4(), name: name),
            ),
            MetadataChips<Series>(
              label: l10n.series,
              values: metadata.series?.map((s) => s.stripped).toList() ?? [],
              options: seriesOptions,
              displayValue: (s) =>
                  s.sequence != null ? '${s.name} #${s.sequence}' : s.name,
              compareValue: (s) => s.name,
              onChanged: (s) => _updateDraft((m) => m.copyWith(series: s)),
              suffixOnSelect: ' #',
              createOption: (text, previous) {
                final i = text.indexOf('#');
                final name = (i < 0 ? text : text.substring(0, i)).trim();
                final seq = i < 0 ? '' : text.substring(i + 1).trim();
                if (name.isEmpty) return null;

                final existing = seriesOptions.firstWhereOrNull(
                  (o) => o.name == name,
                );

                return Series(
                  id: existing?.id ?? previous?.id ?? const Uuid().v4(),
                  name: existing?.name ?? name,
                  sequence: seq.isEmpty ? null : seq,
                );
              },
            ),
            MetadataTextField(
              controller: _descriptionController,
              label: l10n.description,
              keyboardType: .multiline,
              onChanged: (v) => _updateDraft(
                (m) => m.copyWith(description: v.trim().isEmpty ? null : v),
              ),
            ),
            MetadataChips(
              label: l10n.genres,
              values: metadata.genres,
              options: filterData.genres,
              displayValue: (g) => g,
              onChanged: (v) => _updateDraft((m) => m.copyWith(genres: v)),
            ),
            MetadataChips(
              label: l10n.tags,
              values: media.tags,
              options: filterData.tags,
              displayValue: (t) => t,
              onChanged: (v) => _updateMedia((m) => m.copyWith(tags: v)),
            ),
            MetadataChips(
              label: l10n.narrators,
              values: metadata.narrators ?? <String>[],
              options: filterData.narrators,
              displayValue: (n) => n,
              onChanged: (v) => _updateDraft((m) => m.copyWith(narrators: v)),
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
}
