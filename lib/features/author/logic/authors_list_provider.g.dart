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
          Stream<List<Author>>
        >
    with $FutureModifier<List<Author>>, $StreamProvider<List<Author>> {
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
  $StreamProviderElement<List<Author>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Author>> create(Ref ref) {
    return authorsList(ref);
  }
}

String _$authorsListHash() => r'e75ba5e9a27b5f3c68cfe2102b4724498e622e16';
