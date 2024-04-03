import '../objects/foreign_symbol.dart';

abstract class AbstractDocument {
  final String CLASS_NAME = 'document';
  final dynamic UUID;
  final dynamic assets;
  final dynamic colorSpace;
  final dynamic currentPageIndex;
  final List? foreignLayerStyles;
  final List<ForeignSymbol>? foreignSymbols;
  final List? foreignTextStyles;
  final dynamic layerStyles;
  final dynamic layerTextStyles;
  final dynamic layerSymbols;
  final List? embeddedFontReferences;
  final bool? autoEmbedFonts;
  final bool? agreedToFontEmbedding;

  AbstractDocument(
      this.UUID,
      this.assets,
      this.colorSpace,
      this.currentPageIndex,
      this.foreignLayerStyles,
      this.foreignSymbols,
      this.foreignTextStyles,
      this.layerStyles,
      this.layerTextStyles,
      this.layerSymbols,
      this.embeddedFontReferences,
      this.autoEmbedFonts,
      this.agreedToFontEmbedding);
}
