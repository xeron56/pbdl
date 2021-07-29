// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLTextStyle _$PBDLTextStyleFromJson(Map<String, dynamic> json) {
  return PBDLTextStyle(
    fontColor: json['fontColor'] == null
        ? null
        : PBDLColor.fromJson(json['fontColor'] as Map<String, dynamic>),
    weight: json['weight'] as String,
    paragraphStyle: json['paragraphStyle'] == null
        ? null
        : PBDLParagraphStyle.fromJson(
            json['paragraphStyle'] as Map<String, dynamic>),
    fontDescriptor: json['fontDescriptor'] == null
        ? null
        : PBDLFontDescriptor.fromJson(
            json['fontDescriptor'] as Map<String, dynamic>),
  )
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) =>
    <String, dynamic>{
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'fontColor': instance.fontColor?.toJson(),
      'weight': instance.weight,
      'fontDescriptor': instance.fontDescriptor?.toJson(),
      'paragraphStyle': instance.paragraphStyle?.toJson(),
      'type': instance.type,
    };