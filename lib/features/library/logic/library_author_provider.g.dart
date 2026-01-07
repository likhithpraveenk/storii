// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_author_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryAuthorNotifier)
final libraryAuthorProvider = LibraryAuthorNotifierProvider._();

final class LibraryAuthorNotifierProvider
    extends $AsyncNotifierProvider<LibraryAuthorNotifier, List<Author>> {
  LibraryAuthorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryAuthorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryAuthorNotifierHash();

  @$internal
  @override
  LibraryAuthorNotifier create() => LibraryAuthorNotifier();
}

String _$libraryAuthorNotifierHash() =>
    r'f8931205af80f8588c184655b79b2d4b946af481';

abstract class _$LibraryAuthorNotifier extends $AsyncNotifier<List<Author>> {
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
