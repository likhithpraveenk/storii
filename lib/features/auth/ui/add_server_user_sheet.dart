import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

enum AuthStep { serverUrl, login }

class AddServerAndUserSheet extends ConsumerStatefulWidget {
  const AddServerAndUserSheet({super.key, this.serverUrl, this.username});

  final Uri? serverUrl;
  final String? username;

  @override
  ConsumerState<AddServerAndUserSheet> createState() =>
      _AddServerAndUserSheetState();
}

class _AddServerAndUserSheetState extends ConsumerState<AddServerAndUserSheet> {
  AuthStep _currentStep = .serverUrl;
  Uri? _validatedUrl;

  late final TextEditingController _urlController;
  late final TextEditingController _usernameController;
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _validatedUrl = widget.serverUrl;
    _urlController = TextEditingController(
      text: widget.serverUrl?.toString() ?? 'https://',
    );
    _usernameController = TextEditingController(text: widget.username);
  }

  @override
  void dispose() {
    _urlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _validateServer() async {
    final url = _urlController.text;
    await ref.read(addServerProvider.notifier).addServer(url);
  }

  Future<void> _login() async {
    if (_validatedUrl == null) return;
    await ref
        .read(addUserProvider.notifier)
        .login(
          _validatedUrl!,
          _usernameController.text,
          _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final serverState = ref.watch(addServerProvider);
    final userState = ref.watch(addUserProvider);
    final l = AppLocalizations.of(context)!;

    ref.listen(addServerProvider, (p, n) {
      if (p?.status != .available && n.status == .available) {
        setState(() {
          _validatedUrl = _urlController.text.normalizedUri;
          _currentStep = .login;
        });
      }
    });

    ref.listen(addUserProvider, (p, n) {
      if (p?.status != .success && n.status == .success) {
        // Navigator.of(context).pop();
      }
    });

    return SafeArea(
      child: Padding(
        padding: MediaQuery.viewInsetsOf(context).add(const .all(24)),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _currentStep == .serverUrl || _validatedUrl == null
              ? _buildServerStep(serverState, l)
              : _buildLoginStep(userState, l),
        ),
      ),
    );
  }

  Widget _buildServerStep(ServerState state, AppLocalizations l) {
    final isLoading = state.status == .checking;
    return Column(
      key: const ValueKey('serverStep'),
      mainAxisSize: .min,
      children: [
        TextField(
          controller: _urlController,
          enabled: !isLoading,
          decoration: InputDecoration(labelText: l.serverUrl),
          onSubmitted: (_) => _validateServer(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: AppFilledButton(
            text: l.validateServer,
            loading: isLoading,
            onPressed: _validateServer,
          ),
        ),
        if (state.message != null) _ErrorText(state.message!),
      ],
    );
  }

  Widget _buildLoginStep(UserState state, AppLocalizations l) {
    final isLoading = state.status == .loading;
    return AutofillGroup(
      key: const ValueKey('loginStep'),
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            '${l.serverUrl}: ${_validatedUrl?.cleanString}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _usernameController,
            autofocus: true,
            enabled: !isLoading,
            decoration: InputDecoration(labelText: l.username),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            enabled: !isLoading,
            decoration: InputDecoration(labelText: l.password),
            onSubmitted: (_) => _login(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              text: l.login,
              loading: isLoading,
              onPressed: _login,
            ),
          ),
          if (state.message != null) _ErrorText(state.message!),
          TextButton(
            onPressed: () => setState(() => _currentStep = .serverUrl),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

class _ErrorText extends StatelessWidget {
  final String message;
  const _ErrorText(this.message);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 16),
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
