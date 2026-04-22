import 'package:abs_api/src/models/extensions.dart';
import 'package:abs_api/src/models/filter.dart';
import 'package:json_annotation/json_annotation.dart';

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

class DurationPreciseSecondsConverter
    implements JsonConverter<Duration, Object> {
  const DurationPreciseSecondsConverter();

  @override
  Duration fromJson(Object json) {
    final num value = switch (json) {
      final num n => n,
      final String s => num.parse(s),
      _ => throw FormatException(
        'Expected num or String for Duration, got ${json.runtimeType}',
      ),
    };
    return PreciseDuration.fromPreciseSeconds(value.toDouble());
  }

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
