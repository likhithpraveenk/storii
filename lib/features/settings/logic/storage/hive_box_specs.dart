import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/storage/hive/boxes.dart';

class HiveBoxSpec {
  new({
    required this.name,
    required this.label,
    required this.description,
    this.icon = Icons.storage,
    this.canReset = true,
  });

  final String name;
  final String label;
  final String description;
  final IconData icon;
  final bool canReset;
}

final hiveBoxSpecs = <HiveBoxSpec>[
  HiveBoxSpec(
    name: appSettingsBoxName,
    label: l10n.appSettings,
    description: l10n.appSettingsDescription,
    icon: Icons.tune,
    canReset: false,
  ),
  HiveBoxSpec(
    name: userSettingsBoxName,
    label: l10n.userSettings,
    description: l10n.userSettingsDescription,
    icon: Icons.person_outline,
    canReset: false,
  ),
  HiveBoxSpec(
    name: usersBoxName,
    label: l10n.userAccounts,
    description: l10n.userAccountsDescription,
    icon: Icons.group_outlined,
    canReset: false,
  ),
  HiveBoxSpec(
    name: serversBoxName,
    label: l10n.servers,
    description: l10n.serversDescription,
    icon: Icons.dns_outlined,
    canReset: false,
  ),
  HiveBoxSpec(
    name: downloadsBoxName,
    label: l10n.downloads,
    description: l10n.downloadsDescription,
    icon: Icons.download_outlined,
    canReset: false,
  ),
  HiveBoxSpec(
    name: downloadedItemsBoxName,
    label: l10n.downloadedItems,
    description: l10n.downloadedItemsDescription,
    icon: Icons.offline_bolt_outlined,
    canReset: false,
  ),
  HiveBoxSpec(
    name: itemsBoxName,
    label: 'Item cache (Deprecated)',
    description: 'Cache for migration. It will be deleted in a future version',
    icon: Icons.inventory_2_outlined,
  ),
  HiveBoxSpec(
    name: localSessionsBoxName,
    label: l10n.localSessions,
    description: l10n.localSessionsDescription,
    icon: Icons.sync_problem_outlined,
  ),
  HiveBoxSpec(
    name: userMediaProgressBoxName,
    label: l10n.mediaProgress,
    description: l10n.mediaProgressDescription,
    icon: Icons.timeline,
  ),
  HiveBoxSpec(
    name: playbackHistoryBoxName,
    label: l10n.playbackHistory,
    description: l10n.playbackHistoryDescription,
    icon: Icons.history,
  ),
  HiveBoxSpec(
    name: speedsBoxName,
    label: l10n.playbackSpeed,
    description: l10n.playbackSpeedsDescription,
    icon: Icons.speed,
  ),
  HiveBoxSpec(
    name: serverSettingsBoxName,
    label: l10n.serverConfig,
    description: l10n.serverConfigDescription,
    icon: Icons.settings_outlined,
  ),
  HiveBoxSpec(
    name: playbackQueueBoxName,
    label: l10n.playbackQueue,
    description: l10n.playbackQueueDescription,
    icon: Icons.queue_music_outlined,
  ),
  HiveBoxSpec(
    name: logsBoxName,
    label: l10n.logs,
    description: l10n.logsDescription,
    icon: Icons.receipt_long_outlined,
  ),
  HiveBoxSpec(
    name: autoDeleteExclusionBoxName,
    label: l10n.autoDeleteExclusion,
    description: l10n.autoDeleteExclusionDescription,
    icon: Icons.bookmark_remove_outlined,
  ),
  HiveBoxSpec(
    name: equalizerBoxName,
    label: l10n.equalizerPresets,
    description: l10n.equalizerPresetsDescription,
    icon: Icons.equalizer,
  ),
];
