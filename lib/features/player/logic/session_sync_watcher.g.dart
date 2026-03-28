// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_sync_watcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'505b481200a656734b17dddbd7410a89eabec298';
