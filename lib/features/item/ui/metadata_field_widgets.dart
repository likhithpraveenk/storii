part of 'edit_metadata_screen.dart';

class MetadataTextField extends StatelessWidget {
  const new({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged,
    this.keyboardType = .text,
    this.isRequired = false,
  });

  final TextEditingController controller;
  final String label;
  final void Function(String value) onChanged;
  final TextInputType keyboardType;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: .sentences,
        maxLines: null,
        textInputAction: keyboardType == .multiline ? .newline : .next,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text.rich(
            TextSpan(
              text: label,
              children: [
                if (isRequired)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: appRedColor),
                  ),
              ],
            ),
          ),
          hint: Text(label),
        ),
      ),
    );
  }
}

class MetadataCheckbox extends StatelessWidget {
  const new({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      contentPadding: const .fromLTRB(24, 0, 16, 0),
      title: Text(label),
      onChanged: (v) => onChanged(v ?? false),
    );
  }
}

class MetadataMultiSelect<T> extends StatelessWidget {
  const new({
    super.key,
    required this.label,
    required this.selected,
    required this.options,
    required this.optionLabel,
    required this.onChanged,
  });

  final String label;
  final List<T> selected;
  final List<T> options;
  final String Function(T option) optionLabel;
  final void Function(List<T> selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(24, 12, 24, 12),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ...selected.map(
                (option) => InputChip(
                  label: Text(optionLabel(option)),
                  onDeleted: () =>
                      onChanged(List<T>.from(selected)..remove(option)),
                ),
              ),
              ActionChip(
                label: const Icon(Icons.add, size: 18),
                onPressed: () => _showDialog(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    final selection = List<T>.from(selected);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(label),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: options.map((option) {
                final isSelected = selection.contains(option);
                return CheckboxListTile(
                  value: isSelected,
                  title: Text(optionLabel(option)),
                  onChanged: (v) {
                    setState(() {
                      if (v == true) {
                        selection.add(option);
                      } else {
                        selection.remove(option);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                onChanged(selection);
                Navigator.pop(context);
              },
              child: Text(l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
