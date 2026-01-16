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
    extends
        $FunctionalProvider<
          AsyncValue<AuthorDomain>,
          AuthorDomain,
          FutureOr<AuthorDomain>
        >
    with $FutureModifier<AuthorDomain>, $FutureProvider<AuthorDomain> {
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
  $FutureProviderElement<AuthorDomain> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthorDomain> create(Ref ref) {
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

String _$authorHash() => r'd866ec50bdfab7bb9c61b60573ed0b97d5c297be';

final class AuthorFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AuthorDomain>, String> {
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
