// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CacheSize)
final cacheSizeProvider = CacheSizeProvider._();

final class CacheSizeProvider
    extends $AsyncNotifierProvider<CacheSize, String> {
  CacheSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheSizeHash();

  @$internal
  @override
  CacheSize create() => CacheSize();
}

String _$cacheSizeHash() => r'4944e49cc276bc59e0d6e970d6a4e9350f77490f';

abstract class _$CacheSize extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
