// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_authors_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryAuthorsNotifier)
final libraryAuthorsProvider = LibraryAuthorsNotifierProvider._();

final class LibraryAuthorsNotifierProvider
    extends $AsyncNotifierProvider<LibraryAuthorsNotifier, List<Author>> {
  LibraryAuthorsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryAuthorsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryAuthorsNotifierHash();

  @$internal
  @override
  LibraryAuthorsNotifier create() => LibraryAuthorsNotifier();
}

String _$libraryAuthorsNotifierHash() =>
    r'74dce6aac4e6f3ebbfc092f89e3d3504642866dc';

abstract class _$LibraryAuthorsNotifier extends $AsyncNotifier<List<Author>> {
  FutureOr<List<Author>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Author>>, List<Author>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Author>>, List<Author>>,
              AsyncValue<List<Author>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
