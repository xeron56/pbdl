import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quick_log/quick_log.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'vector.g.dart';

@JsonSerializable()
class FigmaVector extends FigmaNode implements FigmaNodeFactory {
  @JsonKey(ignore: true)
  Logger log;

  FigmaStyle style;

  String layoutAlign;

  var constraints;

  @override
  @JsonKey(name: 'absoluteBoundingBox')
  var boundaryRectangle;

  var size;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  var styles;
  @override
  String type = 'VECTOR';

  @JsonKey(name: 'fills')
  List fillsList;

  FigmaVector({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    FigmaStyle this.style,
    this.layoutAlign,
    this.constraints,
    FigmaFrame this.boundaryRectangle,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    this.fillsList,
    String UUID,
    num transitionDuration,
    String transitionEasing,
    String prototypeNodeUUID,
  }) : super(
          name,
          visible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          prototypeNodeUUID: prototypeNodeUUID,
        ) {
    pbdfType = 'vector';
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaVector.fromJson(json);
  factory FigmaVector.fromJson(Map<String, dynamic> json) =>
      _$FigmaVectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaVectorToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    /*
    imageReference = FigmaAssetProcessor().processImage(UUID);

    return Future.value(
        InheritedBitmap(this, name, currentContext: currentContext)); */
  }

  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'vector';

  // @override
  // DesignNode createDesignNode(Map<String, dynamic> json) {
  //   // TODO: implement createDesignNode
  //   throw UnimplementedError();
  // }

  // @override
  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   // TODO: implement fromPBDF
  //   throw UnimplementedError();
  // }
}
