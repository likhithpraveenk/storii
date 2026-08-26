import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_state.freezed.dart';
part 'queue_state.g.dart';

@freezed
sealed class QueueItem with _$QueueItem {
  const factory({required String itemId, String? episodeId}) = _QueueItem;
  factory fromJson(Map<String, dynamic> json) => _$QueueItemFromJson(json);
}

@freezed
sealed class QueueState with _$QueueState {
  const factory({@Default([]) List<QueueItem> items, int? currentIndex}) =
      _QueueState;

  factory fromJson(Map<String, dynamic> json) => _$QueueStateFromJson(json);
}
