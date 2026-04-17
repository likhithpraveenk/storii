import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/l10n/l10n.dart';

class ConnectionInfoTile extends ConsumerWidget {
  const ConnectionInfoTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final socketAsync = ref.watch(socketStatusProvider);
    final connectionType = ref.watch(connectionTypeProvider);

    final isConnected = socketAsync.value ?? false;
    final isLoading =
        socketAsync.isLoading ||
        socketAsync is AsyncLoading ||
        (!socketAsync.hasValue && !socketAsync.hasError);

    final titleText = isLoading
        ? l.connectionChecking
        : (isConnected
              ? l.connectionServerConnected
              : l.connectionServerDisconnected);

    final networkTypeStr = switch (connectionType) {
      .wifi => l.connectionTypeWifi,
      .mobile => l.connectionTypeMobile,
      .ethernet => l.connectionTypeEthernet,
      .none => l.connectionTypeNone,
    };

    final subtitleText = isLoading
        ? l.connectionPleaseWait
        : (isConnected
              ? l.connectionViaNetwork(networkTypeStr)
              : l.connectionCantReachServer(networkTypeStr));

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
