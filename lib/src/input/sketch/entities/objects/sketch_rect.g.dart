// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_rect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SketchRect _$SketchRectFromJson(Map<String, dynamic> json) => SketchRect(
      classField: json['_class'] as String?,
      constrainProportions: json['constrainProportions'] as bool?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SketchRectToJson(SketchRect instance) =>
    <String, dynamic>{
      '_class': instance.classField,
      'constrainProportions': instance.constrainProportions,
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
    };
