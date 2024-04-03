import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/symbol_node_mixin.dart';
import 'package:pbdl/src/input/general_helper/input_formatter.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_master_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../objects/override_property.dart';
import '../style/color.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'symbol_master.g.dart';

// title: Symbol Master Layer
// description: A symbol master layer represents a reusable group of layers
@JsonSerializable()
class SymbolMaster extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'symbolMaster';
  final Color? backgroundColor;
  final bool? hasBackgroundColor;
  final dynamic horizontalRulerData;
  final bool? includeBackgroundColorInExport;
  final bool? includeInCloudUpload;
  final bool? isFlowHome;
  final bool? resizesContent;
  final dynamic verticalRulerData;
  final bool? includeBackgroundColorInInstance;
  String? symbolID;
  final int? changeIdentifier;
  final bool? allowsOverrides;
  final List<OverridableProperty>? overrideProperties;
  final dynamic presetDictionary;
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

  @override
  @JsonKey(name: 'layers')
  List<SketchNode>? children;

  SymbolMaster(
      {bool? hasClickThrough,
      groupLayout,
      this.children,
      this.UUID,
      booleanOperation,
      exportOptions,
      SketchRect? this.boundaryRectangle,
      Flow? flow,
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
      rotation,
      sharedStyleID,
      shouldBreakMaskChain,
      hasClippingMask,
      clippingMaskMode,
      userInfo,
      Style? style,
      maintainScrollPosition,
      this.backgroundColor,
      this.hasBackgroundColor,
      this.horizontalRulerData,
      this.includeBackgroundColorInExport,
      this.includeInCloudUpload,
      this.isFlowHome,
      this.resizesContent,
      this.verticalRulerData,
      this.includeBackgroundColorInInstance,
      this.symbolID,
      this.changeIdentifier,
      this.allowsOverrides,
      this.overrideProperties,
      this.presetDictionary})
      : _isVisible = isVisible,
        _style = style,
        super(
            hasClickThrough,
            groupLayout,
            children,
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
            rotation,
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition) {
    if (name != null) {
      this.name = name?.replaceAll(RegExp(r'[\s_\+]'), '');
      this.name = PBInputFormatter.removeFirstDigits(name);
    }
  }

  List? parameters;

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SymbolMaster.fromJson(json);
  factory SymbolMaster.fromJson(Map<String, dynamic> json) =>
      _$SymbolMasterFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SymbolMasterToJson(this);

  ///Converting the [OverridableProperty] into [PBMasterOverride] to be processed in intermediate phase.
  // List<PBMasterOverride> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBMasterOverride> sharedParameters = [];
  //   for (var prop in overrideProperties) {
  //     if (!ovrNames.contains(prop.overrideName)) {
  //       var properties = AddMasterSymbolName(prop.overrideName, children);
  //       sharedParameters.add(PBMasterOverride(
  //           properties['name'],
  //           properties['type'],
  //           null,
  //           prop.canOverride,
  //           prop.overrideName,
  //           properties['uuid'],
  //           properties['default_value']));
  //       ovrNames.add(prop.overrideName);
  //     }
  //   }
  //   return sharedParameters;
  // }

  @override
  Future<PBDLNode> interpretNode() async {
    var overrideProps =
        await Future.wait(overrideProperties!.map((element) async {
      // Extract UUID and type from override name
      var uuidTypeMap = SymbolNodeMixin.extractParameter(element.overrideName!);
      // Get the OverrideType of the element
      var ovrType = SketchOverrideTypeFactory.getType(element);

      // Find the child that contains the default value
      var overrideChild = _traverseChildrenForOverride(uuidTypeMap['uuid']);

      if (ovrType != null && overrideChild != null) {
        return PBDLOverrideProperty(
          uuidTypeMap['uuid'],
          overrideChild.name!,
          ovrType.getPBDLType(), // Map SketchOverrideType to PBDLOverrideType
          await ovrType
              .getProperty(overrideChild), // Get default value from child
        );
      }
      return null;
    }));
    overrideProps.removeWhere((element) => element == null);
     
    return Future.value(PBDLSharedMasterNode(
      UUID: UUID,
      allowsOverrides: allowsOverrides,
      overrideProperties: overrideProps as  List<PBDLOverrideProperty>,
      booleanOperation: booleanOperation,
      boundaryRectangle: boundaryRectangle!.interpretFrame(),
      changeIdentifier: changeIdentifier,
      clippingMaskMode: clippingMaskMode,
      exportOptions: exportOptions,
      groupLayout: groupLayout,
      hasBackgroundColor: hasBackgroundColor,
      hasClickThrough: hasClickThrough,
      hasClippingMask: hasClippingMask,
      horizontalRulerData: horizontalRulerData,
      includeBackgroundColorInExport: includeBackgroundColorInExport,
      includeBackgroundColorInInstance: includeBackgroundColorInInstance,
      isLocked: isLocked,
      isVisible: isVisible,
      name: name,
      nameIsFixed: nameIsFixed,
      verticalRulerData: verticalRulerData,
      sharedStyleID: sharedStyleID,
      symbolID: symbolID,
      userInfo: userInfo,
      style: style!.interpretStyle(),
      shouldBreakMaskChain: shouldBreakMaskChain,
      rotation: rotation,
      resizingType: resizingType,
      constraints: resizingConstraint,
      resizesContent: resizesContent,
      presetDictionary: presetDictionary,
      maintainScrollPosition: maintainScrollPosition,
      layerListExpandedType: layerListExpandedType,
      isFlowHome: isFlowHome,
      isFlippedVertical: isFlippedVertical,
      isFlippedHorizontal: isFlippedHorizontal,
      includeInCloudUpload: includeInCloudUpload,
      isFixedToViewport: isFixedToViewport,
      parameters: parameters,
      children: await Future.wait(
          children!.map((e) async => await e.interpretNode()).toList()),
    ));
  }

  /// Searches `children` for a [SketchNode] with given `UUID`
  SketchNode? _traverseChildrenForOverride(String? UUID) {
    var stack = List.from(children!);

    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      if (current.UUID == UUID) {
        return current;
      }

      if (current is AbstractGroupLayer) {
        current.children!.forEach(stack.add);
      }
    }
    return null;
  }
}
