part of 'edit_metadata_screen.dart';

class MetadataChips<T> extends StatefulWidget {
  const new({
    super.key,
    required this.label,
    required this.values,
    required this.options,
    required this.displayValue,
    this.compareValue,
    required this.onChanged,
    this.createOption,
    this.suffixOnSelect,
  });

  final String label;
  final List<T> values;
  final List<T> options;
  final String Function(T option) displayValue;
  final String Function(T option)? compareValue;
  final void Function(List<T> selected) onChanged;

  final T? Function(String text, T? previous)? createOption;
  final String? suffixOnSelect;
  @override
  State<MetadataChips<T>> createState() => _MetadataChipsState<T>();
}

class _MetadataChipsState<T> extends State<MetadataChips<T>> {
  int? _editingIndex;

  String _norm(String s) => s.trim().toLowerCase();

  String _compareVal(T value) =>
      _norm(widget.compareValue?.call(value) ?? widget.displayValue(value));

  bool _isNew(T value) {
    final l = _compareVal(value);
    return !widget.options.any((o) => _compareVal(o) == l);
  }

  T? _matchOption(String text) {
    final l = _norm(text);
    for (final o in widget.options) {
      if (_norm(widget.displayValue(o)) == l) return o;
    }
    return null;
  }

  void _commit(int index, String text) {
    final t = text.trim();
    setState(() => _editingIndex = null);
    if (t.isEmpty) return;

    final list = List<T>.from(widget.values);
    final editingExisting = index < list.length;

    if (editingExisting &&
        _norm(t) == _norm(widget.displayValue(list[index]))) {
      return;
    }

    final previous = editingExisting && _isNew(list[index])
        ? list[index]
        : null;
    final value = _matchOption(t) ?? widget.createOption?.call(t, previous);
    if (value == null) return;

    final key = _compareVal(value);
    final isDup = list.asMap().entries.any(
      (e) => e.key != index && _compareVal(e.value) == key,
    );
    if (isDup) return;

    if (editingExisting) {
      list[index] = value;
    } else {
      list.add(value);
    }
    widget.onChanged(list);
  }

  void _remove(int index) {
    final list = List<T>.from(widget.values)..removeAt(index);
    setState(() => _editingIndex = null);
    widget.onChanged(list);
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.values;
    final theme = Theme.of(context);

    return Padding(
      padding: const .fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(widget.label, style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: .center,
            children: [
              for (var i = 0; i < selected.length; i++)
                if (_editingIndex == i)
                  _InlineEditor(
                    key: ValueKey('edit-$i'),
                    initialText: widget.displayValue(selected[i]),
                    suggestionsFor: (q) => _suggestions(q, exceptIndex: i),
                    onDone: (text) => _commit(i, text),
                    suffixOnSelect: widget.suffixOnSelect,
                  )
                else
                  _buildChip(i, selected[i], theme.colorScheme),
              if (_editingIndex == selected.length)
                _InlineEditor(
                  key: const ValueKey('edit-new'),
                  initialText: '',
                  suggestionsFor: (q) =>
                      _suggestions(q, exceptIndex: selected.length),
                  onDone: (text) => _commit(selected.length, text),
                  suffixOnSelect: widget.suffixOnSelect,
                )
              else
                ActionChip(
                  label: const Icon(Icons.add, size: 18),
                  onPressed: () =>
                      setState(() => _editingIndex = selected.length),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(int index, T value, ColorScheme scheme) {
    final isNew = _isNew(value);
    return InputChip(
      label: Text(widget.displayValue(value)),
      deleteButtonTooltipMessage: l10n.delete,
      side: isNew ? BorderSide(color: scheme.tertiary) : null,
      onPressed: () => setState(() => _editingIndex = index),
      onDeleted: () => _remove(index),
    );
  }

  Iterable<String> _suggestions(String query, {required int exceptIndex}) {
    final taken = <String>[
      for (var i = 0; i < widget.values.length; i++)
        if (i != exceptIndex) _compareVal(widget.values[i]),
    ];
    final q = _norm(query);
    return widget.options
        .where((o) => !taken.contains(_compareVal(o)))
        .map(widget.displayValue)
        .where((l) => _norm(l).contains(q));
  }
}

class _InlineEditor extends StatefulWidget {
  const new({
    super.key,
    required this.initialText,
    required this.suggestionsFor,
    required this.onDone,
    this.suffixOnSelect,
  });

  final String initialText;
  final Iterable<String> Function(String query) suggestionsFor;
  final void Function(String text) onDone;
  final String? suffixOnSelect;

  @override
  State<_InlineEditor> createState() => _InlineEditorState();
}

class _InlineEditorState extends State<_InlineEditor> {
  late final TextEditingController _controller;
  final FocusNode _focus = FocusNode();
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focus.addListener(_onFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focus.requestFocus();
    });
  }

  void _onFocusChange() {
    if (_focus.hasFocus) return;
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _finish(_controller.text);
    });
  }

  void _finish(String text) {
    if (_done) return;
    _done = true;
    widget.onDone(text);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final width = (screenWidth - 48).clamp(200.0, 400.0);

    return SizedBox(
      width: width,
      child: RawAutocomplete<String>(
        textEditingController: _controller,
        focusNode: _focus,
        optionsBuilder: (value) => widget.suggestionsFor(value.text),
        onSelected: (option) {
          final suffix = widget.suffixOnSelect;
          if (suffix == null) {
            _finish(option);
            return;
          }
          final text = '$option$suffix';
          _controller.value = TextEditingValue(
            text: text,
            selection: .collapsed(offset: text.length),
          );
          _focus.requestFocus();
        },
        fieldViewBuilder: (context, controller, focusNode, onSubmit) {
          return DecoratedBox(
            decoration: ShapeDecoration(
              shape: StadiumBorder(
                side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
              ),
            ),
            child: Padding(
              padding: const .symmetric(horizontal: 12),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                style: theme.textTheme.labelLarge,
                textInputAction: .done,
                decoration: const InputDecoration(
                  isDense: true,
                  border: .none,
                  contentPadding: .symmetric(vertical: 8),
                  focusedBorder: .none,
                  errorBorder: .none,
                ),
                onSubmitted: _finish,
              ),
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: .topLeft,
            child: Material(
              elevation: 4,
              borderRadius: .circular(kRadius),
              color: theme.colorScheme.surfaceContainerHighest,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 240,
                ),
                child: ListView.builder(
                  padding: .zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, i) {
                    final option = options.elementAt(i);
                    return InkWell(
                      onTap: () => onSelected(option),
                      child: Padding(
                        padding: const .symmetric(horizontal: 16, vertical: 10),
                        child: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
