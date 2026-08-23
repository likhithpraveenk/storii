import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/spoiler_text.dart';

class ConnectionStatusIcon extends ConsumerWidget {
  const ConnectionStatusIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketAsync = ref.watch(socketStatusProvider);
    final connectionType = ref.watch(connectionTypeProvider);

    final isConnected = socketAsync.value ?? false;
    final scheme = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: l10n.connectionStatus,
      icon: Icon(
        _leadingIcon(isConnected, connectionType),
        color: (!isConnected || connectionType == .none)
            ? scheme.error
            : scheme.primary,
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

  static IconData _leadingIcon(bool isConnected, ConnectionType type) {
    if (!isConnected) return Icons.cloud_off;
    return switch (type) {
      .wifi => Icons.wifi,
      .mobile => Icons.signal_cellular_alt,
      .ethernet => Icons.settings_ethernet,
      .none => Icons.wifi_off,
    };
  }
}

class _ConnectionDetailsSheet extends ConsumerWidget {
  const _ConnectionDetailsSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketAsync = ref.watch(socketStatusProvider);
    final connectionType = ref.watch(connectionTypeProvider);
    final user = ref.watch(currentUserProvider);

    final isConnected = socketAsync.value ?? false;
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleText = isConnected
        ? l10n.connectionServerConnected
        : l10n.connectionServerDisconnected;

    final subtitleText = isConnected
        ? l10n.connectionViaNetwork(connectionType.label)
        : l10n.connectionCantReachServer(connectionType.label);

    final statusColor = !isConnected || connectionType == .none
        ? scheme.error
        : scheme.primary;

    final serverStatus = user != null
        ? ref.watch(serverStatusProvider(user.serverUrl))
        : null;

    return Container(
      padding: const .fromLTRB(24, 32, 24, 48),
      decoration: bottomSheetDecoration(context),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Icon(
            ConnectionStatusIcon._leadingIcon(isConnected, connectionType),
            color: statusColor,
            size: 48,
          ),
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
                    user.serverUrl.toString(),
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
    );
  }
}
