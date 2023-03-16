// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_boolean_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooleanProperty _$BooleanPropertyFromJson(Map<String, dynamic> json) {
  return BooleanProperty(
    defaultValue: json['defaultValue'],
    preferredValues: (json['preferredValues'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSwapPreferredValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    propertyName: json['propertyName'] as String,
    type: json['type'],
    value: json['value'],
    variantOptions:
        (json['variantOptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BooleanPropertyToJson(BooleanProperty instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'preferredValues': instance.preferredValues,
      'propertyName': instance.propertyName,
      'type': _$ComponentPropertyTypeEnumMap[instance.type],
      'value': instance.value,
      'variantOptions': instance.variantOptions,
    };

const _$ComponentPropertyTypeEnumMap = {
  ComponentPropertyType.BOOLEAN: 'BOOLEAN',
  ComponentPropertyType.TEXT: 'TEXT',
  ComponentPropertyType.INSTANCE_SWAP: 'INSTANCE_SWAP',
  ComponentPropertyType.VARIANT: 'VARIANT',
};