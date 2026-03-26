import 'package:json_annotation/json_annotation.dart';
import 'package:storii/abs_api/models/extensions.dart';
import 'package:storii/abs_api/models/filter.dart';

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

class FilterConverter implements JsonConverter<Filter?, String?> {
  const FilterConverter();

  @override
  Filter? fromJson(String? json) => json != null ? Filter.parse(json) : null;

  @override
  String? toJson(Filter? filter) => filter?.toString();
}

Object? readDuration(Map json, String key) {
  final value = json[key];
  if (value is num) return value;
  return num.tryParse(value);
}

Object? readSeries(Map json, String key) {
  final value = json[key];
  if (value is Map) return [value];
  return value;
}

Object? readBooksOrItems(Map json, String key) {
  return json['books'] ?? json['items'];
}

Object? readLibraryItemList(Map json, String key) {
  final list = json[key] as List<dynamic>?;
  return list?.map((e) => e['libraryItem']).toList();
}

Object? readSeriesWithBooks(Map json, String key) {
  final list = json[key] as List<dynamic>?;
  if (list == null) return null;

  return list.map((item) {
    final seriesMap = item['series'] as Map<String, dynamic>;
    final booksList = item['books'] as List<dynamic>?;
    return {...seriesMap, 'books': booksList};
  }).toList();
}
