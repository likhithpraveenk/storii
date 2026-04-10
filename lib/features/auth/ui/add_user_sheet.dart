import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/features/auth/ui/user_login_form.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final status = ref.read(serverStatusProvider(widget.serverUrl)).value;
      if (status?.authFormData?.authOpenIDAutoLaunch == true) {
        ref.read(addUserProvider.notifier).loginWithOIDC(widget.serverUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addUserProvider);
    final isLoading = state.status == .loading;
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final serverStatusAsync = ref.watch(serverStatusProvider(widget.serverUrl));

    return Padding(
      padding: MediaQuery.viewInsetsOf(
        context,
      ).add(const .fromLTRB(24, 0, 24, 24)),
      child: Column(
        children: [
          serverStatusAsync.when(
            loading: () => const Center(child: RandomWaveform()),
            error: (e, _) => ErrorRetryWidget(
              '$e',
              onRetry: () =>
                  ref.invalidate(serverStatusProvider(widget.serverUrl)),
            ),
            data: (status) => UserLoginForm(
              serverUrl: widget.serverUrl,
              serverStatus: status,
              username: widget.username,
              isLoading: isLoading,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
              text: l.cancel,
              onPressed: () {
                ref.invalidate(addUserProvider);
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
    );
  }
}
