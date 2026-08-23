import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorConverter implements JsonConverter<Color, Map<String, dynamic>> {
  const ColorConverter();

  @override
  Color fromJson(Map<String, dynamic> json) => Color.from(
    alpha: (json['a'] as num).toDouble(),
    red: (json['r'] as num).toDouble(),
    green: (json['g'] as num).toDouble(),
    blue: (json['b'] as num).toDouble(),
  );

  @override
  Map<String, dynamic> toJson(Color object) => {
    'a': object.a,
    'r': object.r,
    'g': object.g,
    'b': object.b,
  };
}
