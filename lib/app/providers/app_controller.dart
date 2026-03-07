import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_sync_watcher.dart';

part 'app_controller.g.dart';

@riverpod
void appController(Ref ref) {
  ref.watch(librarySyncControllerProvider);
  ref.watch(playerStateWatcherProvider);
  ref.watch(sessionSyncWatcherProvider);
  ref.watch(audioSettingsWatcherProvider);
}
