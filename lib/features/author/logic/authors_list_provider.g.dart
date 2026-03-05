// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authorsList)
final authorsListProvider = AuthorsListProvider._();

final class AuthorsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Author>>,
          List<Author>,
          FutureOr<List<Author>>
        >
    with $FutureModifier<List<Author>>, $FutureProvider<List<Author>> {
  AuthorsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authorsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authorsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Author>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Author>> create(Ref ref) {
    return authorsList(ref);
  }
}

String _$authorsListHash() => r'5ee2d2faaf93470d3a20ad9299ecbed831fabcaf';
