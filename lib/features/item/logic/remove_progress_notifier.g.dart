// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoveProgressNotifier)
final removeProgressProvider = RemoveProgressNotifierProvider._();

final class RemoveProgressNotifierProvider
    extends $NotifierProvider<RemoveProgressNotifier, bool> {
  RemoveProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeProgressNotifierHash();

  @$internal
  @override
  RemoveProgressNotifier create() => RemoveProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$removeProgressNotifierHash() =>
    r'630ee52a7e05e5897173f4aa36ce7eeeef66aa05';

abstract class _$RemoveProgressNotifier extends $Notifier<bool> {
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
