import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';

extension SettingsCategoryReset on WidgetRef {
  Future<void> resetCategory(SettingsCategory category) async {
    switch (category) {
      case .library:
        await read(userSettingsProvider.notifier).resetLibrary();
      case .player:
        await read(userSettingsProvider.notifier).resetPlayer();
      case .appearance:
        await read(userSettingsProvider.notifier).resetAppearance();
        await read(appSettingsProvider.notifier).resetAppearance();
      case .customization:
        await read(userSettingsProvider.notifier).resetCustomization();
      case .advanced:
        await read(appSettingsProvider.notifier).resetAdvanced();
      case .downloads:
        await read(appSettingsProvider.notifier).resetDownloads();
    }
  }
}
