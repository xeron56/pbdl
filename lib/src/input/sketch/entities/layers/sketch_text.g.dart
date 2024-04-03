// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SketchText _$SketchTextFromJson(Map<String, dynamic> json) => SketchText(
      UUID: json['do_objectID'] as String?,
      booleanOperation: json['booleanOperation'],
      exportOptions: json['exportOptions'],
      boundaryRectangle: json['frame'] == null
          ? null
          : SketchRect.fromJson(json['frame'] as Map<String, dynamic>),
      flow: json['flow'] == null
          ? null
          : Flow.fromJson(json['flow'] as Map<String, dynamic>),
      isFixedToViewport: json['isFixedToViewport'] as bool?,
      isFlippedHorizontal: json['isFlippedHorizontal'] as bool?,
      isFlippedVertical: json['isFlippedVertical'] as bool?,
      isLocked: json['isLocked'] as bool?,
      isVisible: json['isVisible'] as bool?,
      layerListExpandedType: json['layerListExpandedType'],
      name: json['name'] as String?,
      nameIsFixed: json['nameIsFixed'] as bool?,
      resizingConstraint: json['resizingConstraint'],
      resizingType: json['resizingType'],
      rotation: (json['rotation'] as num?)?.toDouble(),
      sharedStyleID: json['sharedStyleID'],
      shouldBreakMaskChain: json['shouldBreakMaskChain'] as bool?,
      hasClippingMask: json['hasClippingMask'] as bool?,
      clippingMaskMode: json['clippingMaskMode'] as int?,
      userInfo: json['userInfo'],
      style: json['style'] == null
          ? null
          : Style.fromJson(json['style'] as Map<String, dynamic>),
      maintainScrollPosition: json['maintainScrollPosition'] as bool?,
      attributedString: json['attributedString'],
      automaticallyDrawOnUnderlyingPath:
          json['automaticallyDrawOnUnderlyingPath'] as bool?,
      dontSynchroniseWithSymbol: json['dontSynchroniseWithSymbol'] as bool?,
      lineSpacingBehaviour: json['lineSpacingBehaviour'],
      textBehaviour: json['textBehaviour'],
      glyphBounds: json['glyphBounds'],
    )
      ..CLASS_NAME = json['CLASS_NAME'] as String?
      ..type = json['_class'] as String?;

Map<String, dynamic> _$SketchTextToJson(SketchText instance) =>
    <String, dynamic>{
      'booleanOperation': instance.booleanOperation,
      'exportOptions': instance.exportOptions,
      'flow': instance.flow,
      'isFixedToViewport': instance.isFixedToViewport,
      'isFlippedHorizontal': instance.isFlippedHorizontal,
      'isFlippedVertical': instance.isFlippedVertical,
      'isLocked': instance.isLocked,
      'layerListExpandedType': instance.layerListExpandedType,
      'name': instance.name,
      'nameIsFixed': instance.nameIsFixed,
      'resizingConstraint': instance.resizingConstraint,
      'resizingType': instance.resizingType,
      'rotation': instance.rotation,
      'sharedStyleID': instance.sharedStyleID,
      'shouldBreakMaskChain': instance.shouldBreakMaskChain,
      'hasClippingMask': instance.hasClippingMask,
      'clippingMaskMode': instance.clippingMaskMode,
      'userInfo': instance.userInfo,
      'maintainScrollPosition': instance.maintainScrollPosition,
      'CLASS_NAME': instance.CLASS_NAME,
      'automaticallyDrawOnUnderlyingPath':
          instance.automaticallyDrawOnUnderlyingPath,
      'dontSynchroniseWithSymbol': instance.dontSynchroniseWithSymbol,
      'lineSpacingBehaviour': instance.lineSpacingBehaviour,
      'textBehaviour': instance.textBehaviour,
      'glyphBounds': instance.glyphBounds,
      'frame': instance.boundaryRectangle,
      'do_objectID': instance.UUID,
      '_class': instance.type,
      'isVisible': instance.isVisible,
      'style': instance.style,
      'attributedString': instance.attributedString,
    };
