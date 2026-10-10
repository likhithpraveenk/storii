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
      padding: const .fromLTRB(16, 12, 16, 12),
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
