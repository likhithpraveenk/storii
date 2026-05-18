// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_interval_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkAwareSyncInterval)
final networkAwareSyncIntervalProvider = NetworkAwareSyncIntervalProvider._();

final class NetworkAwareSyncIntervalProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  NetworkAwareSyncIntervalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkAwareSyncIntervalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkAwareSyncIntervalHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return networkAwareSyncInterval(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$networkAwareSyncIntervalHash() =>
    r'35e01bc8bedb05161cdc61c420b1136dd7dd3dad';
