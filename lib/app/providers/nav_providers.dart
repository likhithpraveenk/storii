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
  }

  return userTargets;
}

@riverpod
List<NavTarget> remainingNavTargets(Ref ref) {
  final effective = ref.watch(effectiveNavTargetsProvider);
  final library = ref.watch(currentLibraryProvider);
  List<NavTarget> remaining;
  if (library?.mediaType == .podcast) {
    remaining = NavTarget.values
        .where((t) => !effective.contains(t))
        .where((t) => t != .series && t != .authors)
        .toList();
  } else {
    remaining = NavTarget.values.where((t) => !effective.contains(t)).toList();
  }

  return remaining;
}
