import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/logic/session_sync_watcher.dart';
import 'package:storii/features/settings/logic/theme_provider.dart';

part 'app_controller.g.dart';

@riverpod
void appController(Ref ref) {
  ref
    ..watch(librarySyncControllerProvider)
    ..watch(playerStateWatcherProvider)
    ..watch(sessionSyncWatcherProvider)
    ..watch(audioSettingsWatcherProvider)
    ..watch(queueControllerProvider)
    ..watch(appStartThemeUpdateProvider)
    ..watch(mediaProgressSyncControllerProvider);
}
