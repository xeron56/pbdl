// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderOptions _$BorderOptionsFromJson(Map<String, dynamic> json) =>
    BorderOptions(
      json['_class'] as String?,
      json['dashPattern'] as List<dynamic>?,
      json['isEnabled'] as bool?,
      json['lineCapStyle'] as int?,
      json['lineJoinStyle'] as String?,
    );

Map<String, dynamic> _$BorderOptionsToJson(BorderOptions instance) =>
    <String, dynamic>{
      '_class': instance.classField,
      'isEnabled': instance.isEnabled,
      'dashPattern': instance.dashPattern,
      'lineCapStyle': instance.lineCapStyle,
      'lineJoinStyle': instance.lineJoinStyle,
    };
