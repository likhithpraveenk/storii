// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_window_consumer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sleepWindowConsumer)
final sleepWindowConsumerProvider = SleepWindowConsumerProvider._();

final class SleepWindowConsumerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  SleepWindowConsumerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepWindowConsumerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepWindowConsumerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return sleepWindowConsumer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sleepWindowConsumerHash() =>
    r'fe22d4a1ced83f80aa2ce02df7b7d15503d1ffb2';
