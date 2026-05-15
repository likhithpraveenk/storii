// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_background_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsBackground)
final isBackgroundProvider = IsBackgroundProvider._();

final class IsBackgroundProvider extends $NotifierProvider<IsBackground, bool> {
  IsBackgroundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isBackgroundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isBackgroundHash();

  @$internal
  @override
  IsBackground create() => IsBackground();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isBackgroundHash() => r'f46f1f3a863c1fd6f57ccfab2a46b1a76dc095c3';

abstract class _$IsBackground extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
