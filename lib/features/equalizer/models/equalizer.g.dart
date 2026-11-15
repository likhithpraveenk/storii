// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EqualizerPreset _$EqualizerPresetFromJson(Map<String, dynamic> json) =>
    _EqualizerPreset(
      id: json['id'] as String,
      name: json['name'] as String,
      bands:
          (json['bands'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              $enumDecode(_$EqualizerFrequencyEnumMap, k),
              (e as num).toDouble(),
            ),
          ) ??
          const <EqualizerFrequency, double>{},
      builtIn: json['builtIn'] as bool? ?? false,
    );

Map<String, dynamic> _$EqualizerPresetToJson(_EqualizerPreset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bands': instance.bands.map(
        (k, e) => MapEntry(_$EqualizerFrequencyEnumMap[k]!, e),
      ),
      'builtIn': instance.builtIn,
    };

const _$EqualizerFrequencyEnumMap = {
  EqualizerFrequency.hz32: 'hz32',
  EqualizerFrequency.hz64: 'hz64',
  EqualizerFrequency.hz125: 'hz125',
  EqualizerFrequency.hz250: 'hz250',
  EqualizerFrequency.hz500: 'hz500',
  EqualizerFrequency.hz1k: 'hz1k',
  EqualizerFrequency.hz2k: 'hz2k',
  EqualizerFrequency.hz4k: 'hz4k',
  EqualizerFrequency.hz8k: 'hz8k',
  EqualizerFrequency.hz16k: 'hz16k',
};
