import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/symbol_node_mixin.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_instance_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../objects/override_value.dart';
import '../style/style.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'symbol_instance.g.dart';

// title: Symbol Instance Layer
// description: Symbol instance layers represent an instance of a symbol master
@JsonSerializable()
class SymbolInstance extends SketchNode implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'symbolInstance';
  final List<OverridableValue>? overrideValues;
  final double? scale;
  String? symbolID;
  final double? verticalSpacing;
  final double? horizontalSpacing;

  @override
  @JsonKey(name: 'frame')
  SketchRect? boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String? UUID;

  @override
  @JsonKey(name: '_class')
  String? type;

  bool? _isVisible;

  Style? _style;

  set isVisible(bool? _isVisible) => this._isVisible = _isVisible;

  @override
  bool? get isVisible => _isVisible;

  set style(_style) => this._style = _style;

  @override
  Style? get style => _style;

  List? parameters;

  SymbolInstance(
      {this.UUID,
      booleanOperation,
      exportOptions,
      SketchRect? this.boundaryRectangle,
      Flow? flow,
      bool? isFixedToViewport,
      bool? isFlippedHorizontal,
      bool? isFlippedVertical,
      bool? isLocked,
      bool? isVisible,
      layerListExpandedType,
      String? name,
      bool? nameIsFixed,
      resizingConstraint,
      resizingType,
      num? rotation,
      sharedStyleID,
      bool? shouldBreakMaskChain,
      bool? hasClippingMask,
      int? clippingMaskMode,
      userInfo,
      Style? style,
      bool? maintainScrollPosition,
      this.overrideValues,
      this.scale,
      this.symbolID,
      this.verticalSpacing,
      this.horizontalSpacing})
      : _isVisible = isVisible,
        _style = style,
        super(
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle,
            flow,
            isFixedToViewport,
            isFlippedHorizontal,
            isFlippedVertical,
            isLocked,
            isVisible,
            layerListExpandedType,
            name,
            nameIsFixed,
            resizingConstraint,
            resizingType,
            rotation?.toDouble(),
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition);

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SymbolInstance.fromJson(json);

  factory SymbolInstance.fromJson(Map<String, dynamic> json) =>
      _$SymbolInstanceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SymbolInstanceToJson(this);

  ///Converting the [OverridableValue] into [PBInstanceOverride] to be processed in intermediate phase.
  // List<PBInstanceOverride> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBInstanceOverride> sharedParameters = [];
  //   for (var overrideValue in overrideValues) {
  //     if (!ovrNames.contains(overrideValue.overrideName)) {
  //       var properties = extractParameter(overrideValue.overrideName);
  //       sharedParameters.add(PBInstanceOverride(
  //           properties['type'],
  //           overrideValue.value,
  //           properties['uuid'],
  //           overrideValue.overrideName));
  //       ovrNames.add(overrideValue.overrideName);
  //     }
  //   }

  //   return sharedParameters;
  // }

  @override
  Future<PBDLNode> interpretNode() {
    var overrides = overrideValues!.map((e) {
      var uuidTypeMap = SymbolNodeMixin.extractParameter(e.overrideName!);

      var ovrVal = SketchOverrideTypeFactory.getType(e);

      if (ovrVal != null) {
        // TODO: update when support for Sketch hits
        // return PBDLOverrideValue(
        //   uuidTypeMap['uuid'],
        //   null, // Cannot assign name since it requires searching for master node
        //   ovrVal.getPBDLType(),
        //   ovrVal.getValue(e),
        // );
      }
    }).toList();

    return Future.value(PBDLSharedInstanceNode(
      UUID: UUID,
      overrideValues: overrides as List<PBDLOverrideValue>?,
      booleanOperation: booleanOperation,
      boundaryRectangle: boundaryRectangle!.interpretFrame(),
      clippingMaskMode: clippingMaskMode,
      exportOptions: exportOptions,
      hasClippingMask: hasClippingMask,
      horizontalSpacing: horizontalSpacing,
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      isVisible: isVisible,
      layerListExpandedType: layerListExpandedType,
      maintainScrollPosition: maintainScrollPosition,
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      resizingType: resizingType,
      rotation: rotation,
      scale: scale,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      style: style!.interpretStyle(),
      symbolID: symbolID,
      userInfo: userInfo,
      verticalSpacing: verticalSpacing,
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
  }
}
