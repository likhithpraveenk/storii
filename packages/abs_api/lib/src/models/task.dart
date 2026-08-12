import 'package:abs_api/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
sealed class Task with _$Task {
  @DateTimeEpochConverter()
  const factory Task({
    String? id,
    String? action,
    TaskData? data,
    String? title,
    List<String>? titleSubs,
    String? description,
    List<String>? descriptionSubs,
    String? error,
    List<String>? errorSubs,
    @Default(false) bool showSuccess,
    @Default(false) bool isFailed,
    @Default(false) bool isFinished,
    DateTime? startedAt,
    DateTime? finishedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
sealed class TaskData with _$TaskData {
  const factory TaskData({
    String? libraryId,
    String? libraryName,
    MediaType? libraryMediaType,
    TaskScanResults? scanResults,
  }) = _TaskData;

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
}

@freezed
sealed class TaskScanResults with _$TaskScanResults {
  const factory TaskScanResults({
    int? added,
    int? updated,
    int? missing,
    int? elapsed,
    String? text,
  }) = _TaskScanResults;

  factory TaskScanResults.fromJson(Map<String, dynamic> json) =>
      _$TaskScanResultsFromJson(json);
}
