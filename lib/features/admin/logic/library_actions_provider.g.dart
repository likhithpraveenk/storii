// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanLibrary)
final scanLibraryProvider = ScanLibraryProvider._();

final class ScanLibraryProvider
    extends $AsyncNotifierProvider<ScanLibrary, Set<String>> {
  ScanLibraryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanLibraryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanLibraryHash();

  @$internal
  @override
  ScanLibrary create() => ScanLibrary();
}

String _$scanLibraryHash() => r'c50d87c7cab16ba92c3e41ffec8ede29272abaa7';

abstract class _$ScanLibrary extends $AsyncNotifier<Set<String>> {
  FutureOr<Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
              AsyncValue<Set<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
