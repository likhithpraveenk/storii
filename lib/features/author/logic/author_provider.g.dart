// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(author)
final authorProvider = AuthorFamily._();

final class AuthorProvider
    extends $FunctionalProvider<AsyncValue<Author>, Author, FutureOr<Author>>
    with $FutureModifier<Author>, $FutureProvider<Author> {
  AuthorProvider._({
    required AuthorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'authorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorHash();

  @override
  String toString() {
    return r'authorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Author> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Author> create(Ref ref) {
    final argument = this.argument as String;
    return author(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorHash() => r'b16759e9f4955369eed541d53c84525637bc6ae9';

final class AuthorFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Author>, String> {
  AuthorFamily._()
    : super(
        retry: null,
        name: r'authorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorProvider call(String authorId) =>
      AuthorProvider._(argument: authorId, from: this);

  @override
  String toString() => r'authorProvider';
}
