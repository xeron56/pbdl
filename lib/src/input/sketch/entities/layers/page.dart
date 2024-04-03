import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_page.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'page.g.dart';

// title: Page Layer
// description:
//   Page layers are the top level organisational abstraction within a document
@JsonSerializable()
class Page extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  String? CLASS_NAME = 'page';
  dynamic includeInCloudUpload;
  dynamic horizontalRulerData;
  dynamic verticalRulerData;
  dynamic layout;
  dynamic grid;

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
  @JsonKey(name: 'layers')
  List<SketchNode>? children;

  @override
  void set isVisible(bool? _isVisible) => this._isVisible = _isVisible;

  @override
  bool? get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style? get style => _style;

  Page(
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
      maintainScrollPosition})
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
  SketchNode createSketchNode(Map<String, dynamic> json) => Page.fromJson(json);
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    return Future.value(PBDLPage(
      name: name,
      UUID: UUID,
      screens:
          await Future.wait(children!.map((e) => e.interpretNode()).toList()),
    ));
  }
}
