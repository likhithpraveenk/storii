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

String _$isBackgroundHash() => r'414a2ba1de6079f4252d4e0b81f72332a3b38508';

abstract class _$IsBackground extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
