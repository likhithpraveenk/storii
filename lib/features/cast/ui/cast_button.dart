import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/cast/logic/cast_controller.dart';
import 'package:storii/features/cast/logic/cast_devices.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/waveform.dart';

class CastButton extends ConsumerWidget {
  const CastButton({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cast = ref.watch(castControllerProvider);
    Future<void> openSheet() => showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(24)),
      ),
      builder: (_) => const SafeArea(child: _DevicePickerSheet()),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.castToDevice),
        leading: const Icon(Icons.cast),
        trailing: cast.isActive ? Text(l10n.active) : null,
        onTap: () {
          Navigator.of(context).pop();
          openSheet();
        },
      );
    }

    return IconButton(
      tooltip: l10n.castToDevice,
      onPressed: openSheet,
      icon: Icon(cast.isActive ? Icons.cast_connected : Icons.cast),
    );
  }
}

class _DevicePickerSheet extends ConsumerWidget {
  const _DevicePickerSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final devices = ref.watch(castDevicesProvider).value ?? [];
    final cast = ref.watch(castControllerProvider);
    final controller = ref.read(castControllerProvider.notifier);

    return DecoratedBox(
      decoration: bottomSheetDecoration(context),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Padding(
            padding: const .fromLTRB(16, 16, 16, 8),
            child: Stack(
              alignment: .center,
              children: [
                Align(
                  alignment: .center,
                  child: Text(
                    l10n.castToDevice,
                    style: bottomSheetTitleTextStyle(context),
                  ),
                ),
                Align(
                  alignment: .centerRight,
                  child: IconButton(
                    tooltip: l10n.refresh,
                    onPressed: () =>
                        ref.read(castDevicesProvider.notifier).refresh(),
                    icon: const Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          ),
          if (cast.status == .error && cast.error != null)
            Padding(
              padding: const .fromLTRB(24, 0, 24, 8),
              child: Text(
                cast.error!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
          if (devices.isEmpty)
            Padding(
              padding: const .symmetric(vertical: 32, horizontal: 24),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  const Center(child: RandomWaveform()),
                  const SizedBox(width: 12),
                  Text(
                    l10n.searchingForDevices,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              itemBuilder: (context, i) {
                final device = devices[i];
                final isConnected =
                    cast.device?.id == device.id && cast.isActive;
                final isConnecting = isConnected && cast.status == .connecting;

                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      isConnected ? Icons.cast_connected : Icons.speaker,
                    ),
                  ),
                  title: Text(device.name, maxLines: 2, overflow: .ellipsis),
                  subtitle: Text(
                    device.subtitle,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  trailing: isConnecting
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(),
                        )
                      : isConnected
                      ? Icon(
                          Icons.check_circle,
                          color: theme.colorScheme.primary,
                        )
                      : null,
                  onTap: () async {
                    await controller.createCastSession(device);
                    final state = ref.read(castControllerProvider);
                    if (context.mounted && state.status == .casting) {
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
            ),
          ),
          if (cast.isActive)
            Padding(
              padding: const .fromLTRB(24, 8, 24, 8),
              child: TextButton.icon(
                onPressed: controller.stop,
                icon: const Icon(Icons.stop_circle_outlined),
                label: Text(l10n.stop),
              ),
            ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
