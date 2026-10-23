import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/spoiler_text.dart';

class ConnectionStatusIcon extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketState = ref.watch(socketStateProvider).value ?? .disconnected;
    final connectionType = ref.watch(connectionTypeProvider);
    final scheme = Theme.of(context).colorScheme;

    final isBusy = socketState == .connecting || socketState == .authenticating;
    final isConnected = socketState == .ready;
    final hasNetwork = connectionType != .none;

    return IconButton(
      tooltip: l10n.connectionStatus,
      icon: Icon(
        switch (socketState) {
          .ready => connectionType.icon,
          .connecting || .authenticating => Icons.cloud_sync,
          .authFailed || .disconnected => Icons.cloud_off,
        },
        color: hasNetwork && (isConnected || isBusy)
            ? scheme.primary
            : scheme.error,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: .vertical(top: .circular(24)),
          ),
          builder: (context) => const _ConnectionDetailsSheet(),
        );
      },
    );
  }
}

extension on ConnectionType {
  IconData get icon {
    return switch (this) {
      .wifi => Icons.wifi,
      .mobile => Icons.signal_cellular_alt,
      .ethernet => Icons.settings_ethernet,
      .none => Icons.wifi_off,
    };
  }
}

class _ConnectionDetailsSheet extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketState = ref.watch(socketStateProvider).value ?? .disconnected;
    final connectionType = ref.watch(connectionTypeProvider);
    final user = ref.watch(currentUserProvider);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (icon, titleText, subtitleText, statusColor) = switch (socketState) {
      .ready => (
        connectionType.icon,
        l10n.connectionServerConnected,
        l10n.connectionViaNetwork(connectionType.label),
        scheme.primary,
      ),
      .connecting || .authenticating => (
        Icons.cloud_sync,
        l10n.connectionAuthenticating,
        l10n.connectionViaNetwork(connectionType.label),
        scheme.primary,
      ),
      .authFailed => (
        Icons.cloud_off,
        l10n.connectionAuthFailed,
        l10n.errorAuth,
        scheme.error,
      ),
      .disconnected => (
        Icons.cloud_off,
        l10n.connectionServerDisconnected,
        l10n.connectionCantReachServer(connectionType.label),
        scheme.error,
      ),
    };
    final serverUrl = ref.watch(activeServerUrlProvider);
    final serverStatus = user != null
        ? ref.watch(serverStatusProvider(serverUrl))
        : null;
    final canRetry = socketState == .disconnected || socketState == .authFailed;

    return Container(
      padding: const .fromLTRB(24, 32, 24, 48),
      decoration: bottomSheetDecoration(context),
      child: Column(
        mainAxisSize: .min,
        children: [
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Icon(icon, color: statusColor, size: 48),
              Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    titleText,
                    style: textTheme.titleMedium?.copyWith(fontWeight: .w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitleText,
                    style: textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                    textAlign: .center,
                  ),
                  if (user != null) ...[
                    const SizedBox(height: 12),
                    SpoilerText(
                      Text(
                        '$serverUrl',
                        style: textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (serverStatus != null)
                      serverStatus.maybeWhen(
                        data: (status) => Text(
                          status.serverVersion != null
                              ? '(v${status.serverVersion})'
                              : ' ',
                          style: textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                          textAlign: .center,
                        ),
                        orElse: () => Text(' ', style: textTheme.bodySmall),
                      ),
                  ],
                ],
              ),
            ],
          ),
          if (canRetry && user != null) ...[
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: AppOutlinedButton(
                onPressed: () async {
                  try {
                    final api = await ref.read(socketApiProvider(user).future);
                    await api.refresh(force: true);
                  } catch (e, st) {
                    LogService.log(
                      'socket reconnect failed',
                      source: 'ConnectionStatusIcon',
                      originalError: e,
                      stackTrace: st,
                    );
                  }
                },
                icon: const Icon(Icons.refresh),
                text: l10n.retry,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
