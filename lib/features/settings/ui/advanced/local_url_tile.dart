import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class LocalUrlTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const SizedBox.shrink();

    final server = ref.watch(serverStreamProvider(user.serverUrl)).value;
    final localUrl = server?.localUrl;

    return ListTile(
      leading: const Icon(Icons.router_outlined),
      title: Text(l10n.localUrl),
      subtitle: Text(localUrl?.toString() ?? l10n.localUrlSubtitle),
      onTap: () async {
        final server = ref.read(serversProvider.notifier).get(user.serverUrl);
        if (server == null) return;
        final result = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: .vertical(top: .circular(24)),
          ),
          useSafeArea: true,
          builder: (context) =>
              _LocalUrlSheet(initialValue: localUrl?.toString()),
        );

        if (result != null && context.mounted) {
          final newLocalUrl = result.isEmpty ? null : Uri.parse(result);
          await ref
              .read(serversProvider.notifier)
              .edit(server.url, server.copyWith(localUrl: newLocalUrl));
        }
      },
    );
  }
}

class _LocalUrlSheet extends ConsumerStatefulWidget {
  const new({this.initialValue});

  final String? initialValue;

  @override
  ConsumerState<_LocalUrlSheet> createState() => _LocalUrlSheetState();
}

class _LocalUrlSheetState extends ConsumerState<_LocalUrlSheet> {
  late final TextEditingController _controller;
  String? errorMsg;
  bool _validating = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue ?? 'http://192.168.1.100:13378',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _validate() async {
    final trimmed = _controller.text.trim();
    if (trimmed.isEmpty) {
      Navigator.pop(context, '');
      return;
    }

    final url = Uri.tryParse(trimmed);
    if (url == null || url.host.isEmpty) {
      setState(() => errorMsg = l10n.invalidFormat);
      return;
    }

    setState(() {
      _validating = true;
      errorMsg = null;
    });

    final pingErr = await ref.read(pingServerProvider(url).future);
    if (!mounted) return;

    if (pingErr != null) {
      setState(() => errorMsg = pingErr);
    } else {
      Navigator.pop(context, trimmed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        decoration: bottomSheetDecoration(context),
        padding: MediaQuery.viewInsetsOf(context).add(const .all(24)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                l10n.localUrl,
                style: bottomSheetTitleTextStyle(context),
                textAlign: .center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                keyboardType: .url,
                textInputAction: .done,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: l10n.serverUrl,
                  labelStyle: theme.textTheme.titleSmall,
                  hintText: 'http://192.168.1.100:13378',
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _controller.clear();
                            setState(() => errorMsg = null);
                          },
                          icon: const Icon(Icons.cancel_outlined),
                        )
                      : null,
                  errorText: errorMsg,
                  errorMaxLines: 3,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  loading: _validating,
                  text: l10n.save,
                  onPressed: _validate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
