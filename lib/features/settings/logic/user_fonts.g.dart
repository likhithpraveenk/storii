// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fonts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userFonts)
final userFontsProvider = UserFontsProvider._();

final class UserFontsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  UserFontsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userFontsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userFontsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return userFonts(ref);
  }
}

String _$userFontsHash() => r'76d5c9d208da83357039a17b77a5feffa9534c22';
