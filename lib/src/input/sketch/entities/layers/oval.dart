import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'abstract_shape_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'oval.g.dart';

// title: Oval Layer
// description: Oval layers are the result of adding an oval shape to the canvas
@JsonSerializable()
class Oval extends AbstractShapeLayer implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'oval';
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
  Oval(
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
    var oval = Oval.fromJson(json);
    return oval;
  }

  factory Oval.fromJson(Map<String, dynamic> json) => _$OvalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OvalToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle!.width, boundaryRectangle!.height);

    var ref = SketchAssetProcessor.writeImage(name, image!);
    return PBDLImage(
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
    );
  }
}
