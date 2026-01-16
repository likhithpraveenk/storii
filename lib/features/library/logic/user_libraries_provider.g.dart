// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_libraries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLibraries)
final userLibrariesProvider = UserLibrariesProvider._();

final class UserLibrariesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LibraryDomain>>,
          List<LibraryDomain>,
          FutureOr<List<LibraryDomain>>
        >
    with
        $FutureModifier<List<LibraryDomain>>,
        $FutureProvider<List<LibraryDomain>> {
  UserLibrariesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLibrariesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLibrariesHash();

  @$internal
  @override
  $FutureProviderElement<List<LibraryDomain>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LibraryDomain>> create(Ref ref) {
    return userLibraries(ref);
  }
}

String _$userLibrariesHash() => r'922d01aedafd78fcb70086d64338e56abe29684d';
