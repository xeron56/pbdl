import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_star.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'abstract_shape_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'star.g.dart';

// title: Star Layer
// description: Star layers are the result of adding an star shape to the canvas
@JsonSerializable()
class Star extends AbstractShapeLayer implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'star';
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
  Star(
      {bool? edited,
      bool? isClosed,
      pointRadiusBehaviour,
      List? points,
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
      maintainScrollPosition})
      : _isVisible = isVisible,
        _style = style,
        super(
            edited,
            isClosed,
            pointRadiusBehaviour,
            points,
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
  SketchNode createSketchNode(Map<String, dynamic> json) {
    var star = Star.fromJson(json);
    return star;
  }

  factory Star.fromJson(Map<String, dynamic> json) => _$StarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StarToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    return Future.value(PBDLStar(
      edited: edited,
      isClosed: isClosed,
      pointRadiusBehaviour: pointRadiusBehaviour,
      points: points,
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
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      resizingType: resizingType,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      style: style!.interpretStyle(),
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
    /*
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle.width, boundaryRectangle.height);

    return Future.value(InheritedStar(this, name,
        currentContext: currentContext, image: image)); */
  }
}
