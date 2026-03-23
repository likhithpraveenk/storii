import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';

part 'player_providers.g.dart';

enum PlayerSwipeDirection { left, right }

enum PlayerViewState { hidden, mini, full }

const velocityThreshold = 100.0;

@riverpod
class PlayerMode extends _$PlayerMode {
  @override
  PlayerViewState build() => .hidden;

  void toFull() => state = .full;
  void toMini() => state = .mini;
  void toHidden() => state = .hidden;

  PlayerViewState resolveAfterDrag(double velocityY) {
    final height = ref.read(playerHeightProvider);
    final bounds = ref.read(playerBoundsProvider);

    const closeThresholdFactor = 0.8;
    final closeThreshold = bounds.min * closeThresholdFactor;

    PlayerViewState target;

    if (velocityY.abs() > velocityThreshold) {
      if (velocityY < 0) {
        target = .full;
      } else {
        target = height < closeThreshold ? .hidden : .mini;
      }
    } else {
      final mid = (bounds.min + bounds.max) / 2;
      target = height > mid ? .full : .mini;
      if (height < closeThreshold) {
        target = .hidden;
      }
    }
    state = target;
    return target;
  }
}

@riverpod
class PlayerHeight extends _$PlayerHeight {
  @override
  double build() => 0.0;

  void set(double value) => state = value;

  void snapTo(PlayerViewState viewState) {
    final bounds = ref.read(playerBoundsProvider);
    state = switch (viewState) {
      .full => bounds.max,
      .mini => bounds.min,
      .hidden => 0.0,
    };
  }
}

@riverpod
class PlayerBounds extends _$PlayerBounds {
  @override
  ({double min, double max}) build() => (min: 0.0, max: 0.0);

  void update(double min, double max) => state = (min: min, max: max);
}

@riverpod
double playerExpandFactor(Ref ref) {
  final height = ref.watch(playerHeightProvider);
  final bounds = ref.watch(playerBoundsProvider);

  if (height <= bounds.min) return 0.0;
  return ((height - bounds.min) / (bounds.max - bounds.min)).clamp(0.0, 1.0);
}

@riverpod
PlayerViewState playerViewState(Ref ref) {
  final height = ref.watch(playerHeightProvider);
  final bounds = ref.watch(playerBoundsProvider);

  if (height <= kEpsilon) return .hidden;
  if ((height - bounds.max).abs() < kEpsilon) return .full;
  return .mini;
}
