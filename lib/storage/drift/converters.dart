import 'dart:convert';
import 'dart:ui';

import 'package:drift/drift.dart';

class UriConverter extends TypeConverter<Uri, String> {
  const UriConverter();
  @override
  Uri fromSql(String fromDb) => Uri.parse(fromDb);
  @override
  String toSql(Uri value) => value.toString();
}

class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();
  @override
  List<T> fromSql(String fromDb) =>
      (json.decode(fromDb) as List<dynamic>).cast<T>();
  @override
  String toSql(List<T> value) => json.encode(value);
}

class DurationConverter extends TypeConverter<Duration, int> {
  const DurationConverter();
  @override
  Duration fromSql(int fromDb) => Duration(microseconds: fromDb);
  @override
  int toSql(Duration value) => value.inMicroseconds;
}

class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();
  @override
  Color fromSql(int fromDb) => Color(fromDb);
  @override
  int toSql(Color value) => value.toARGB32();
}

class JsonConverter<T> extends TypeConverter<T, String> {
  final T Function(Map<String, dynamic> json) fromJson;

  const JsonConverter({required this.fromJson});

  @override
  T fromSql(String fromDb) =>
      fromJson(json.decode(fromDb) as Map<String, dynamic>);

  @override
  String toSql(T value) => json.encode(value);
}

class JsonListConverter<T> extends TypeConverter<List<T>, String> {
  final T Function(Map<String, dynamic> json) fromJson;

  const JsonListConverter({required this.fromJson});

  @override
  List<T> fromSql(String fromDb) {
    final list = json.decode(fromDb) as List<dynamic>;
    return list.cast<Map<String, dynamic>>().map(fromJson).toList();
  }

  @override
  String toSql(List<T> value) => json.encode(value);
}
