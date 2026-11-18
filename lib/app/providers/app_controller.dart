import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/deep_link_controller.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/logic/download_auto_delete.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/downloaded_items_migration.dart';
import 'package:storii/features/equalizer/logic/equalizer_controller.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/more/logic/changelog_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/logic/session_sync_watcher.dart';
import 'package:storii/features/player/logic/sleep_window_consumer.dart';
import 'package:storii/features/settings/logic/theme_provider.dart';
import 'package:storii/features/widget/logic/widget_controller.dart';
import 'package:storii/features/widget/logic/widget_play_controller.dart';

part 'app_controller.g.dart';

@Riverpod(keepAlive: true)
void appController(Ref ref) {
  void keepAlive(ProviderListenable<Object?> p) => ref.listen(p, (_, _) {});

  keepAlive(downloadedItemsMigrationProvider);
  keepAlive(downloadQueueProvider);
  keepAlive(widgetControllerProvider);
  keepAlive(widgetPlayControllerProvider);
  keepAlive(deepLinkControllerProvider);
  keepAlive(librarySyncControllerProvider);
  keepAlive(playerStateWatcherProvider);
  keepAlive(sessionSyncWatcherProvider);
  keepAlive(audioSettingsWatcherProvider);
  keepAlive(queueControllerProvider);
  keepAlive(appStartThemeUpdateProvider);
  keepAlive(mediaProgressSyncControllerProvider);
  keepAlive(sleepWindowConsumerProvider);
  keepAlive(whatsNewControllerProvider);
  keepAlive(downloadAutoDeleteWatcherProvider);
  keepAlive(equalizerControllerProvider);
}
