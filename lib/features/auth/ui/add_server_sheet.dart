import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

Future<String?> showAddServerSheet(
  BuildContext context, [
  Server? server,
]) async {
  return await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (context) => AddServerSheet(server: server),
  );
}

class AddServerSheet extends ConsumerStatefulWidget {
  const AddServerSheet({super.key, this.server});

  final Server? server;

  @override
  ConsumerState<AddServerSheet> createState() => _AddServerSheetState();
}

class _AddServerSheetState extends ConsumerState<AddServerSheet> {
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(
      text: widget.server?.url.toString() ?? 'https://',
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    await ref
        .read(addServerProvider.notifier)
        .addServer(_urlController.text, widget.server);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addServerProvider);
    final isLoading = state.status == .checking;
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;

    ref.listen<ServerState>(addServerProvider, (p, n) {
      if (p?.status != .available && n.status == .available) {
        Navigator.of(context).pop(_urlController.text);
      }
    });

    return SafeArea(
      child: Padding(
        padding: MediaQuery.viewInsetsOf(context).add(const .all(24)),
        child: Column(
          mainAxisSize: .min,
          children: [
            TextField(
              controller: _urlController,
              keyboardType: .url,
              enabled: !isLoading,
              textInputAction: .done,
              onSubmitted: (_) => submit(),
              decoration: InputDecoration(
                labelText: l.serverUrl,
                labelStyle: Theme.of(context).textTheme.titleSmall,
                hintText: 'https://abs.example.com',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                icon: const Icon(Icons.monitor_heart_outlined),
                text: l.validateServer,
                loading: isLoading,
                onPressed: submit,
              ),
            ),
            if (state.message != null) ...[
              const SizedBox(height: 16),
              Text(
                state.message!,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: scheme.error),
                textAlign: .center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
