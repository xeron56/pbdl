// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitmap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bitmap _$BitmapFromJson(Map<String, dynamic> json) => Bitmap(
      fillReplacesImage: json['fillReplacesImage'] as bool?,
      intendedDPI: json['intendedDPI'] as int?,
      clippingMask: json['clippingMask'],
      UUID: json['do_objectID'] as String?,
      booleanOperation: json['booleanOperation'],
      exportOptions: json['exportOptions'],
      boundaryRectangle: json['frame'] == null
          ? null
          : SketchRect.fromJson(json['frame'] as Map<String, dynamic>),
      flow: json['flow'] == null
          ? null
          : Flow.fromJson(json['flow'] as Map<String, dynamic>),
      isFixedToViewport: json['isFixedToViewport'],
      isFlippedHorizontal: json['isFlippedHorizontal'],
      isFlippedVertical: json['isFlippedVertical'],
      isLocked: json['isLocked'],
      isVisible: json['isVisible'],
      layerListExpandedType: json['layerListExpandedType'],
      name: json['name'],
      nameIsFixed: json['nameIsFixed'],
      resizingConstraint: json['resizingConstraint'],
      resizingType: json['resizingType'],
      rotation: json['rotation'] as num?,
      sharedStyleID: json['sharedStyleID'],
      shouldBreakMaskChain: json['shouldBreakMaskChain'],
      hasClippingMask: json['hasClippingMask'],
      clippingMaskMode: json['clippingMaskMode'],
      userInfo: json['userInfo'],
      style: json['style'] == null
          ? null
          : Style.fromJson(json['style'] as Map<String, dynamic>),
      maintainScrollPosition: json['maintainScrollPosition'],
      imageReferenceMap: json['image'] as Map<String, dynamic>? ?? const {},
    )
      ..CLASS_NAME = json['CLASS_NAME'] as String?
      ..type = json['_class'] as String?;

Map<String, dynamic> _$BitmapToJson(Bitmap instance) => <String, dynamic>{
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
      'fillReplacesImage': instance.fillReplacesImage,
      'intendedDPI': instance.intendedDPI,
      'clippingMask': instance.clippingMask,
      'frame': instance.boundaryRectangle,
      'do_objectID': instance.UUID,
      'image': instance.imageReferenceMap,
      '_class': instance.type,
      'isVisible': instance.isVisible,
      'style': instance.style,
    };
