import 'package:json_annotation/json_annotation.dart';
import 'package:storii/api/models/utils/extensions.dart';
import 'package:storii/api/models/utils/filter.dart';
import 'package:storii/api/models/utils/sort.dart';
import 'package:storii/shared/helpers/extensions.dart';

const _converters = <JsonConverter<dynamic, dynamic>>[
  DateTimeEpochConverter(),
  DurationPreciseSecondsConverter(),
];

const requestToJson = JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  converters: _converters,
);

const requestToJsonRemoveNull = JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
  converters: _converters,
);

class BoolBinaryConverter implements JsonConverter<bool, int> {
  const BoolBinaryConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}

class DateTimeEpochConverter implements JsonConverter<DateTime, int> {
  const DateTimeEpochConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

class DurationPreciseSecondsConverter implements JsonConverter<Duration, num> {
  const DurationPreciseSecondsConverter();

  @override
  Duration fromJson(num json) =>
      PreciseDuration.fromPreciseSeconds(json.toDouble());

  @override
  num toJson(Duration object) => object.inPreciseSeconds;
}

class DurationMsConverter implements JsonConverter<Duration, int> {
  const DurationMsConverter();

  @override
  Duration fromJson(int json) => Duration(milliseconds: json);

  @override
  int toJson(Duration object) => object.inMilliseconds;
}

class DurationSecConverter implements JsonConverter<Duration, int> {
  const DurationSecConverter();

  @override
  Duration fromJson(int json) => Duration(seconds: json);

  @override
  int toJson(Duration object) => object.inSeconds;
}

class DurationMinConverter implements JsonConverter<Duration, int> {
  const DurationMinConverter();

  @override
  Duration fromJson(int json) => Duration(minutes: json);

  @override
  int toJson(Duration object) => object.inMinutes;
}

class FilterConverter implements JsonConverter<Filter, String> {
  const FilterConverter();

  @override
  Filter fromJson(String json) => Filter.parse(json);

  @override
  String toJson(Filter filter) => filter.toString();
}

class SortConverter implements JsonConverter<LibraryItemSort?, String?> {
  const SortConverter();

  @override
  LibraryItemSort? fromJson(String? json) =>
      LibraryItemSort.values.firstWhereOrNull((e) => e.value == json);

  @override
  String? toJson(LibraryItemSort? sort) => sort?.value;
}

Object? readSeries(Map json, String key) {
  final value = json[key];
  if (value is Map) return [value];
  return value;
}
