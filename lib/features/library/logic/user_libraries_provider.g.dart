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
          AsyncValue<List<Library>>,
          List<Library>,
          FutureOr<List<Library>>
        >
    with $FutureModifier<List<Library>>, $FutureProvider<List<Library>> {
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
  $FutureProviderElement<List<Library>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Library>> create(Ref ref) {
    return userLibraries(ref);
  }
}

String _$userLibrariesHash() => r'2a2100ed162bbee14a8dc8f98b7b70bbf4e557a5';
