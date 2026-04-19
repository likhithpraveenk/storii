import 'package:abs_api/src/endpoints/api_exception.dart';

List<T> listFromJson<T>(
  dynamic json,
  T Function(Map<String, dynamic> tJson) tFromJson,
) {
  if (json is List<dynamic>) {
    return json.whereType<Map<String, dynamic>>().map(tFromJson).toList();
  } else if (json is Map<String, dynamic>) {
    return [tFromJson(json)];
  }
  throw UnsupportedJsonException(
    'listFromJson: Unsupported JSON type: ${json.runtimeType}',
  );
}

List<T> listFromJsonKey<T>(
  dynamic json,
  String key,
  T Function(Map<String, dynamic> tJson) tFromJson,
) {
  if (json is Map<String, dynamic>) {
    final value = json[key];
    if (value != null) {
      return listFromJson(value, tFromJson);
    }
    throw UnsupportedJsonException(
      'listFromJsonKey: key $key does not exist in given JSON',
    );
  }
  throw UnsupportedJsonException(
    'listFromJsonKey: Unsupported JSON type: ${json.runtimeType}',
  );
}

T fromJson<T>(dynamic json, T Function(Map<String, dynamic> tJson) tFromJson) {
  if (json is Map<String, dynamic>) {
    return tFromJson(json);
  } else if (json is List<dynamic>) {
    return tFromJson(json.whereType<Map<String, dynamic>>().first);
  }
  throw UnsupportedJsonException(
    'fromJson: Unsupported JSON type: ${json.runtimeType}',
  );
}

T fromJsonKey<T>(dynamic json, String key) {
  if (json is Map<String, dynamic>) {
    final value = json[key];
    if (value != null) return value;
    throw UnsupportedJsonException(
      'fromJsonKey: key $key does not exist in given JSON',
    );
  }
  throw UnsupportedJsonException(
    'fromJsonKey: Unsupported JSON type: ${json.runtimeType}',
  );
}

T fromJsonT<T, S>(
  dynamic json,
  T Function(Map<String, dynamic> tJson, S Function(Object? sJson)) tFromJson,
  S Function(Map<String, dynamic> sJson) sFromJson,
) {
  return fromJson(json, (tJson) {
    return tFromJson(tJson, (sJson) {
      if (sJson is Map<String, dynamic>) {
        return sFromJson(sJson);
      }
      throw UnsupportedJsonException(
        'fromJsonT: inner JSON unsupported, type: ${sJson.runtimeType}',
      );
    });
  });
}

class UnsupportedJsonException extends ApiException {
  UnsupportedJsonException(super.message);
}

extension JsonRemoveDefaults on Map<String, dynamic> {
  Map<String, dynamic>? removeDefaults(Map<String, Object?> defaults) {
    removeWhere(
      (key, value) => defaults.containsKey(key) && value == defaults[key],
    );
    return nullIfEmpty;
  }

  Map<String, dynamic>? get nullIfEmpty => isNotEmpty ? this : null;
}
