import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_component_property_definition_factory.dart';
import 'package:pbdl/src/input/figma/helper/properties/figma_component_property.dart';

part 'figma_component_property_definition.g.dart';

@JsonSerializable(createFactory: false)
abstract class ComponentPropertyDefinition
    implements ComponentPropertyDefinitionFactory, ComponentProperty {
  String propertyName;

  var defaultValue;

  List<String> variantOptions;

  factory ComponentPropertyDefinition.fromJson(Map<String, dynamic> json) {
    return ComponentPropertyDefinitionFactory.getType(json);
  }

  ComponentPropertyDefinition getType(Map<String, dynamic> json);
}