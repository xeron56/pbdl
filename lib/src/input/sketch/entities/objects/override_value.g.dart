// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'override_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverridableValue _$OverridableValueFromJson(Map<String, dynamic> json) =>
    OverridableValue(
      json['overrideName'] as String?,
      json['do_objectID'] as String?,
      json['value'],
    );

Map<String, dynamic> _$OverridableValueToJson(OverridableValue instance) =>
    <String, dynamic>{
      'overrideName': instance.overrideName,
      'do_objectID': instance.UUID,
      'value': instance.value,
    };
