// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_shake_consumer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SleepShakeConsumerNotifier)
final sleepShakeConsumerProvider = SleepShakeConsumerNotifierProvider._();

final class SleepShakeConsumerNotifierProvider
    extends $NotifierProvider<SleepShakeConsumerNotifier, void> {
  SleepShakeConsumerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepShakeConsumerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepShakeConsumerNotifierHash();

  @$internal
  @override
  SleepShakeConsumerNotifier create() => SleepShakeConsumerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sleepShakeConsumerNotifierHash() =>
    r'ea546d9dd8a9980d2e27b3d866fcf095247593c9';

abstract class _$SleepShakeConsumerNotifier extends $Notifier<void> {
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
