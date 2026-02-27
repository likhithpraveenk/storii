// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthorsListNotifier)
final authorsListProvider = AuthorsListNotifierProvider._();

final class AuthorsListNotifierProvider
    extends $StreamNotifierProvider<AuthorsListNotifier, List<Author>> {
  AuthorsListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authorsListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authorsListNotifierHash();

  @$internal
  @override
  AuthorsListNotifier create() => AuthorsListNotifier();
}

String _$authorsListNotifierHash() =>
    r'bd6fe3334a6248277ac31660d3b8a80cd0b87569';

abstract class _$AuthorsListNotifier extends $StreamNotifier<List<Author>> {
  Stream<List<Author>> build();
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
