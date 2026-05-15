import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'sync_interval_provider.g.dart';

@riverpod
Duration networkAwareSyncInterval(Ref ref) {
  final connectionType = ref.watch(connectionTypeProvider);
  final syncInterval = ref.watch(syncIntervalProvider);
  final syncIntervalMobile = syncInterval.inSeconds > 60
      ? syncInterval
      : const Duration(seconds: 60);

  return switch (connectionType) {
    .mobile => syncIntervalMobile,
    _ => syncInterval,
  };
}
