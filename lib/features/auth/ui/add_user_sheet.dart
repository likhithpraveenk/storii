import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

Future<void> showAddUserSheet(
  BuildContext context,
  Uri serverUrl, [
  String? username,
]) async {
  await AppBottomSheet.show(
    context,
    title: AppLocalizations.of(context)!.addUser,
    subtitle: serverUrl.cleanString,
    isDismissible: false,
    body: AddUserSheet(serverUrl, username: username),
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

    final focusUsername = widget.username == null || widget.username!.isEmpty;

    return Padding(
      padding: MediaQuery.viewInsetsOf(
        context,
      ).add(const .fromLTRB(24, 0, 24, 24)),
      child: AutofillGroup(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              enabled: !isLoading,
              textInputAction: .next,
              keyboardType: .name,
              autofillHints: const [AutofillHints.username],
              autofocus: focusUsername,
              decoration: InputDecoration(
                labelText: l10n.username,
                labelStyle: textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              autofocus: !focusUsername,
              controller: _passwordController,
              enabled: !isLoading,
              textInputAction: .done,
              autofillHints: const [AutofillHints.password],
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
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                icon: const Icon(Icons.login),
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
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                text: l10n.cancel,
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
    );
  }
}
