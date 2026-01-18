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
    extends $StreamNotifierProvider<AuthorsListNotifier, List<AuthorDomain>> {
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
    r'30e15ae16f3a0e2ac48abb00c8d30072a423cf84';

abstract class _$AuthorsListNotifier
    extends $StreamNotifier<List<AuthorDomain>> {
  Stream<List<AuthorDomain>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<AuthorDomain>>, List<AuthorDomain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<AuthorDomain>>, List<AuthorDomain>>,
              AsyncValue<List<AuthorDomain>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
