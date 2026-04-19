import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/abs_urls.dart';
import 'package:storii/features/auth/logic/add_user_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class UserLoginForm extends ConsumerStatefulWidget {
  const UserLoginForm({
    super.key,
    required this.serverUrl,
    required this.serverStatus,
    required this.isLoading,
    this.username,
  });

  final Uri serverUrl;
  final ServerStatusResponse serverStatus;
  final bool isLoading;
  final String? username;

  @override
  ConsumerState<UserLoginForm> createState() => _UserLoginFormState();
}

class _UserLoginFormState extends ConsumerState<UserLoginForm> {
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

  void _login() => ref
      .read(addUserProvider.notifier)
      .login(
        widget.serverUrl,
        _usernameController.text,
        _passwordController.text,
      );

  void _loginWithOidc() =>
      ref.read(addUserProvider.notifier).loginWithOIDC(widget.serverUrl);

  @override
  Widget build(BuildContext context) {
    final authMethods = widget.serverStatus.authMethods;
    final supportsLocal = authMethods?.contains(AuthMethod.local) == true;
    final supportsOidc = authMethods?.contains(AuthMethod.openid) == true;
    final l = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final customMessage =
        widget.serverStatus.authFormData?.authLoginCustomMessage;
    final oidcButtonText =
        widget.serverStatus.authFormData?.authOpenIDButtonText ?? l.loginOidc;

    return AutofillGroup(
      child: Column(
        children: [
          if (customMessage != null && customMessage.isNotEmpty) ...[
            Text(
              cleanHtml(customMessage),
              style: textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: 16),
          ],
          if (supportsOidc) ...[
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AppFilledButton(
                    icon: const Icon(Icons.open_in_browser),
                    text: oidcButtonText,
                    loading: widget.isLoading,
                    onPressed: _loginWithOidc,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 13, color: scheme.error),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: .center,
                        children: [
                          Text(
                            l.oidcRedirectUriHintPrefix,
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const .symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: scheme.surfaceContainer,
                              borderRadius: .circular(4),
                            ),
                            child: SelectableText(
                              'storii://oauth',
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurface,
                                fontFamily: 'monospace',
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l.oidcRedirectUriHintSuffix,
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrl(AbsUrls.authConfig(widget.serverUrl));
                      },
                      icon: Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: scheme.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (supportsLocal)
              Padding(
                padding: const .symmetric(vertical: 16),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const .symmetric(horizontal: 12),
                      child: Text(l.or, style: textTheme.labelSmall),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
            const SizedBox(height: 16),
          ],
          if (supportsLocal) ...[
            TextField(
              controller: _usernameController,
              enabled: !widget.isLoading,
              textInputAction: .next,
              keyboardType: .name,
              autofillHints: const [AutofillHints.username],
              decoration: InputDecoration(
                labelText: l.username,
                labelStyle: textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              enabled: !widget.isLoading,
              textInputAction: .done,
              autofillHints: const [AutofillHints.password],
              onSubmitted: (_) => _login(),
              keyboardType: .visiblePassword,
              decoration: InputDecoration(
                labelText: l.password,
                labelStyle: textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                icon: const Icon(Icons.login),
                text: l.login,
                loading: widget.isLoading,
                onPressed: _login,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
