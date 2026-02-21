import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_providers.g.dart';

enum PlayerSwipeDirection { left, right }

enum PlayerViewState { hidden, mini, full }

const double velocityThreshold = 100;
const double epsilon = 0.5;

@riverpod
class PlayerController extends _$PlayerController {
  @override
  PlayerViewState build() {
    return .hidden;
  }

  void toFull() {
    state = .full;
  }

  void toMini() {
    state = .mini;
  }

  void toHidden() {
    state = .hidden;
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

  if (height <= epsilon) return .hidden;
  if ((height - bounds.max).abs() < epsilon) return .full;
  return .mini;
}
