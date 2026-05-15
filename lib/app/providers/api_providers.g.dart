// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiClient)
final apiClientProvider = ApiClientFamily._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._({
    required ApiClientFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'apiClientProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @override
  String toString() {
    return r'apiClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    final argument = this.argument as UserDomain;
    return apiClient(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ApiClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiClientHash() => r'3d1a99d3a8212024ac637d30342c51139574bfaa';

final class ApiClientFamily extends $Family
    with $FunctionalFamilyOverride<ApiClient, UserDomain> {
  ApiClientFamily._()
    : super(
        retry: null,
        name: r'apiClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ApiClientProvider call(UserDomain user) =>
      ApiClientProvider._(argument: user, from: this);

  @override
  String toString() => r'apiClientProvider';
}

@ProviderFor(authApi)
final authApiProvider = AuthApiFamily._();

final class AuthApiProvider
    extends $FunctionalProvider<AuthApi, AuthApi, AuthApi>
    with $Provider<AuthApi> {
  AuthApiProvider._({
    required AuthApiFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'authApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authApiHash();

  @override
  String toString() {
    return r'authApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AuthApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthApi create(Ref ref) {
    final argument = this.argument as Uri;
    return authApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authApiHash() => r'0256cef66c064bfdfdf72d44b580c7b939aeadf9';

final class AuthApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthApi, Uri> {
  AuthApiFamily._()
    : super(
        retry: null,
        name: r'authApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthApiProvider call(Uri baseUrl) =>
      AuthApiProvider._(argument: baseUrl, from: this);

  @override
  String toString() => r'authApiProvider';
}

@ProviderFor(serverApi)
final serverApiProvider = ServerApiFamily._();

final class ServerApiProvider
    extends $FunctionalProvider<ServerApi, ServerApi, ServerApi>
    with $Provider<ServerApi> {
  ServerApiProvider._({
    required ServerApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'serverApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverApiHash();

  @override
  String toString() {
    return r'serverApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return serverApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ServerApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverApiHash() => r'bd8ebcf804558d00e001ce73427354e9464abdb8';

final class ServerApiFamily extends $Family
    with $FunctionalFamilyOverride<ServerApi, UserDomain> {
  ServerApiFamily._()
    : super(
        retry: null,
        name: r'serverApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServerApiProvider call(UserDomain user) =>
      ServerApiProvider._(argument: user, from: this);

  @override
  String toString() => r'serverApiProvider';
}

@ProviderFor(libraryApi)
final libraryApiProvider = LibraryApiFamily._();

final class LibraryApiProvider
    extends $FunctionalProvider<LibraryApi, LibraryApi, LibraryApi>
    with $Provider<LibraryApi> {
  LibraryApiProvider._({
    required LibraryApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'libraryApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryApiHash();

  @override
  String toString() {
    return r'libraryApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LibraryApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LibraryApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return libraryApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryApiHash() => r'4bd9e875da24553a29ce719ca0ad367f93e29fe3';

final class LibraryApiFamily extends $Family
    with $FunctionalFamilyOverride<LibraryApi, UserDomain> {
  LibraryApiFamily._()
    : super(
        retry: null,
        name: r'libraryApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryApiProvider call(UserDomain user) =>
      LibraryApiProvider._(argument: user, from: this);

  @override
  String toString() => r'libraryApiProvider';
}

@ProviderFor(itemApi)
final itemApiProvider = ItemApiFamily._();

final class ItemApiProvider
    extends $FunctionalProvider<ItemApi, ItemApi, ItemApi>
    with $Provider<ItemApi> {
  ItemApiProvider._({
    required ItemApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'itemApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemApiHash();

  @override
  String toString() {
    return r'itemApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ItemApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return itemApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemApiHash() => r'5ce8187dd18e11c5eb560b37c4c7dffab21a5129';

final class ItemApiFamily extends $Family
    with $FunctionalFamilyOverride<ItemApi, UserDomain> {
  ItemApiFamily._()
    : super(
        retry: null,
        name: r'itemApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemApiProvider call(UserDomain user) =>
      ItemApiProvider._(argument: user, from: this);

  @override
  String toString() => r'itemApiProvider';
}

@ProviderFor(authorApi)
final authorApiProvider = AuthorApiFamily._();

final class AuthorApiProvider
    extends $FunctionalProvider<AuthorApi, AuthorApi, AuthorApi>
    with $Provider<AuthorApi> {
  AuthorApiProvider._({
    required AuthorApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'authorApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorApiHash();

  @override
  String toString() {
    return r'authorApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AuthorApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthorApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return authorApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthorApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthorApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorApiHash() => r'8cb243da4bda8e84b804a26c39864ddba42ebb9f';

final class AuthorApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthorApi, UserDomain> {
  AuthorApiFamily._()
    : super(
        retry: null,
        name: r'authorApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorApiProvider call(UserDomain user) =>
      AuthorApiProvider._(argument: user, from: this);

  @override
  String toString() => r'authorApiProvider';
}

@ProviderFor(meApi)
final meApiProvider = MeApiFamily._();

final class MeApiProvider extends $FunctionalProvider<MeApi, MeApi, MeApi>
    with $Provider<MeApi> {
  MeApiProvider._({
    required MeApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'meApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$meApiHash();

  @override
  String toString() {
    return r'meApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return meApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MeApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$meApiHash() => r'06902c1b406ac247da1c21001ecd197a8a0c9e0e';

final class MeApiFamily extends $Family
    with $FunctionalFamilyOverride<MeApi, UserDomain> {
  MeApiFamily._()
    : super(
        retry: null,
        name: r'meApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MeApiProvider call(UserDomain user) =>
      MeApiProvider._(argument: user, from: this);

  @override
  String toString() => r'meApiProvider';
}

@ProviderFor(sessionsApi)
final sessionsApiProvider = SessionsApiFamily._();

final class SessionsApiProvider
    extends $FunctionalProvider<SessionsApi, SessionsApi, SessionsApi>
    with $Provider<SessionsApi> {
  SessionsApiProvider._({
    required SessionsApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'sessionsApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionsApiHash();

  @override
  String toString() {
    return r'sessionsApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SessionsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionsApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return sessionsApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionsApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionsApiHash() => r'23a55f363bc614b327aab365693f2586ce1b5384';

final class SessionsApiFamily extends $Family
    with $FunctionalFamilyOverride<SessionsApi, UserDomain> {
  SessionsApiFamily._()
    : super(
        retry: null,
        name: r'sessionsApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionsApiProvider call(UserDomain user) =>
      SessionsApiProvider._(argument: user, from: this);

  @override
  String toString() => r'sessionsApiProvider';
}

@ProviderFor(socketApi)
final socketApiProvider = SocketApiFamily._();

final class SocketApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<SocketApi>,
          SocketApi,
          FutureOr<SocketApi>
        >
    with $FutureModifier<SocketApi>, $FutureProvider<SocketApi> {
  SocketApiProvider._({
    required SocketApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'socketApiProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$socketApiHash();

  @override
  String toString() {
    return r'socketApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SocketApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SocketApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return socketApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SocketApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$socketApiHash() => r'42d11336d6fd0cb00a175352b0641b4599998018';

final class SocketApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SocketApi>, UserDomain> {
  SocketApiFamily._()
    : super(
        retry: null,
        name: r'socketApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SocketApiProvider call(UserDomain user) =>
      SocketApiProvider._(argument: user, from: this);

  @override
  String toString() => r'socketApiProvider';
}
