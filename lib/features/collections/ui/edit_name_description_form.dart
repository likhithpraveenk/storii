import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class EditNameDescriptionForm extends StatefulWidget {
  const new({
    super.key,
    required this.initialName,
    this.initialDescription,
    required this.onSave,
  });

  final String initialName;
  final String? initialDescription;
  final Future<void> Function({required String name, String? description})
  onSave;

  static Future<void> show(
    BuildContext context, {
    required String initialName,
    String? initialDescription,
    required Future<void> Function({required String name, String? description})
    onSave,
  }) => AppBottomSheet.show(
    context,
    title: l10n.edit,
    body: EditNameDescriptionForm(
      initialName: initialName,
      initialDescription: initialDescription,
      onSave: onSave,
    ),
  );

  @override
  State<EditNameDescriptionForm> createState() =>
      _EditNameDescriptionFormState();
}

class _EditNameDescriptionFormState extends State<EditNameDescriptionForm> {
  late final _nameController = TextEditingController(text: widget.initialName);
  late final _descriptionController = TextEditingController(
    text: widget.initialDescription,
  );
  var _isBusy = false;
  var _nameError = false;

  String get _trimmedName => _nameController.text.trim();
  String get _trimmedDescription => _descriptionController.text.trim();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isBusy) return;
    if (_trimmedName.isEmpty) {
      setState(() => _nameError = true);
      return;
    }
    setState(() => _isBusy = true);
    try {
      await widget.onSave(
        name: _trimmedName,
        description: _trimmedDescription.isEmpty ? null : _trimmedDescription,
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .fromLTRB(24, 0, 24, 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          TextField(
            controller: _nameController,
            textInputAction: .next,
            autofocus: true,
            onChanged: (value) {
              if (_nameError && value.trim().isNotEmpty) {
                setState(() => _nameError = false);
              }
            },
            decoration: InputDecoration(
              labelText: l10n.name,
              labelStyle: theme.textTheme.titleSmall,
              errorText: _nameError ? l10n.required : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            textInputAction: .done,
            minLines: 1,
            maxLines: 8,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: l10n.description,
              labelStyle: theme.textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              loading: _isBusy,
              onPressed: _submit,
              text: l10n.save,
            ),
          ),
        ],
      ),
    );
  }
}
