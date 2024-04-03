import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:pbdl/src/input/general_helper/asset_processing_service.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:quick_log/quick_log.dart';
import 'package:path/path.dart' as p;

class SketchAssetProcessor extends AssetProcessingService {
  final svg_convertion_endpoint =
      Platform.environment.containsKey('SAC_ENDPOINT')
          ? Platform.environment['SAC_ENDPOINT']
          : 'http://localhost:4000/vector/local';

  Logger log = Logger('Image conversion');

  SketchAssetProcessor._internal();

  static final SketchAssetProcessor _instance =
      SketchAssetProcessor._internal();

  factory SketchAssetProcessor() => _instance;

  String getBlobName(String path) => path.split('/').last;

  /// Converts an svg with `uuid` from a sketch file to a png with specified
  /// `width` and `height`
  @override
  Future<Uint8List?> processImage(String? uuid, [num? width, num? height]) async {
    try {
      var body = Platform.environment.containsKey('SAC_ENDPOINT')
          ? {
              'uuid': uuid,
              'width': width,
              'height': height,
              'blob': getBlobName(MainInfo().sketchPath!),
              'container': 'design-file'
            }
          : {
              'uuid': uuid,
              'path': MainInfo().sketchPath,
              'width': width,
              'height': height
            };

      var response = await http
          .post(
            Uri.parse(svg_convertion_endpoint!),
            headers: {HttpHeaders.contentTypeHeader: 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(Duration(minutes: 1));

      if (response.statusCode >= 400) {
        var bodyMap = jsonDecode(response.body);
        log.error(bodyMap['error']);
      }

      return response?.bodyBytes;
    } catch (e, stackTrace) {
      var imageErr = File(
              '${MainInfo().cwd.path}/lib/src/input/assets/image-conversion-error.png')
          .readAsBytesSync();
      log.error(e.toString());
      return imageErr;
    }
  }

  @override
  Future<void> processRootElements(Map uuids) async {
    for (var entry in uuids.entries) {
      var image = await processImage(
          entry.key, uuids[entry.key]['width'], uuids[entry.key]['height']);
      await super.uploadToStorage(image!, entry.key);
    }
  }

  static Map<String?, int> imageNames = {};

  

  static String? _getImageName(String? name) {
  if (name == null) return null; // Return null early if name is null.

  if (!imageNames.containsKey(name)) {
    imageNames[name] = 0;
    return name; // Safe to return as is because name is checked for null.
  } else {
    var imageNumber = imageNames[name]! + 1; // Use ! to assert non-null and increment.
    imageNames[name] = imageNumber; // Update the map with the new number.
    return '$name\_$imageNumber'; // Use the non-null name directly.
  }
}


  /// Writes image `bytes` to output png path using `name` as filename.
  static String writeImage(String? name, Uint8List bytes) {
    if (!Platform.environment.containsKey('SAC_ENDPOINT')) {
      var checkedName = _getImageName(name);
      var path = p.join(MainInfo().pngPath!, '$checkedName.png');
      File(path).writeAsBytesSync(bytes);
      return path;
    }
    return '';
  }
}
