// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      json['pages'] as List<dynamic>?,
      json['UUID'],
      json['assets'],
      json['colorSpace'],
      json['currentPageIndex'],
      json['foreignLayerStyles'] as List<dynamic>?,
      (json['foreignSymbols'] as List<dynamic>?)
          ?.map((e) => ForeignSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['foreignTextStyles'] as List<dynamic>?,
      json['layerStyles'],
      json['layerTextStyles'],
      json['layerSymbols'],
      json['embeddedFontReferences'] as List<dynamic>?,
      json['autoEmbedFonts'] as bool?,
      json['agreedToFontEmbedding'] as bool?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'assets': instance.assets,
      'colorSpace': instance.colorSpace,
      'currentPageIndex': instance.currentPageIndex,
      'foreignLayerStyles': instance.foreignLayerStyles,
      'foreignSymbols': instance.foreignSymbols,
      'foreignTextStyles': instance.foreignTextStyles,
      'layerStyles': instance.layerStyles,
      'layerTextStyles': instance.layerTextStyles,
      'layerSymbols': instance.layerSymbols,
      'embeddedFontReferences': instance.embeddedFontReferences,
      'autoEmbedFonts': instance.autoEmbedFonts,
      'agreedToFontEmbedding': instance.agreedToFontEmbedding,
      'pages': instance.pages,
    };
