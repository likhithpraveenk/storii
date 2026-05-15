import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

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
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l10n.connectionStatus,
          body: const _ConnectionDetailsSheet(),
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

    return Padding(
      padding: const .fromLTRB(24, 0, 24, 32),
      child: Row(
        mainAxisSize: .min,
        mainAxisAlignment: .spaceEvenly,
        children: [
          Icon(
            ConnectionStatusIcon._leadingIcon(isConnected, connectionType),
            color: statusColor,
            size: 48,
          ),
          Column(
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
              // TODO: add server details
            ],
          ),
        ],
      ),
    );
  }
}
