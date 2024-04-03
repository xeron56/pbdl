import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'shape_group.g.dart';

// title: Shape Group Layer
// description: Shape groups layers group together multiple shape layers
@JsonSerializable()
class ShapeGroup extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'shapeGroup';
  final dynamic windingRule;
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

  @override
  void set isVisible(bool? _isVisible) => this._isVisible = _isVisible;

  @override
  bool? get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style? get style => _style;

  @override
  @JsonKey(name: 'layers')
  List<SketchNode>? children;

  ShapeGroup(
      {bool? hasClickThrough,
      groupLayout,
      List<SketchNode>? this.children,
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
      this.windingRule})
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
            maintainScrollPosition);

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      ShapeGroup.fromJson(json);
  factory ShapeGroup.fromJson(Map<String, dynamic> json) =>
      _$ShapeGroupFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShapeGroupToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle!.width, boundaryRectangle!.height);

    var ref = SketchAssetProcessor.writeImage(name, image!);

    return Future.value(PBDLImage(
      UUID: UUID,
      booleanOperation: booleanOperation,
      exportOptions: exportOptions,
      boundaryRectangle: boundaryRectangle!.interpretFrame(),
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      isVisible: isVisible,
      layerListExpandedType: layerListExpandedType,
      name: name! + '_${SketchAssetProcessor.imageNames[name]}',
      nameIsFixed: nameIsFixed,
      constraints: resizingConstraint,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      style: style!.interpretStyle(),
      imageReference: ref,
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
    /*
    

    return InheritedShapeGroup(this, name,
        currentContext: currentContext, image: image); */
  }
}
