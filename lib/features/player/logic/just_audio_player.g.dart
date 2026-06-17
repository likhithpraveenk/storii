// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'just_audio_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(justAudioPlayer)
final justAudioPlayerProvider = JustAudioPlayerProvider._();

final class JustAudioPlayerProvider
    extends $FunctionalProvider<AppAudioPlayer, AppAudioPlayer, AppAudioPlayer>
    with $Provider<AppAudioPlayer> {
  JustAudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'justAudioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$justAudioPlayerHash();

  @$internal
  @override
  $ProviderElement<AppAudioPlayer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppAudioPlayer create(Ref ref) {
    return justAudioPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppAudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppAudioPlayer>(value),
    );
  }
}

String _$justAudioPlayerHash() => r'48427c33a4dca830d46d0ae19f5f40502ad8cd76';
