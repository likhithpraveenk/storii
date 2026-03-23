// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_sync_watcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListenTimeNotifier)
final listenTimeProvider = ListenTimeNotifierProvider._();

final class ListenTimeNotifierProvider
    extends $NotifierProvider<ListenTimeNotifier, void> {
  ListenTimeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listenTimeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listenTimeNotifierHash();

  @$internal
  @override
  ListenTimeNotifier create() => ListenTimeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$listenTimeNotifierHash() =>
    r'8d08ddeba9ab0004381f40b8e1a79aa4869c3f90';

abstract class _$ListenTimeNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(sessionSyncWatcher)
final sessionSyncWatcherProvider = SessionSyncWatcherProvider._();

final class SessionSyncWatcherProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  SessionSyncWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionSyncWatcherProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionSyncWatcherHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return sessionSyncWatcher(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sessionSyncWatcherHash() =>
    r'e3568675d889d45f58f696869363c217cdb2a7f6';
