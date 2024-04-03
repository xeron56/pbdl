import 'dart:io';
import 'dart:typed_data';
import '../figma/entities/style/figma_effect.dart';
import '../figma/helper/figma_asset_processor.dart';
import '../figma/helper/figma_rect.dart';
import 'azure_asset_service.dart';
import 'package:recase/recase.dart';

abstract class AssetProcessingService {
//dynamic processImage(String uuid);
  //dynamic processImage(String? uuid, {FigmaRect? absoluteBoundingBox, List<FigmaEffect>? effects, IMAGE_FORMAT format = IMAGE_FORMAT.PNG, required String name});

  Future<void> processRootElements(Map uuids);

  AzureAssetService aaService = AzureAssetService();

  static var counter = 1;

  static String getImageName(String name) {
    var newName = name.snakeCase
        .replaceAll(RegExp(r'[^a-zA-Z0-9-_ ]'), '')
        .replaceAll('_', '')
        .replaceAll(' ', '_')
        .replaceAll('/', '_');

    if (newName.isNotEmpty) {
      return newName;
    } else {
      return 'no_name_' + (counter++).toString();
    }
  }

  Future<void> uploadToStorage(Uint8List img, String? name) async {
    if (Platform.environment.containsKey(AzureAssetService.KEY_NAME) &&
        aaService.projectUUID != null) {
      // Upload image to storage

      var cont = await aaService.createContainer(
        aaService.projectUUID,
        img,
      );
      var blob = await aaService.putBlob(
        aaService.projectUUID,
        '${name}.png',
        img,
      );
      await cont.stream.drain();
      await blob.stream.drain();
    }
  }
}
