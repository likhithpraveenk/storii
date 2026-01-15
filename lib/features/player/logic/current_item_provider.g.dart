// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentItemNotifier)
final currentItemProvider = CurrentItemNotifierProvider._();

final class CurrentItemNotifierProvider
    extends $StreamNotifierProvider<CurrentItemNotifier, LibraryItem?> {
  CurrentItemNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentItemNotifierHash();

  @$internal
  @override
  CurrentItemNotifier create() => CurrentItemNotifier();
}

String _$currentItemNotifierHash() =>
    r'c8f33761aeed78507308fa0a710f80f72d15beab';

abstract class _$CurrentItemNotifier extends $StreamNotifier<LibraryItem?> {
  Stream<LibraryItem?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LibraryItem?>, LibraryItem?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LibraryItem?>, LibraryItem?>,
              AsyncValue<LibraryItem?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
