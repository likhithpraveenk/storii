import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/ui/advanced_options.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

Future<String?> showAddServerSheet(
  BuildContext context, [
  Server? server,
]) async {
  return await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(24)),
    ),
    useSafeArea: true,
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

  bool optionsExpanded = false;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(
      text: widget.server?.url.toString() ?? 'https://',
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tempServerProvider.notifier)
          .init(server: widget.server, url: Uri.parse(_urlController.text));
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    final headers = ref.read(tempServerProvider)?.headers ?? {};
    await ref
        .read(addServerProvider.notifier)
        .addServer(
          _urlController.text,
          server: widget.server,
          headers: headers,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addServerProvider);
    final isLoading = state.status == .checking;
    final theme = Theme.of(context);

    ref.listen<ServerState>(addServerProvider, (p, n) {
      if (p?.status != .available && n.status == .available) {
        Navigator.of(context).pop(_urlController.text);
      }
    });

    return SafeArea(
      child: Container(
        decoration: bottomSheetDecoration(context),
        padding: MediaQuery.viewInsetsOf(context).add(const .all(24)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                l10n.addServer,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: .w600,
                  letterSpacing: -0.3,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _urlController,
                keyboardType: .url,
                enabled: !isLoading,
                textInputAction: .done,
                autofocus: true,
                onSubmitted: (_) => submit(),
                decoration: InputDecoration(
                  labelText: l10n.serverUrl,
                  labelStyle: theme.textTheme.titleSmall,
                  hintText: 'https://abs.example.com',
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () =>
                    setState(() => optionsExpanded = !optionsExpanded),
                label: Text(l10n.advanced),
                icon: AnimatedRotation(
                  turns: optionsExpanded ? 0.25 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.chevron_right),
                ),
                iconAlignment: .end,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOutBack,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.9, end: 1).animate(animation),
                    alignment: .topCenter,
                    child: child,
                  ),
                ),
                child: optionsExpanded
                    ? const Padding(
                        key: ValueKey('expanded'),
                        padding: .only(top: 12),
                        child: AdvancedOptions(),
                      )
                    : const SizedBox.shrink(key: ValueKey('collapsed')),
              ),
              if (state.message != null) ...[
                const SizedBox(height: 12),
                Text(
                  state.message!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  textAlign: .center,
                ),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  icon: const Icon(Icons.monitor_heart_outlined),
                  text: l10n.validateServer,
                  loading: isLoading,
                  onPressed: submit,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: AppTextButton(
                  text: l10n.cancel,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
