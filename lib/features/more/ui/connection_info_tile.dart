import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/connection_providers.dart';

class ConnectionInfoTile extends ConsumerWidget {
  const ConnectionInfoTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketAsync = ref.watch(socketStatusProvider);
    final connectionType = ref.watch(connectionTypeProvider);

    final isConnected = socketAsync.value ?? false;
    final isLoading =
        socketAsync.isLoading ||
        socketAsync is AsyncLoading ||
        (!socketAsync.hasValue && !socketAsync.hasError);

    final titleText = isLoading
        ? l10n.connectionChecking
        : (isConnected
              ? l10n.connectionServerConnected
              : l10n.connectionServerDisconnected);

    final networkTypeStr = switch (connectionType) {
      .wifi => l10n.connectionTypeWifi,
      .mobile => l10n.connectionTypeMobile,
      .ethernet => l10n.connectionTypeEthernet,
      .none => l10n.connectionTypeNone,
    };

    final subtitleText = isLoading
        ? l10n.connectionPleaseWait
        : (isConnected
              ? l10n.connectionViaNetwork(networkTypeStr)
              : l10n.connectionCantReachServer(networkTypeStr));

    final leadingIcon = isLoading
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Icon(
            !isConnected
                ? Icons.cloud_off
                : switch (connectionType) {
                    .wifi => Icons.wifi,
                    .mobile => Icons.signal_cellular_alt,
                    .ethernet => Icons.settings_ethernet,
                    .none => Icons.wifi_off,
                  },
            color: !isConnected || connectionType == .none
                ? appRedColor
                : appGreenColor,
            size: 24,
          );

    final trailingWidget = isConnected
        ? const Icon(Icons.check_circle, color: appGreenColor, size: 20)
        : (isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.error, color: appRedColor, size: 20));

    return ListTile(
      leading: leadingIcon,
      title: Text(titleText),
      subtitle: Text(subtitleText),
      trailing: trailingWidget,
      onTap: () {
        //* more server info?
      },
    );
  }
}
