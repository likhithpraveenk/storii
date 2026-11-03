// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_sync_watcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionSyncWatcher)
final sessionSyncWatcherProvider = SessionSyncWatcherProvider._();

final class SessionSyncWatcherProvider
    extends $NotifierProvider<SessionSyncWatcher, void> {
  SessionSyncWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionSyncWatcherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionSyncWatcherHash();

  @$internal
  @override
  SessionSyncWatcher create() => SessionSyncWatcher();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sessionSyncWatcherHash() =>
    r'10dc37d20d35c0fc21b91f19366777b0b9d21b98';

abstract class _$SessionSyncWatcher extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
