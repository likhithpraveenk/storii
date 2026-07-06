// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SleepTimer)
final sleepTimerProvider = SleepTimerProvider._();

final class SleepTimerProvider
    extends $NotifierProvider<SleepTimer, Duration?> {
  SleepTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimerHash();

  @$internal
  @override
  SleepTimer create() => SleepTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration?>(value),
    );
  }
}

String _$sleepTimerHash() => r'72f26c3fd3c39d9cb3e0448a472f9aedb279f68a';

abstract class _$SleepTimer extends $Notifier<Duration?> {
  Duration? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Duration?, Duration?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Duration?, Duration?>,
              Duration?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
