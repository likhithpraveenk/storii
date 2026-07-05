import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'nav_providers.g.dart';

@riverpod
List<NavTarget> effectiveNavTargets(Ref ref) {
  final userTargets = ref.watch(navTargetsProvider);
  final library = ref.watch(currentLibraryProvider);

  if (library?.mediaType == .podcast) {
    return userTargets.where((t) => t != .series && t != .authors).toList();
  } else {
    return userTargets.where((t) => t != .latest).toList();
  }
}

@riverpod
List<NavTarget> remainingNavTargets(Ref ref) {
  final effective = ref.watch(effectiveNavTargetsProvider);
  final library = ref.watch(currentLibraryProvider);

  final remaining = NavTarget.values.where((t) => !effective.contains(t));

  if (library?.mediaType == .podcast) {
    return remaining.where((t) => t != .series && t != .authors).toList();
  } else {
    return remaining.where((t) => t != .latest).toList();
  }
}
