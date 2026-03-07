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

String _$apiClientHash() => r'20ddfb421f057f5ef37f578c59cee89d7932bf97';

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
         isAutoDispose: false,
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

String _$serverApiHash() => r'74fc036dcd617bb5c9d388375448dca4fc33aaad';

final class ServerApiFamily extends $Family
    with $FunctionalFamilyOverride<ServerApi, UserDomain> {
  ServerApiFamily._()
    : super(
        retry: null,
        name: r'serverApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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
         isAutoDispose: false,
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

String _$libraryApiHash() => r'74ac2fa849095d406f54b4afe4b416d57611f767';

final class LibraryApiFamily extends $Family
    with $FunctionalFamilyOverride<LibraryApi, UserDomain> {
  LibraryApiFamily._()
    : super(
        retry: null,
        name: r'libraryApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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
         isAutoDispose: false,
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

String _$itemApiHash() => r'd054bf2cab1918995ecd40fbb99a193690583744';

final class ItemApiFamily extends $Family
    with $FunctionalFamilyOverride<ItemApi, UserDomain> {
  ItemApiFamily._()
    : super(
        retry: null,
        name: r'itemApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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
         isAutoDispose: false,
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

String _$authorApiHash() => r'c64c6a14bf160c9571d050aafb4688ce1c95d2d4';

final class AuthorApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthorApi, UserDomain> {
  AuthorApiFamily._()
    : super(
        retry: null,
        name: r'authorApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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
         isAutoDispose: false,
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

String _$meApiHash() => r'9866bf41ab3d901c65134ea6064e768cc9fb0dfd';

final class MeApiFamily extends $Family
    with $FunctionalFamilyOverride<MeApi, UserDomain> {
  MeApiFamily._()
    : super(
        retry: null,
        name: r'meApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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
         isAutoDispose: false,
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

String _$sessionsApiHash() => r'b9ceb2e72ac399fbbdbaccbb59dd296e23621746';

final class SessionsApiFamily extends $Family
    with $FunctionalFamilyOverride<SessionsApi, UserDomain> {
  SessionsApiFamily._()
    : super(
        retry: null,
        name: r'sessionsApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
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

String _$socketApiHash() => r'bf44444c6d713539bb6dd45eff31d24507a3e8f1';

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
