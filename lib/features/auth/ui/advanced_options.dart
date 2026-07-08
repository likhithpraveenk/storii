import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/settings/ui/trust_all_certificates_tile.dart';

typedef Header = (String key, String value);

extension HeaderMapX on Map<String, String> {
  List<Header> toHeaders() => [for (final e in entries) (e.key, e.value)];
}

extension HeaderListX on Iterable<Header> {
  Map<String, String> toMap() => {for (final h in this) h.$1: h.$2};
}

class AdvancedOptions extends ConsumerStatefulWidget {
  const AdvancedOptions({super.key});

  @override
  ConsumerState<AdvancedOptions> createState() => _AdvancedOptionsState();
}

class _AdvancedOptionsState extends ConsumerState<AdvancedOptions> {
  late final List<Header> _headers;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _headers = ref.read(tempServerProvider)?.headers.toHeaders() ?? [];
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(tempServerProvider.notifier)
        .setHeaders(_headers.where((h) => h.$1.trim().isNotEmpty).toMap());
  }

  String? _validateKey(int index, String? value) {
    final key = value?.trim() ?? '';

    if (key.isEmpty) {
      return l10n.required;
    }

    final duplicate = _headers.asMap().entries.any((entry) {
      return entry.key != index &&
          entry.value.$1.trim().toLowerCase() == key.toLowerCase();
    });

    if (duplicate) {
      return l10n.duplicateHeader;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const TrustAllCertificatesTile(inSettings: false),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.customHeaders),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _headers.add(('', ''));
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _headers.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final header = _headers[index];

              return Column(
                crossAxisAlignment: .start,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: .circular(kRadius)),
                    clipBehavior: .hardEdge,
                    child: TextFormField(
                      initialValue: header.$1,
                      decoration: InputDecoration(
                        contentPadding: const .all(12),
                        hintText: l10n.key,
                        filled: true,
                        border: .none,
                        enabledBorder: .none,
                        focusedBorder: .none,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              _headers.removeAt(index);
                            });
                            _save();
                          },
                        ),
                      ),
                      validator: (value) => _validateKey(index, value),
                      onChanged: (key) {
                        _headers[index] = (key, _headers[index].$2);
                        _formKey.currentState?.validate();
                        _save();
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(borderRadius: .circular(kRadius)),
                    clipBehavior: .hardEdge,
                    child: TextFormField(
                      initialValue: header.$2,
                      decoration: InputDecoration(
                        contentPadding: const .all(12),
                        hintText: l10n.value,
                        filled: true,
                        border: .none,
                        enabledBorder: .none,
                        focusedBorder: .none,
                      ),
                      onChanged: (value) {
                        _headers[index] = (_headers[index].$1, value);
                        _save();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
