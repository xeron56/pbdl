import 'dart:io';

import 'package:parabeac_core/controllers/main_info.dart';
import 'package:parabeac_core/design_logic/design_element.dart';
import 'package:parabeac_core/design_logic/design_node.dart';
import 'package:parabeac_core/design_logic/pb_style.dart';
import 'package:parabeac_core/input/helper/azure_asset_service.dart';
import 'package:parabeac_core/input/sketch/entities/objects/frame.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/inherited_bitmap.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';
import 'package:pbdl/design_logic/pbdl_frame.dart';
import 'package:pbdl/design_logic/pbdl_node.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';
import 'design_element.dart';

class PBDLImage extends DesignElement implements PBDLNodeFactory, PBDLNode {
  @override
  var style;

  PBDLImage({
    this.imageReference,
    UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame boundaryRectangle,
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
    num rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    this.pbdfType = 'image',
    this.style,
  }) : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: boundaryRectangle,
          style: style,
        );

  String imageReference;

  @override
  String pbdfType = 'image';

  @override
  PBDLNode createDesignNode(Map<String, dynamic> json) => fromPBDF(json);

  PBDLNode fromPBDF(Map<String, dynamic> json) {
    return PBDLImage(
      UUID: json['id'] as String,
      booleanOperation: json['booleanOperation'],
      exportOptions: json['exportOptions'],
      boundaryRectangle: json['absoluteBoundingBox'] == null
          ? null
          : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
      isFixedToViewport: json['isFixedToViewport'],
      isFlippedHorizontal: json['isFlippedHorizontal'],
      isFlippedVertical: json['isFlippedVertical'],
      isLocked: json['isLocked'],
      isVisible: json['visible'],
      layerListExpandedType: json['layerListExpandedType'],
      name: json['name'],
      nameIsFixed: json['nameIsFixed'],
      resizingConstraint: json['resizingConstraint'],
      resizingType: json['resizingType'],
      rotation: json['rotation'] as num,
      sharedStyleID: json['sharedStyleID'],
      shouldBreakMaskChain: json['shouldBreakMaskChain'],
      hasClippingMask: json['hasClippingMask'],
      clippingMaskMode: json['clippingMaskMode'],
      userInfo: json['userInfo'],
      maintainScrollPosition: json['maintainScrollPosition'],
      pbdfType: json['pbdfType'],
      style: json['style'] == null
          ? null
          : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
    )
      ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
      ..type = json['type'] as String;
  }

  @override
  Future<PBDLNode> interpretNode() async {
    /* try {
      var img = await AzureAssetService().downloadImage(UUID);
      var file =
          File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
            ..createSync(recursive: true);
      file.writeAsBytesSync(img);
      return Future.value(InheritedBitmap(
        this,
        name,
        currentContext: currentContext,
      ));
    } catch (e) {
      var img = File(
              '${MainInfo().cwd?.path}/lib/input/assets/image-conversion-error.png')
          .readAsBytesSync();
      var file =
          File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
            ..createSync(recursive: true);
      file.writeAsBytesSync(img);
      return Future.value(InheritedBitmap(
        this,
        name,
        currentContext: currentContext,
      ));
    } */
  } 

  @override
  String UUID;

  @override
  var boundaryRectangle;

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  String type;

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toPBDF() {
    // TODO: implement toPBDF
    throw UnimplementedError();
  }
}
