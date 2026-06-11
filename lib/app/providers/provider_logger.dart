import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final class ProviderLogger extends ProviderObserver {
  const ProviderLogger();

  static const _noisy = {
    'globalPositionProvider',
    'chapterPositionProvider',
    'playbackStateProvider',
    'processingStateProvider',
    'coverUrlProvider',
    'downloadItemProvider',
  };

  String _name(ProviderObserverContext ctx) =>
      ctx.provider.name ?? ctx.provider.runtimeType.toString();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    final name = _name(context);
    if (_noisy.contains(name)) return;
    log('[+] $name $value', name: 'Riverpod');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final name = _name(context);
    if (_noisy.contains(name)) return;
    log('[~] $name $newValue', name: 'Riverpod');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    final name = _name(context);
    if (_noisy.contains(name)) return;
    log('[-] $name', name: 'Riverpod');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    log(
      '[!] ${_name(context)}: $error',
      name: 'Riverpod',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
