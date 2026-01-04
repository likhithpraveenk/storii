import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

Future<void> showAddUserSheet(
  BuildContext context,
  Uri serverUrl, [
  String? username,
]) async {
  await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: AppStyles.roundedRect,
    builder: (_) => AddUserSheet(serverUrl, username: username),
  );
}

class AddUserSheet extends ConsumerStatefulWidget {
  const AddUserSheet(this.serverUrl, {super.key, this.username});

  final Uri serverUrl;
  final String? username;

  @override
  ConsumerState<AddUserSheet> createState() => _AddUserSheetState();
}

class _AddUserSheetState extends ConsumerState<AddUserSheet> {
  late final TextEditingController _usernameController;
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addUserProvider);
    final isLoading = state.status == .loading;
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: MediaQuery.viewInsetsOf(context).add(const .all(24)),
        child: AutofillGroup(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                '${l10n.serverUrl}: ${widget.serverUrl.cleanString}',
                style: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                enabled: !isLoading,
                textInputAction: .next,
                keyboardType: .name,
                autofillHints: [AutofillHints.username],
                autofocus: true,
                decoration: InputDecoration(
                  labelText: l10n.username,
                  labelStyle: textTheme.titleSmall,
                  border: AppStyles.inputBorder,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                enabled: !isLoading,
                textInputAction: .done,
                autofillHints: [AutofillHints.password],
                onSubmitted: (_) => ref
                    .read(addUserProvider.notifier)
                    .login(
                      widget.serverUrl,
                      _usernameController.text,
                      _passwordController.text,
                    ),
                keyboardType: .visiblePassword,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  labelStyle: textTheme.titleSmall,
                  border: AppStyles.inputBorder,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  text: l10n.login,
                  loading: isLoading,
                  onPressed: () => ref
                      .read(addUserProvider.notifier)
                      .login(
                        widget.serverUrl,
                        _usernameController.text,
                        _passwordController.text,
                      ),
                ),
              ),
              if (state.message != null) ...[
                const SizedBox(height: 16),
                Text(
                  state.message!,
                  style: textTheme.labelSmall?.copyWith(color: scheme.error),
                  textAlign: .center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
