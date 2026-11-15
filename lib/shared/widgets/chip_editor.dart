import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';

class ChipEditor extends StatefulWidget {
  const new({
    super.key,
    required this.initialText,
    required this.suggestionsFor,
    required this.onCommit,
    this.optionsMaxWidth = 240,
    this.optionsMaxHeight = 200,
    this.displayStringForOption,
    this.keepEditorOpenOnSelect = false,
  });

  final String initialText;
  final Iterable<String> Function(String query) suggestionsFor;
  final ValueChanged<String> onCommit;

  /// Suggestions sheet width cap
  final double optionsMaxWidth;

  /// Suggestions sheet height cap
  final double optionsMaxHeight;

  /// Text placed in the field when an option is selected. Defaults to the
  /// option itself.
  final String Function(String option)? displayStringForOption;

  /// Keeps the editor open after a selection, seeded with
  /// [displayStringForOption]. Used for values that need a second part typed
  /// after the option (e.g. `name #sequence`).
  final bool keepEditorOpenOnSelect;

  @override
  State<ChipEditor> createState() => _ChipEditorState();
}

class _ChipEditorState extends State<ChipEditor> {
  late final TextEditingController _controller;
  final FocusNode _focus = FocusNode();
  final Object _tapGroupId = Object();
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  String _textFor(String option) =>
      widget.displayStringForOption?.call(option) ?? option;

  void _finish(String text) {
    if (_done) return;
    _done = true;
    _focus.unfocus();
    widget.onCommit(text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RawAutocomplete<String>(
      textEditingController: _controller,
      focusNode: _focus,
      displayStringForOption: _textFor,
      optionsBuilder: (value) => widget.suggestionsFor(value.text),
      onSelected: (option) {
        if (!widget.keepEditorOpenOnSelect) {
          _finish(_textFor(option));
          return;
        }
        final text = _textFor(option);
        _controller.value = TextEditingValue(
          text: text,
          selection: .collapsed(offset: text.length),
        );
        _focus.requestFocus();
      },
      fieldViewBuilder: (context, controller, focusNode, onSubmit) {
        return TapRegion(
          groupId: _tapGroupId,
          onTapOutside: (_) => _finish(controller.text),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: .circular(kRadius),
              border: .all(color: theme.colorScheme.primary, width: 1.5),
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
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: .topLeft,
          child: TapRegion(
            groupId: _tapGroupId,
            child: TextFieldTapRegion(
              child: Material(
                borderRadius: .circular(kRadius),
                color: theme.colorScheme.surfaceContainerHigh,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: widget.optionsMaxHeight,
                    maxWidth: widget.optionsMaxWidth,
                  ),
                  child: ListView.builder(
                    padding: .zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, i) {
                      final option = options.elementAt(i);
                      return InkWell(
                        onTap: () => onSelected(option),
                        borderRadius: .circular(kRadius),
                        child: Padding(
                          padding: const .symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Text(option),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
